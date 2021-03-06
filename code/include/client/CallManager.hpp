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
#include "UdpSoundIO.hpp"

class Window;

class QtCallSection;

/**
 * @brief 
 * Handles calls based on UDP socketing and threading.
*/
class CallManager : public QWidget
{
Q_OBJECT
public:
    /**
     * @brief Defines the clients calling state.
    */
    enum State {
        NONE,
        WAITING_FOR_RESPONSE,
        RECEIVING_CALL,
        IN_CALL
    };

    CallManager(Window *window, const Contact &me);
    ~CallManager();

    IAudioStream* getAudioStream() const;
    IAudioEncoder* getAudioEncoder() const;
    State getState() const;

private:
    Contact _me;
    QtCallSection *_section;
    Contact _inCall;
    Contact _requestingCall;
    Contact _waitingForResponse;
    State _state;
    IAudioStream*_audio;
    IAudioEncoder*_opus;

    QUdpSocket *_querySocket;
    UdpSoundIO *_receiver;
    UdpSoundIO *_sender;
    QThread* _rThread;
    QThread* _sThread;

    void setupAudio();
    void setupQuerySocketing(Window *window);
    void setupSoundSockets(int readOn, int sendOn);

    void receiveStartCall(const Contact &sender);
    void receiveConfirmCall(const Contact &sender);
    void receiveStopCall(const Contact& sender);
    void receiveCancelCall(const Contact& sender);
    void handleQueries(const std::string &query);


    void sendCancelCall(const Contact& contact);

public slots:
    void sendStartCall(const Contact &contact);
    void sendConfirmCall();
    void sendStopCall();
    void onDataReceived();
};

#endif
