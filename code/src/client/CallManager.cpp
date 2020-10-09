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
    this->_section = window->getCallSection();
    this->_me = me;
    this->_inCall = CONTACT_NULL;
    this->_requestingCall = CONTACT_NULL;
    this->_waitingForResponse = CONTACT_NULL;
    this->_state = CallManager::NONE;
    this->_audio = nullptr;
    this->_opus = nullptr;
    this->_receiver = nullptr;
    this->_sender = nullptr;
    this->setupQuerySocketing(window);
}

CallManager::~CallManager()
{
    if (this->_audio && this->_opus) {
        delete this->_audio;
        delete this->_opus;
    }
    this->_querySocket->close();
    delete this->_querySocket;
}

void CallManager::setupQuerySocketing(Window *window)
{
    this->_querySocket = new QUdpSocket(this);
    this->_querySocket->bind(QHostAddress(_me.getIp().c_str()), 4242);
    connect(_querySocket, SIGNAL(readyRead()), this, SLOT(onDataReceived()));
    connect(_section, SIGNAL(hangupEvt()), this, SLOT(sendStopCall()));
    connect(_section, SIGNAL(acceptEvt()), this, SLOT(sendConfirmCall()));
    connect(window->getContactList(), SIGNAL(startEvt(const Contact &)), this, SLOT(sendStartCall(const Contact &)));
}

void CallManager::setupAudio()
{
    this->_audio = new Audio();
    this->_opus = new Opus(_audio->getSampleRate(),
                           _audio->getBufferSize(),
                           _audio->getChannelNb());
}

void CallManager::setupSoundSockets(int readOn, int sendOn)
{
    this->_sender = new UdpSoundIO(this,
    Contact(_me.getIp(), _me.getName(), sendOn),
    Contact(_inCall.getIp(), _inCall.getName(), sendOn));
    this->_receiver = new UdpSoundIO(this,
    Contact(_me.getIp(), _me.getName(), readOn),
    Contact(_inCall.getIp(), _inCall.getName(), readOn));
}

Audio* CallManager::getAudio() const
{
    return this->_audio;
}

Opus* CallManager::getOpus() const
{
    return this->_opus;
}

CallManager::State CallManager::getState() const
{
    return this->_state;
}

//region "Sender"
void CallManager::sendStartCall(const Contact &contact)
{
    QByteArray data;

    if (_state == NONE) {
        _state = WAITING_FOR_RESPONSE;
        _waitingForResponse = contact;
    }
    else {
        QMessageBox::warning(this, "Call", QString("You are already in a call."));
        return;
    }
    data.append(UdpSerializeQuery(UdpQuery(UdpQuery::START_CALL, _me)).c_str());
    this->_querySocket->writeDatagram(data, QHostAddress(contact.getIp().c_str()), contact.getPort());
    this->_section->setState(_state, contact);
}

void CallManager::sendConfirmCall()
{
    QByteArray data;

    this->_inCall = this->_requestingCall;
    this->_state = IN_CALL;
    data.append(UdpSerializeQuery(UdpQuery(UdpQuery::CONFIRM_CALL, _me)).c_str());
    this->_querySocket->writeDatagram(data, QHostAddress(_inCall.getIp().c_str()), _inCall.getPort());
    this->_section->setState(_state, _inCall);
    this->setupAudio();
    this->setupSoundSockets(4444, 4343);
    //TEMPORARY
    this->_receiver->createSocket();
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
    this->_querySocket->writeDatagram(data, QHostAddress(receiver.getIp().c_str()), receiver.getPort());
    this->_inCall = CONTACT_NULL;
    this->_requestingCall = CONTACT_NULL;
    this->_waitingForResponse = CONTACT_NULL;
    this->_state = NONE;
    this->_section->setState(_state);
}

void CallManager::sendCancelCall(const Contact& contact)
{
    QByteArray data;

    data.append(UdpSerializeQuery(UdpQuery(UdpQuery::CANCEL_CALL, _me)).c_str());
    this->_querySocket->writeDatagram(data, QHostAddress(contact.getIp().c_str()), contact.getPort());
}

//endregion

//region "Receiver"
void CallManager::receiveStartCall(const Contact &sender)
{
    QByteArray data;

    if (_state == IN_CALL || _state == RECEIVING_CALL) {
        this->sendCancelCall(sender);
        QMessageBox::critical(this, "Call", QString("%1 (%2:%3) tried to call you.")
        .arg(sender.getName().c_str()).arg(sender.getIp().c_str()).arg(sender.getPort()));
        return;
    }
    this->_state = RECEIVING_CALL;
    this->_requestingCall = sender;
    this->_section->setState(_state, this->_requestingCall);
}

void CallManager::receiveConfirmCall(const Contact &sender)
{
    this->_state = IN_CALL;
    this->_inCall = sender;
    this->_section->setState(_state, sender);
    this->setupAudio();
    this->setupSoundSockets(4343, 4444);
    //TEMPORARY
    this->_sender->createSocket();
    this->_sender->recordAndSend();
}

void CallManager::receiveStopCall(const Contact &sender)
{
    this->_inCall = CONTACT_NULL;
    this->_requestingCall = CONTACT_NULL;
    this->_waitingForResponse = CONTACT_NULL;
    this->_state = NONE;
    this->_section->setState(_state);
}

void CallManager::receiveCancelCall(const Contact& sender)
{
    if (this->_state == CallManager::WAITING_FOR_RESPONSE && this->_waitingForResponse == sender) {
        this->_inCall = CONTACT_NULL;
        this->_requestingCall = CONTACT_NULL;
        this->_waitingForResponse = CONTACT_NULL;
        this->_state = NONE;
        this->_section->setState(_state);
        QMessageBox::critical(this, "Call", QString("%1 (%2:%3) is busy.")
        .arg(sender.getName().c_str()).arg(sender.getIp().c_str()).arg(sender.getPort()));
    }
}
//endregion

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
            break;
        case UdpQuery::CANCEL_CALL:
            this->receiveCancelCall(data.getSender());
            break;
        default:
            break;
    }
}

void CallManager::onDataReceived()
{
    QByteArray buffer;
    QHostAddress sender;
    quint16 senderPort;

    buffer.resize(this->_querySocket->pendingDatagramSize());
    _querySocket->readDatagram(buffer.data(), buffer.size(), &sender, &senderPort);
    handleQueries(std::string(buffer.data()));
}