/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtContactListl
*/

#include <QtWidgets/QApplication>
#include "QtContactList.hpp"

QtContactList::QtContactList(QWidget *parent, int w, int h) : QWidget(parent)
{
    this->_layout = new QVBoxLayout(this);
    this->_scroll = new QScrollArea(this);
    this->_container = new QWidget();
    this->_scroll->setWidgetResizable( true );
    this->_layout->setAlignment(Qt::AlignTop);
    this->_container->setLayout(this->_layout);
    this->_scroll->setWidget(this->_container);
    this->_scroll->resize(w, h);
}

QtContactList::~QtContactList()
{
    for (auto &btn : this->_buttons)
        delete btn;
}

void QtContactList::addButton(const std::string &content)
{
    const std::pair<int, int> btnSize = {200, 50};
    auto *btn = new QPushButton(content.c_str(), this->_container);

    btn->setStyleSheet("text-align:left;");
    btn->setIcon(QIcon(QCoreApplication::applicationDirPath() + "/phone.png"));
    btn->setIconSize(QSize(btnSize.second * 0.75, btnSize.second * 0.75));
    btn->setFixedSize(btnSize.first, btnSize.second);
    this->_buttons.push_back(btn);
    this->_layout->addWidget(btn);
}

void QtContactList::display()
{
    this->show();
}