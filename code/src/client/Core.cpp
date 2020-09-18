/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Core
*/

#include "Core.hpp"

Core::Core(ArgParser *parser)
{
    std::pair<std::string, int> serverArgs = parser->getParsedArgs();

    this->_database = new Database(serverArgs.first, serverArgs.second);
    this->_app = new QApplication(*parser->getAC(), parser->getAV());
    this->_window = new Window({1000, 800}, "Babel");
    delete parser;
}

Core::~Core()
{
    delete this->_database;
    delete this->_window;
    delete this->_app;
}

void Core::initialize()l
{
    std::vector<Contact *> contactList;

    this->_database->connect();
    contactList = this->_database->getContactList();
    for (auto &contact : contactList)
        this->_window->addButton(contact->getName());
    this->_window->display();
    this->_app->exec();
}