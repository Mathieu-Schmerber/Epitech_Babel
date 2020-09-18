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
	private:
        Window *_window;
        QtCallSection *_section;
        QUdpSocket *_socket;

public slots:
    void CallContact(Contact *contact);

	public:
		CallManager(Window *window);
		~CallManager();
};

#endif
