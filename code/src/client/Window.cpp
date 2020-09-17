/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Window
*/

#include "Window.hpp"

Window::Window(const std::pair<int, int> &size, const std::string &title) : QWidget()
{
    this->setFixedSize(size.first, size.second);
    this->_lastCell = {0, 0};
}

Window::~Window()
{
    for (auto &button : this->_buttons)
        delete button;
}

void Window::addButton(const std::string &content)
{
    QPushButton *btn = new QPushButton(content.c_str(), this);

    btn->setFont(QFont(QCoreApplication::applicationDirPath() + "/righteous.ttf", 23));
    btn->setIcon(QIcon(QCoreApplication::applicationDirPath() + "/phone.jpg"));
    btn->setIconSize(QSize(40, 40));
    this->_buttons.push_back(btn);
}

void Window::layout()
{
    int height = this->height();
    std::pair<int, int> cumul = {0, 0};

    for (auto &btn : this->_buttons) {
        btn->move(cumul.first, cumul.second);
        cumul.second += 60;
    }
}