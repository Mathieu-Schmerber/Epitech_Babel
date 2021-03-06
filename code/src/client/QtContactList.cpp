/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtContactListl
*/

#include <QtWidgets/QApplication>
#include "QtContactList.hpp"
#include "Contact.hpp"
#include "QtStyle.hpp"

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
    this->_mapper = new QSignalMapper();
    this->_container->setStyleSheet("background: #3e4349");
}

QtContactList::~QtContactList()
{
    for (auto &btn : this->_buttons)
        delete btn;
}

void QtContactList::bindDatabase(Database *db)
{
    connect(db, SIGNAL( dbUpdateEvt(const std::vector<Contact> &) ),
            this, SLOT(pushContacts(const std::vector<Contact> &)));
}

void QtContactList::addContactButton(const std::string &name, size_t index)
{
    const std::pair<int, int> btnSize = {200, 50};
    auto *btn = new QPushButton(name.c_str(), this->_container);

    btn->setStyleSheet(QtStyle::buttonStyle);
    btn->setIcon(QIcon(QCoreApplication::applicationDirPath() + "/phone.png"));
    btn->setIconSize(QSize(btnSize.second * 0.75, btnSize.second * 0.75));
    btn->setFixedSize(btnSize.first, btnSize.second);
    this->_buttons.push_back(btn);
    this->_layout->addWidget(btn);
    this->_mapper->setMapping(btn, (int)index);
    connect(btn, SIGNAL( clicked() ), this->_mapper, SLOT(map()));
}

/**
 * @brief Displays the QtContactList on the main Window.
*/
void QtContactList::display()
{
    this->show();
}

void QtContactList::callClicked(int index)
{
    Contact contact = this->_contacts.at(index);

    emit startEvt(contact);
}

void QtContactList::purgeContactList()
{
    for (auto& btn : this->_buttons)
    {
        this->_mapper->removeMappings(btn);
        this->_layout->removeWidget(btn);
        btn->deleteLater();
    }
    disconnect(this->_mapper, SIGNAL(mapped(int)), this, SLOT(callClicked(int)));
    this->_contacts.clear();
    this->_buttons.clear();
}

/**
 * @brief Sets the list of Contact the client can call.
 * @param list A std::vector of Contact that will be displayed as buttons.
*/
void QtContactList::pushContacts(const std::vector<Contact> &list)
{
    this->purgeContactList();
    this->_contacts = list;
    for (size_t i = 0; i < this->_contacts.size(); ++i)
        this->addContactButton(this->_contacts[i].getName(), i);
    connect(this->_mapper, SIGNAL(mapped(int)), this, SLOT(callClicked(int)));
}
