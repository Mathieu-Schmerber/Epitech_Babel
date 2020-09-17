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
    return {new Contact("127.0.0.1", "Mathieu"),
            new Contact("127.0.0.1", "Lucas"),
            new Contact("127.0.0.1", "Theo"),
            new Contact("127.0.0.1", "Paques"),
            new Contact("127.0.0.1", "Thomas"),
            new Contact("127.0.0.1", "Pauline"),
            new Contact("127.0.0.1", "Axel")};
}