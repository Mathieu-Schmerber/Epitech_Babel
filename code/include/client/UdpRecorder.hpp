/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** UdpRecorder
*/

#ifndef CPP_UdpRecorder_HPP
#define CPP_UdpRecorder_HPP

#include <QtNetwork/QUdpSocket>
#include <QtWidgets/QWidget>
#include "Contact.hpp"

class CallManager;

class UdpRecorder : public QWidget
{
Q_OBJECT
public:

    UdpRecorder(CallManager *parent);
    ~UdpRecorder();

private:
    CallManager* _parent;

    void sendPackage(std::vector<uint16_t> record, QUdpSocket* socket, Contact calling, int id);

public slots:
    void recordLoop();
};

#endif
