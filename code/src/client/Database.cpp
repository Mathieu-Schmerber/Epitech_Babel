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
    if(this->_socket->isOpen())
        this->_socket->close();
}

void Database::connect()
{
    QString errorMsg;

    this->_socket->abort();
    this->_socket->connectToHost(QString(this->_ip.c_str()), this->_port);
    if (!this->_socket->waitForConnected()) {
        errorMsg = QString("%1.").arg(_socket->errorString());
        QMessageBox::critical(this, "Database", errorMsg);
        throw ServerError(errorMsg.toUtf8().constData());
    }
}

void Database::onDataReceived()
{
    TcpQuery query(TcpQuery::QueryType::CLIENT_LIST);
    std::string parsed;
    auto senderSocket = dynamic_cast<QTcpSocket*>(sender());

    if (senderSocket) {
        parsed = std::string(senderSocket->readAll().data());
        emit dbUpdateEvt(TcpDeserializeQuery(parsed).getData());
        std::cout << "[Info] the database has been updated." << std::endl;
    }
}

void Database::onServerClosed()
{
    _socket->deleteLater();
    _socket = nullptr;
    QMessageBox::information(this,"Database", QString("Disconnected from server."));
}