/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** UdpSoundIO
*/

#ifndef CPP_UdpSoundIO_HPP
#define CPP_UdpSoundIO_HPP

#include <QtNetwork/QUdpSocket>
#include <QtWidgets/QWidget>
#include "Contact.hpp"
#include "Audio.hpp"
#include "Opus.hpp"

class CallManager;

class UdpSoundIO : public QObject {
Q_OBJECT
private:
    Contact _settings;
    Contact _destination;
    QUdpSocket *_socket;
    Audio *_audio;
    Opus *_opus;
    CallManager *_parent;

    void parseAndReadQuery(const std::string &query);
    void sendPacket(const std::vector<uint16_t> &record);

public:
    explicit UdpSoundIO(CallManager *parent, const Contact &settings, const Contact &destination);
    ~UdpSoundIO();

public slots:
    void createSocket();
    void onDataReceived();
    void recordAndSend();
};

#endif
