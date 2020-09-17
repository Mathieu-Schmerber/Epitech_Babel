/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Core
*/

#include "Core.hpp"

Core::Core(const std::string &serverIp, const int &serverPort)
{
    this->_interface = new Graphical({150, 150}, "Babel");
    this->_database = new Database(serverIp, serverPort);
}

Core::~Core()
{
    delete this->_database;
    delete this->_interface;
}

void Core::initialize()
{
    this->_database->connect();
}