/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** CallManager
*/

#ifndef CPP_CallManager_HPP
#define CPP_CallManager_HPP

#include <QtNetwork/QUdpSocket>
#include <QtWidgets/QWidget>
#include "Contact.hpp"
#include "Opus.hpp"
#include "Audio.hpp"

class Window;

class QtCallSection;

class CallManager : public QWidget
{
Q_OBJECT
public:
    enum State { // TODO: actions depending on states
        NONE,
        WAITING_FOR_RESPONSE,
        RECEIVING_CALL,
        IN_CALL
    };

    CallManager(Window *window, const Contact &me);
    ~CallManager();

private:
    Window *_window;
    QtCallSection *_section;
    QUdpSocket *_socket;
    Contact _inCall;
    Contact _requestingCall;
    Contact _waitingForResponse;
    Contact _me;
    State _state;

    Audio *_audio;
    Opus *_opus;

    void receiveStartCall(const Contact &sender);
    void receiveConfirmCall(const Contact &sender);
    void receiveStopCall(const Contact &sender);
    void handleQueries(const std::string &query);

    void setupAudio();

    void sendRecord();
    void receiveRecord(const std::vector<uint16_t> &record);

public slots:
    void sendStartCall(const Contact &contact);
    void sendConfirmCall();
    void sendStopCall();
    void onDataReceived();
};

#endif
