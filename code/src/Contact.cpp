/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Contact
*/

#include "Contact.hpp"

Contact::Contact(const std::string &ip, const std::string &name, int port)
: _ip(ip), _name(name), _port(port) {}

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

void Contact::setIp(const std::string &ip) {
    _ip = ip;
}

void Contact::setName(const std::string &name) {
    _name = name;
}

void Contact::setPort(int port) {
    _port = port;
}

bool Contact::operator==(const Contact &rhs) const {
    return _ip == rhs._ip &&
           _name == rhs._name &&
           _port == rhs._port;
}

bool operator!=(const Contact &lhs, const Contact &rhs) {
    return !(rhs == lhs);
}
