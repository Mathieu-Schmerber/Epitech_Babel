/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Database
*/

#include <iostream>
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
        throw ServerError(errorMsg.toStdString());
    }
}

std::vector<Contact *> Database::getContactList()
{
    std::vector<Contact *> tmp;

    this->_socket->connectToHost(QString(this->_ip.c_str()), this->_port);
    for (int i = 0; i < 30; ++i)
        tmp.push_back(new Contact("127.0.0.1", std::to_string(i)));
    return tmp;
}

void Database::onDataReceived()
{
    auto senderSocket = dynamic_cast<QTcpSocket*>(sender());

    if (senderSocket)
        qDebug() << senderSocket->readAll();
}

void Database::onServerClosed()
{
    _socket->deleteLater();
    _socket = nullptr;
    QMessageBox::information(this,"Database", QString("Disconnected from server."));
}