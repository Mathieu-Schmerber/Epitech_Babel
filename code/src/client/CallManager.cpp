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
const int PORT_OPT_1 = 4444;
const int PORT_OPT_2 = 4343;

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
    this->_sThread = nullptr;
    this->_rThread = nullptr;
    this->setupQuerySocketing(window);
}

CallManager::~CallManager()
{
    if (this->_audio && this->_opus) {
        delete this->_audio;
        delete this->_opus;
    }
    this->_querySocket->close();
    this->_querySocket->deleteLater();
}

void CallManager::setupQuerySocketing(Window *window)
{
    this->_querySocket = new QUdpSocket(this);
    this->_querySocket->bind(QHostAddress(_me.getIp().c_str()), _me.getPort());
    connect(_querySocket, SIGNAL(readyRead()), this, SLOT(onDataReceived()));
    connect(_section, SIGNAL(hangupEvt()), this, SLOT(sendStopCall()));
    connect(_section, SIGNAL(acceptEvt()), this, SLOT(sendConfirmCall()));
    connect(window->getContactList(), SIGNAL(startEvt(const Contact &)), this, SLOT(sendStartCall(const Contact &)));
}

/**
 * @brief Initializes the audio resources (IAudioStream, IAudioEncoder)
*/
void CallManager::setupAudio()
{
    if (this->_audio == nullptr)
        this->_audio = new Audio();
    if (this->_opus == nullptr)
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

    this->_sThread = new QThread(this);
    this->_sThread->start();
    this->_sender->moveToThread(_sThread);
    this->_rThread = new QThread(this);
    this->_rThread->start();
    this->_receiver->moveToThread(_rThread);
    this->_sender->metaObject()->invokeMethod(this->_sender, "createSocket", Qt::QueuedConnection);
    this->_sender->metaObject()->invokeMethod(this->_sender, "recordAndSend", Qt::QueuedConnection);
    this->_receiver->metaObject()->invokeMethod(this->_receiver, "createSocket", Qt::QueuedConnection);
    connect(this->_sender, SIGNAL(finished()), this->_sThread, SLOT(quit()), Qt::DirectConnection);
    connect(this->_sender, SIGNAL(finished()), this->_sender, SLOT(deleteLater()), Qt::DirectConnection);
    connect(this->_sender, SIGNAL(finished()), this->_rThread, SLOT(quit()), Qt::DirectConnection);
    connect(this->_sender, SIGNAL(finished()), this->_receiver, SLOT(deleteLater()), Qt::DirectConnection);
}

/**
 * @brief Gets the audio stream.
*/
IAudioStream* CallManager::getAudioStream() const
{
    return this->_audio;
}

/**
 * @brief Gets the audio encoder.
*/
IAudioEncoder* CallManager::getAudioEncoder() const
{
    return this->_opus;
}

/**
 * @brief Gets the CallManager's current state. 
*/
CallManager::State CallManager::getState() const
{
    return this->_state;
}

/**
 * @brief Sends a "start" query.
 * @param contact The destination of the query
*/
void CallManager::sendStartCall(const Contact &contact)
{
    QByteArray data;

    if (_state == NONE) {
        _state = WAITING_FOR_RESPONSE;
        _waitingForResponse = contact;
        data.append(UdpSerializeQuery(UdpQuery(UdpQuery::START_CALL, _me)).c_str());
        this->_querySocket->writeDatagram(data, QHostAddress(contact.getIp().c_str()), contact.getPort());
        this->_section->setState(_state, contact);
    }
    else
        QMessageBox::warning(this, "Call", QString("You are already in a call."));
}

