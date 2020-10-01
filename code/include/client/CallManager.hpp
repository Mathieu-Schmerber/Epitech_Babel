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

class Window;
class QtCallSection;

class CallManager : public QWidget
{
    Q_OBJECT
	private:
        Window *_window;
        QtCallSection *_section;
        QUdpSocket *_socket;
        Contact *_inCall;

	public:
		CallManager(Window *window, const std::string &myIp, int socketPort);
		~CallManager();

		void receiveCall(Contact *contact);

public slots:
    void startCall(Contact *contact);
    void confirmCall();
    void stopCall();
    void onDataReceived();
};

#endif
