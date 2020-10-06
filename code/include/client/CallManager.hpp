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
#include "code/include/Contact.hpp"

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

    void receiveStartCall(const Contact &sender);
    void receiveConfirmCall(const Contact &sender);
    void receiveStopCall(const Contact &sender);
    void handleQueries(const std::string &query);

public slots:
    void sendStartCall(const Contact &contact);
    void sendConfirmCall();
    void sendStopCall();
    void onDataReceived();
};

#endif
