/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Contact
*/

#include "Contact.hpp"

Contact::Contact(const std::string &ip, const std::string &name, const std::string &port)
: _ip(ip), _name(name), _port(port) {}

std::string Contact::getName() const
{
    return this->_name;
}

std::string Contact::getIp() const
{
    return this->_ip;
}

std::string Contact::getPort() const
{
    return this->_port;
}