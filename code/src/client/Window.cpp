/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Window
*/

#include "Window.hpp"

Window::Window(const std::pair<int, int> &size, const std::string &title) : QWidget()
{
    this->_size = size;
    this->_gridLimit = {5, 10};
    this->setFixedSize(size.first, size.second);
}

Window::~Window()
{
    for (auto &button : this->_buttons)
        delete button;
}

void Window::addButton(const std::string &content)
{
    const std::pair<int, int> btnSize = {200, 50};

    QPushButton *btn = new QPushButton(content.c_str(), this);

    btn->setStyleSheet("text-align:left;");
    btn->setFont(QFont(QCoreApplication::applicationDirPath() + "/righteous.ttf", btnSize.second * 0.25));
    btn->setIcon(QIcon(QCoreApplication::applicationDirPath() + "/phone.png"));
    btn->setIconSize(QSize(btnSize.second * 0.75, btnSize.second * 0.75));
    btn->setFixedSize(btnSize.first, btnSize.second);
    this->_buttons.push_back(btn);
}

void Window::layout()
{
    int cumulY = 0;
    const std::pair<int, int> btnSize = {200, 50};

    for (auto &btn : this->_buttons) {
        btn->move(0, cumulY);
        cumulY += btnSize.second;
    }
}

void Window::display()
{
    this->layout();
    this->show();
}