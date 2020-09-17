/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Graphical
*/

#include "Graphical.hpp"

Graphical::Graphical(const std::pair<int, int> &size, const std::string &title,
                     int ac, char **av)
{
    this->_app = new QApplication(ac, av);
}

Graphical::~Graphical() = default;

void Graphical::addButton(Contact *content)
{
    this->_buttons.push_back(new QPushButton(content->getName().c_str()));
}

void Graphical::display() const
{
    for (auto &button : this->_buttons)
        button->show();
    this->_app->exec();
}