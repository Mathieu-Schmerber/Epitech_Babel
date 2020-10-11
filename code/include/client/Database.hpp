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
Q_OBJECT
	private:
        const std::string _ip;
        const int _port;
        QTcpSocket *_socket;
        Contact _me;

    public slots:
        void onDataReceived();
        void onServerClosed();

    signals:
        void dbUpdateEvt(const std::vector<Contact> &);

    public:
        explicit Database(const std::string &ip, const int &port, QWidget *parent);
        ~Database();

        void connect(const Contact& me);
        void disconnect(const Contact& me);
};

#endif
