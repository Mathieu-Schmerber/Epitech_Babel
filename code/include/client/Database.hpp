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

QT_BEGIN_NAMESPACE
class QPushButton;
class QTcpSocket;
QT_END_NAMESPACE

class Database : public QWidget
{
Q_OBJECT
	private:
        const std::string _ip;
        const int _port;
        QTcpSocket *_socket;


    public slots:
        void onDataReceived();
        void onServerClosed();

    public:
        explicit Database(const std::string &ip, const int &port, QWidget *parent);
        ~Database();

        void connect();
        std::vector<Contact *> getContactList();
};

#endif
