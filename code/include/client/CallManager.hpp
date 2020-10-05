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
	private:
        Window *_window;
        QtCallSection *_section;
        QUdpSocket *_socket;
        Contact _inCall;
        Contact _me;

        void handleQueries(const std::string &query);

	public:
		CallManager(Window *window, const Contact &me);
		~CallManager();

		void receiveCall(const Contact &contact);

public slots:
    void startCall(const Contact &contact);
    void confirmCall();
    void stopCall();
    void onDataReceived();
};

#endif
