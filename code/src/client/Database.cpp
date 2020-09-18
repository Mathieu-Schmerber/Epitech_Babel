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
    this->_socket = new QTcpSocket();
    QObject::connect(_socket, &QIODevice::readyRead, this, &Database::onDataReceived);
}

std::vector<Contact *> Database::getContactList()
{
    // Call server and receive list
    std::vector<Contact *> tmp;

    this->_socket->connectToHost(QString(this->_ip.c_str()), this->_port);
    for (int i = 0; i < 30; ++i)
        tmp.push_back(new Contact("127.0.0.1", std::to_string(i)));
    return tmp;
}

void Database::onDataReceived()
{
    std::cout << "data received !" << std::endl;
}

void Database::onSocketError(QAbstractSocket::SocketError socketError)
{

}