/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Contact
*/

#include "Contact.hpp"

Contact::Contact(const std::string &ip, const std::string &name)
: _ip(ip), _name(name) {}

std::string Contact::getName() const
{
    return this->_name;
}

std::string Contact::getIp() const
{
    return this->_ip;
}