/**
 * @brief Sends a "confirm" query.
*/
void CallManager::sendConfirmCall()
{
    QByteArray data;

    this->_inCall = this->_requestingCall;
    this->_state = IN_CALL;
    data.append(UdpSerializeQuery(UdpQuery(UdpQuery::CONFIRM_CALL, _me)).c_str());
    this->_querySocket->writeDatagram(data, QHostAddress(_inCall.getIp().c_str()), _inCall.getPort());
    this->_section->setState(_state, _inCall);
    this->setupAudio();
    this->setupSoundSockets(PORT_OPT_1, PORT_OPT_2);
}

/**
 * @brief Stops the call.
*/
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

/**
 * @brief Sends a "cancel" query.
 * @param contact The destination of the query
*/
void CallManager::sendCancelCall(const Contact& contact)
{
    QByteArray data;

    data.append(UdpSerializeQuery(UdpQuery(UdpQuery::CANCEL_CALL, _me)).c_str());
    this->_querySocket->writeDatagram(data, QHostAddress(contact.getIp().c_str()), contact.getPort());
}

/**
 * @brief Handles the reception of a "start" query.
 * @param sender The sender of the query
*/
void CallManager::receiveStartCall(const Contact &sender)
{
    QByteArray data;

    if (_state != NONE) {
        this->sendCancelCall(sender);
        QMessageBox::critical(this, "Call", QString("%1 (%2:%3) tried to call you.")
        .arg(sender.getName().c_str()).arg(sender.getIp().c_str()).arg(sender.getPort()));
        return;
    }
    this->_state = RECEIVING_CALL;
    this->_requestingCall = sender;
    this->_section->setState(_state, this->_requestingCall);
}

/**
 * @brief Handles the reception of a "confirm" query.
 * @param sender The sender of the query
*/
void CallManager::receiveConfirmCall(const Contact &sender)
{
    this->_state = IN_CALL;
    this->_inCall = sender;
    this->_section->setState(_state, sender);
    this->setupAudio();
    this->setupSoundSockets(PORT_OPT_2, PORT_OPT_1);
}

/**
 * @brief Handles the reception of a "stop" query.
 * @param sender The sender of the query
*/
void CallManager::receiveStopCall(const Contact &sender)
{
    this->_inCall = CONTACT_NULL;
    this->_requestingCall = CONTACT_NULL;
    this->_waitingForResponse = CONTACT_NULL;
    this->_state = NONE;
    this->_section->setState(_state);
}

/**
 * @brief Handles the reception of a "cancel" query.
 * @param sender The sender of the query
*/
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

/**
 * @brief Handles the reception of every queries and redirects them to specific member functions.
 * @param query The query received as a std::string
*/
void CallManager::handleQueries(const std::string &query)
{
    UdpQuery data = UdpDeserializeQuery(query);

    switch (data.getType()) {
        case UdpQuery::START_CALL:
            std::cout << "START_CALL from " << data.getSender().getIp() << ":" << data.getSender().getPort() << std::endl;
            this->receiveStartCall(data.getSender());
            break;
        case UdpQuery::CONFIRM_CALL:
            std::cout << "CONFIRM_CALL from " << data.getSender().getIp() << ":" << data.getSender().getPort() << std::endl;
            this->receiveConfirmCall(data.getSender());
            break;
        case UdpQuery::STOP_CALL:
            std::cout << "STOP_CALL from " << data.getSender().getIp() << ":" << data.getSender().getPort() << std::endl;
            this->receiveStopCall(data.getSender());
            break;
        case UdpQuery::CANCEL_CALL:
            std::cout << "CANCEL_CALL from " << data.getSender().getIp() << ":" << data.getSender().getPort() << std::endl;
            this->receiveCancelCall(data.getSender());
            break;
        default:
            break;
    }
}

/**
 * @brief Called when the socket has data ro read.
*/
void CallManager::onDataReceived()
{
    QByteArray buffer;
    QHostAddress sender;
    quint16 senderPort;

    buffer.resize(this->_querySocket->pendingDatagramSize());
    _querySocket->readDatagram(buffer.data(), buffer.size(), &sender, &senderPort);
    handleQueries(std::string(buffer.data()));
}