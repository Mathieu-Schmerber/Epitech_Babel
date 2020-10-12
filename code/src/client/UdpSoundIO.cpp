/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** UdpSoundIO
*/

#include "UdpSoundIO.hpp"
#include "UdpQuery.hpp"
#include "CallManager.hpp"

UdpSoundIO::UdpSoundIO(CallManager *parent, const Contact &settings, const Contact &destination)
: QObject()
{
    this->_socket = nullptr;
    this->_destination = destination;
    this->_settings = settings;
    this->_audio = parent->getAudioStream();
    this->_opus = parent->getAudioEncoder();
    this->_parent = parent;
}

UdpSoundIO::~UdpSoundIO()
{
    delete this->_socket;
}

/**
 * @brief Initializes the UDP socket.
*/
void UdpSoundIO::createSocket()
{
    this->_socket = new QUdpSocket(this);
    this->_socket->bind(QHostAddress(_settings.getIp().c_str()), _settings.getPort());
    connect(_socket, SIGNAL(readyRead()), this, SLOT(onDataReceived()));
}

/**
 * @brief Sends encoded audio data through the UDP socket.
 * @param record The encoded audio data
*/
void UdpSoundIO::sendPacket(const std::vector<uint16_t> &record)
{
    UdpQuery query(UdpQuery::SEND_AUDIO, this->_settings);
    QByteArray data;

    query.setData(record);
    data.append(UdpSerializeQuery(query).c_str());
    _socket->writeDatagram(data, QHostAddress(_destination.getIp().c_str()), _destination.getPort());
}

/**
 * @brief Records audio thanks to an IAudioStream, encode it with the IAudioEncoder and 
 sends the encoded data through UDP.
*/
void UdpSoundIO::recordAndSend()
{
    std::vector<uint16_t> rec;
    std::vector<uint16_t> sample;

    while(_parent->getState() == CallManager::State::IN_CALL)
    {
        rec = _audio->ReadStream();
        sample = _opus->Encode(rec);
        this->sendPacket(sample);
    }
    emit finished();
}

/**
 * @brief Deserialize queries and handles them.
 * @param query The query that has been received on the socket
*/
void UdpSoundIO::parseAndReadQuery(const std::string &query)
{
    UdpQuery parsed = UdpDeserializeQuery(query);

    if (parsed.getType() == UdpQuery::SEND_AUDIO)
        _audio->WriteStream(_opus->Decode(parsed.getData()));
}

/**
 * @brief Called when there's data to read on the socket.
*/
void UdpSoundIO::onDataReceived()
{
    QByteArray buffer;
    QHostAddress sender;
    quint16 senderPort;

    buffer.resize(this->_socket->pendingDatagramSize());
    _socket->readDatagram(buffer.data(), buffer.size(), &sender, &senderPort);
    parseAndReadQuery(std::string(buffer.data()));
}