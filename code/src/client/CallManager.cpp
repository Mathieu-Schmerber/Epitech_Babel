/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** CallManager
*/

#include <iostream>
#include <QtWidgets/QMessageBox>
#include "CallManager.hpp"
#include "Window.hpp"

CallManager::CallManager(Window *window, int socketPort) : QWidget(window)
{
    this->_window = window;
    this->_section = window->getCallSection();
    this->_socket = new QUdpSocket(this);
    this->_inCall = nullptr;

    this->_socket->bind(QHostAddress("127.0.0.1"), socketPort);
    connect(_socket, SIGNAL(readyRead()), this, SLOT(onDataReceived()));
    connect(_section, SIGNAL(hangupEvt()), this, SLOT(stopCall()));
    connect(_section, SIGNAL(acceptEvt()), this, SLOT(confirmCall()));
    connect(window->getContactList(), SIGNAL(startEvt(Contact *)), this, SLOT(startCall(Contact *)));
}

CallManager::~CallManager()
{
    this->_socket->close();
}

void CallManager::startCall(Contact *contact)
{
    QByteArray data;

    data.append("start");
    this->_inCall = new Contact(*contact);
    this->_socket->writeDatagram(data, QHostAddress(contact->getIp().c_str()), contact->getPort());
    this->_section->setState(QtCallSection::CALLING, contact);
}

void CallManager::receiveCall(Contact *sender)
{
    QByteArray data;

    /*if (this->_inCall != nullptr) {
        data.append("cancel");
        this->_socket->writeDatagram(data, QHostAddress(sender->getIp().c_str()), sender->getPort());
        return;
    }*/
    this->_inCall = sender;
    this->_section->setState(QtCallSection::GETTING_CALL, sender);
}

void CallManager::stopCall()
{
    QByteArray data;

    data.append("stop");
    this->_socket->writeDatagram(data, QHostAddress(_inCall->getIp().c_str()), _inCall->getPort());
    this->_section->setState(QtCallSection::NO_CALL);
}

void CallManager::confirmCall()
{
    QByteArray data;

    data.append("confirm");
    this->_socket->writeDatagram(data, QHostAddress(_inCall->getIp().c_str()), _inCall->getPort());
    this->_section->setState(QtCallSection::IN_CALL);
}

void CallManager::onDataReceived()
{
    QByteArray buffer;
    QHostAddress sender;
    quint16 senderPort;

    buffer.resize(this->_socket->pendingDatagramSize());
    _socket->readDatagram(buffer.data(), buffer.size(), &sender, &senderPort);
    if (std::string(buffer.data()) == "start")
        this->receiveCall(new Contact("", sender.toString().toUtf8().constData(), senderPort));
    else if (std::string(buffer.data()) == "confirm")
        this->_section->setState(QtCallSection::IN_CALL);
    else if (std::string(buffer.data()) == "stop") {
        this->_section->setState(QtCallSection::NO_CALL);
    }
}