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
#include "UdpQuery.hpp"

const Contact CONTACT_NULL = Contact("", "", -1);

CallManager::CallManager(Window *window, const Contact &me) : QWidget(window)
{
    this->_window = window;
    this->_section = window->getCallSection();
    this->_socket = new QUdpSocket(this);
    this->_me = me;
    this->_inCall = CONTACT_NULL;
    this->_requestingCall = CONTACT_NULL;
    this->_waitingForResponse = CONTACT_NULL;
    this->_state = NONE;
    this->_socket->bind(QHostAddress(me.getIp().c_str()), me.getPort());
    connect(_socket, SIGNAL(readyRead()), this, SLOT(onDataReceived()));
    connect(_section, SIGNAL(hangupEvt()), this, SLOT(sendStopCall()));
    connect(_section, SIGNAL(acceptEvt()), this, SLOT(sendConfirmCall()));
    connect(window->getContactList(), SIGNAL(startEvt(const Contact &)), this, SLOT(sendStartCall(const Contact &)));
}

CallManager::~CallManager()
{
    this->_socket->close();
}

void CallManager::sendStartCall(const Contact &contact)
{
    QByteArray data;

    if (_state == NONE) {
        _state = WAITING_FOR_RESPONSE;
        _waitingForResponse = contact;
    } else // TODO: show error box "Already in a call.";
        return;
    data.append(UdpSerializeQuery(UdpQuery(UdpQuery::START_CALL, _me)).c_str());
    this->_socket->writeDatagram(data, QHostAddress(contact.getIp().c_str()), contact.getPort());
    this->_section->setState(_state, contact);
}

void CallManager::sendStopCall()
{
    QByteArray data;
    Contact receiver;

    switch (this->_state) {
        case IN_CALL:
            receiver = this->_inCall;
            break;
        case WAITING_FOR_RESPONSE:
            receiver = this->_waitingForResponse;
            break;
        case RECEIVING_CALL:
            receiver = this->_requestingCall;
            break;
        default:
            return;
    }
    data.append(UdpSerializeQuery(UdpQuery(UdpQuery::STOP_CALL, _me)).c_str());
    this->_socket->writeDatagram(data, QHostAddress(receiver.getIp().c_str()), receiver.getPort());
    this->_inCall = CONTACT_NULL;
    this->_requestingCall = CONTACT_NULL;
    this->_waitingForResponse = CONTACT_NULL;
    this->_state = NONE;
    this->_section->setState(_state);
}

void CallManager::sendConfirmCall()
{
    QByteArray data;

    this->_inCall = this->_requestingCall;
    this->_state = IN_CALL;
    data.append(UdpSerializeQuery(UdpQuery(UdpQuery::CONFIRM_CALL, _me)).c_str());
    this->_socket->writeDatagram(data, QHostAddress(_inCall.getIp().c_str()), _inCall.getPort());
    this->_section->setState(_state, _inCall);
}

void CallManager::receiveStartCall(const Contact &sender)
{
    QByteArray data;

    if (_state == IN_CALL || _state == RECEIVING_CALL) // TODO: Send a Cancel query
        return;
    this->_state = RECEIVING_CALL;
    this->_requestingCall = sender;
    this->_section->setState(_state, this->_requestingCall);
}

void CallManager::receiveConfirmCall(const Contact &sender)
{
    this->_state = IN_CALL;
    this->_inCall = sender;
    this->_section->setState(_state, sender);
}

void CallManager::receiveStopCall(const Contact &sender)
{
    this->_inCall = CONTACT_NULL;
    this->_requestingCall = CONTACT_NULL;
    this->_waitingForResponse = CONTACT_NULL;
    this->_state = NONE;
    this->_section->setState(_state);
}

void CallManager::handleQueries(const std::string &query)
{
    UdpQuery data = UdpDeserializeQuery(query);

    switch (data.getType()) {
        case UdpQuery::START_CALL:
            this->receiveStartCall(data.getSender());
            break;
        case UdpQuery::CONFIRM_CALL:
            this->receiveConfirmCall(data.getSender());
            break;
        case UdpQuery::STOP_CALL:
            this->receiveStopCall(data.getSender());
        default:
            break;
    }
}

void CallManager::onDataReceived()
{
    QByteArray buffer;
    QHostAddress sender;
    quint16 senderPort;

    buffer.resize(this->_socket->pendingDatagramSize());
    _socket->readDatagram(buffer.data(), buffer.size(), &sender, &senderPort);
    handleQueries(std::string(buffer.data()));
}