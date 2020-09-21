/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Window
*/

#include "Window.hpp"

Window::Window(const std::pair<int, int> &size, const std::string &title) : QWidget()
{
    int Vpadding = 10;
    int Hpadding = 10;
    int listWidth = 240;

    this->_size = size;
    this->_gridLimit = {5, 10};
    this->setFixedSize(size.first, size.second);
    this->_contactList = new QtContactList(this, listWidth, size.second - (Vpadding * 2));
    this->_callSection = new QtCallSection(this);
    this->_callSection->resize(size.first - listWidth - (Hpadding * 2), size.second - (Vpadding * 2));
    this->_contactList->move(Hpadding, Vpadding);
    this->_callSection->move(listWidth + Hpadding, Vpadding);
}

Window::~Window()
{
    delete this->_contactList;
    delete this->_callSection;
}

void Window::display()
{
    this->_contactList->display();
    this->_callSection->display();
    this->show();
}

QtContactList *Window::getContactList() const
{
    return this->_contactList;
}

QtCallSection * Window::getCallSection() const
{
    return this->_callSection;
}

void Window::setCallHangupEvent(void (CallManager::*callHangupEvent)())
{
    _callHangupEvent = callHangupEvent;
}

void Window::setCallDeclinedEvent(void (CallManager::*callDeclinedEvent)())
{
    _callDeclinedEvent = callDeclinedEvent;
}

void Window::setCallAcceptedEvent(void (CallManager::*callAcceptedEvent)())
{
    _callAcceptedEvent = callAcceptedEvent;
}

void Window::setCallStartEvent(void (CallManager::*callStartEvent)())
{
    _callStartEvent = callStartEvent;
}
