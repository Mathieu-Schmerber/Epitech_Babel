/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Database
*/

#include "Database.hpp"
#include "Error.hpp"

Database::Database(const std::string &ip, const int &port)
: _ip(ip), _port(port) {}

void Database::connect()
{
    printf("connecting to %s:%d...\n", this->_ip.c_str(), this->_port);
    // throw ServerError("Connection failed.");
    // Setup TCP connection between client and server
}

std::vector<Contact *> Database::getContactList()
{
    // Call server and receive list
    std::vector<Contact *> tmp;

    for (int i = 0; i < 43; ++i)
        tmp.push_back(new Contact("127.0.0.1", std::to_string(i)));
    return tmp;
}