/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Database
*/

#ifndef CPP_Database_HPP
#define CPP_Database_HPP

#include <string>
#include <vector>
#include <QtNetwork/QTcpSocket>
#include <QtWidgets/QtWidgets>
#include "Contact.hpp"

class Database : public QWidget
{
	private:
        const std::string _ip;
        const int _port;
        QTcpSocket *_socket;

private slots:
    void onSocketError(QAbstractSocket::SocketError socketError);
    void onDataReceived();


public:
		Database(const std::string &ip, const int &port, QWidget *parent);
		~Database() = default;

		std::vector<Contact *> getContactList();
};

#endif
