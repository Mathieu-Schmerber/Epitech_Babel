/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** CallManager
*/

#include "UdpRecorder.hpp"
#include "UdpQuery.hpp"
#include "CallManager.hpp"

UdpRecorder::UdpRecorder(CallManager *parent) : QWidget(parent)
{
    this->_parent = parent;
}

UdpRecorder::~UdpRecorder()
{

}

void UdpRecorder::sendPackage(std::vector<uint16_t> record, QUdpSocket* socket, Contact calling, int id)
{
    UdpQuery query(UdpQuery::SEND_AUDIO, this->_parent->_me, id);
    QByteArray data;

    query.setData(record);
    data.append(UdpSerializeQuery(query).c_str());
    socket->writeDatagram(data, QHostAddress(calling.getIp().c_str()), calling.getPort());
   // std::cout << "Send audio to " << std::to_string(calling.getPort()) << std::endl;
}

void UdpRecorder::recordLoop()
{
    std::vector<uint16_t> rec;
    std::vector<uint16_t> sample;
    auto* _audio = this->_parent->getAudio();
    auto* _opus = this->_parent->getOpus();
    auto* socket = this->_parent->getSocket();
    Contact calling = this->_parent->getInCall();
    
    int i = 0;

    while(1)
    {
        rec = _audio->ReadStream();
        sample = _opus->Encode(rec);
        i++;
        this->sendPackage(sample, socket, calling, i);
    }
}