/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Window
*/

#ifndef CPP_Window_HPP
#define CPP_Window_HPP

#include <QtWidgets/QApplication>
#include <QtWidgets/QWidget>
#include <vector>
#include <string>
#include "QtContactList.hpp"
#include "QtCallSection.hpp"
#include "CallManager.hpp"

/**
 * @brief The client's main Window
*/
class Window : public QWidget
{
private:
    std::pair<int, int> _size;
    std::pair<int, int> _gridLimit;
    QtContactList *_contactList;
    QtCallSection *_callSection;

    // Events
    void (CallManager::*_callHangupEvent)();
    void (CallManager::*_callDeclinedEvent)();
    void (CallManager::*_callAcceptedEvent)();
    void (CallManager::*_callStartEvent)();

public:
    Window(const std::pair<int, int> &size, const std::string &title);
    ~Window();

    QtContactList *getContactList() const;
    QtCallSection *getCallSection() const;

    void display();
};

#endif
