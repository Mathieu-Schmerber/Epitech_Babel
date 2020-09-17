/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Graphical
*/

#include <iostream>
#include "Graphical.hpp"

Graphical::Graphical(const std::pair<int, int> &size, const std::string &title,
                     int ac, char **av)
{
    this->_app = new QApplication(ac, av);
    this->_window = new Window(size, title);
    this->_window->setFixedSize(size.first, size.second);
}

Graphical::~Graphical()
{
    delete this->_window;
}

void Graphical::display() const
{
    this->_window->layout();
    this->_window->show();
    this->_app->exec();
}

Window *Graphical::getWindow() const
{
    return this->_window;
}