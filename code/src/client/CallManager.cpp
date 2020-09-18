/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** CallManager
*/

#include <iostream>
#include "CallManager.hpp"
#include "Window.hpp"

CallManager::CallManager(Window *window) : QWidget(window)
{
    this->_window = window;
    this->_section = window->getCallSection();
}

CallManager::~CallManager()
{
    this->_socket->close();
}

void CallManager::CallContact(Contact *contact)
{
    this->_section->setState(QtCallSection::CALLING, contact);
    std::cout << "Calling: " << std::endl
              << "\t" << contact->getName() << std::endl
              << "\t" << contact->getIp() << ":"
              << contact->getPort() << std::endl;
}