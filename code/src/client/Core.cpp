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

    this->_app = new QApplication(*parser->getAC(), parser->getAV());
    this->_window = new Window({1000, 800}, "Babel");
    this->_database = new Database(serverArgs.first, serverArgs.second, this->_window);
    delete parser;
}

Core::~Core()
{
    delete this->_database;
    delete this->_window;
    delete this->_app;
}

void Core::initialize()
{
    std::vector<Contact *> contactList;

    contactList = this->_database->getContactList();
    for (auto &contact : contactList)
        this->_window->getContactList()->addButton(contact->getName());
    this->_window->display();
    this->_app->exec();
}