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
#include "UdpRecorder.hpp"

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

    Contact _me;

    CallManager(Window *window, const Contact &me);
    ~CallManager();

    const Contact &getInCall() const;
    Audio* getAudio() const;
    Opus* getOpus() const;
    QUdpSocket* getSocket() const;

private:
    Window *_window;
    QtCallSection *_section;
    QUdpSocket *_socket;
    Contact _inCall;
    Contact _requestingCall;
    Contact _waitingForResponse;
    State _state;
    
    UdpRecorder *_recorder;
    QThread* _thread;
    Audio *_audio;
    Opus *_opus;

    void receiveStartCall(const Contact &sender);
    void receiveConfirmCall(const Contact &sender);
    void receiveStopCall(const Contact &sender);
    void handleQueries(const std::string &query);

    void setupAudio();

    void sendRecord();
    void receiveRecord(const std::vector<uint16_t> &record);
    void sendShortRecord(const std::vector<uint16_t> &record);

public slots:
    void sendStartCall(const Contact &contact);
    void sendConfirmCall();
    void sendStopCall();
    void onDataReceived();
};

#endif
