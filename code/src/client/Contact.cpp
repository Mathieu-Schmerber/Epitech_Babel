/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Contact
*/

#include "Contact.hpp"

Contact::Contact(const std::string &ip, const std::string &name, int port)
: _ip(ip), _name(name), _port(port) {}

Contact::Contact(const Contact &copy)
: _ip(copy.getIp()), _name(copy.getName()), _port(copy.getPort()) {}

std::string Contact::getName() const
{
    return this->_name;
}

std::string Contact::getIp() const
{
    return this->_ip;
}

int Contact::getPort() const
{
    return this->_port;
}