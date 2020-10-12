/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Database
*/

#include <iostream>
#include "TcpQuery.hpp"
#include "Database.hpp"
#include "Error.hpp"

Database::Database(const std::string &ip, const int &port, QWidget *parent)
:  _ip(ip), _port(port), QWidget(parent)
{
    this->_socket = new QTcpSocket(this);
    QObject::connect(_socket,SIGNAL(readyRead()),this,SLOT(onDataReceived()));
    QObject::connect(_socket,SIGNAL(disconnected()),this,SLOT(onServerClosed()));
}

Database::~Database()
{
    if (this->_socket && this->_socket->isOpen())
    {
        this->_socket->close();
        this->_socket->deleteLater();
    }
}

/**
 * @brief Connects the client to the server.
 * @param me The client to connect as a Contact.
*/
void Database::connect(const Contact& me)
{
    QString errorMsg;

    this->_socket->abort();
    this->_socket->connectToHost(QString(this->_ip.c_str()), this->_port);
    if (!this->_socket->waitForConnected()) {
        errorMsg = QString("%1.").arg(_socket->errorString());
        QMessageBox::critical(this, "Database", errorMsg);
        throw ServerError(errorMsg.toUtf8().constData());
    } else {
        TcpQuery query(TcpQuery::CONNECT);

        query.addLine(me);
        this->_socket->write(TcpSerializeQuery(query).c_str());
        this->_me = me;
    }
}

/**
 * @brief Disconnects the client from the server.
 * @param me The client to disconnect as a Contact.
*/
void Database::disconnect(const Contact& me)
{
    TcpQuery query(TcpQuery::QueryType::DISCONNECT);

    if (this->_socket != nullptr) {
        query.addLine(me);
        this->_socket->write(TcpSerializeQuery(query).c_str());
        while (this->_socket)
            QCoreApplication::processEvents();
    }
}

/**
 * @brief Called when there is new data to read on the TCP socket.
*/
void Database::onDataReceived()
{
    TcpQuery query(TcpQuery::QueryType::CLIENT_LIST);
    std::string parsed;
    auto senderSocket = dynamic_cast<QTcpSocket*>(sender());

    if (senderSocket) {
        parsed = std::string(senderSocket->readAll().data());
        query = TcpDeserializeQuery(parsed);
        switch (query.getType())
        {
        case TcpQuery::QueryType::CLIENT_LIST:
            emit dbUpdateEvt(query.getData());
            break;
        case TcpQuery::QueryType::DISCONNECT:
            this->onServerClosed();
            break;
        case TcpQuery::QueryType::DENIED:
            this->onConnectionRefused();
            break;
        }
    }
}

/**
 * @brief Called when the server refuses the client's connection.
*/
void Database::onConnectionRefused()
{
    QMessageBox::critical(this, "Connection refused.", QString("Someone with the same IP and PORT is already connected."));
}

/**
 * @brief Called when the server closes.
*/
void Database::onServerClosed()
{
    _socket->deleteLater();
    _socket = nullptr;
    QMessageBox::information(this,"Database", QString("Disconnected from server."));
}