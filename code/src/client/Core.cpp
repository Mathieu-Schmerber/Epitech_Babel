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
    this->_interface = new Graphical({700, 450}, "Babel",
                                     parser->getAC(), parser->getAV());
    delete parser;
}

Core::~Core()
{
    delete this->_database;
    delete this->_interface;
}

void Core::initialize()
{
    std::vector<Contact *> contactList;

    this->_database->connect();
    contactList = this->_database->getContactList();
    for (auto &contact : contactList)
        this->_interface->getWindow()->addButton(contact->getName());
    this->_interface->display();
}