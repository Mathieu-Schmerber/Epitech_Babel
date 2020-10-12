/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Contact
*/

#include "Contact.hpp"

Contact::Contact(const std::string &ip, const std::string &name, int port)
: _ip(ip), _name(name), _port(port) {}

/**
 * @brief Gets the contact's name.
*/
std::string Contact::getName() const
{
    return this->_name;
}

/**
 * @brief Gets the contact's ip.
*/
std::string Contact::getIp() const
{
    return this->_ip;
}

/**
 * @brief Gets the contact's port.
*/
int Contact::getPort() const
{
    return this->_port;
}

/**
 * @brief Sets the contact's ip.
*/
void Contact::setIp(const std::string &ip) {
    _ip = ip;
}

/**
 * @brief Sets the contact's name.
*/
void Contact::setName(const std::string &name) {
    _name = name;
}

/**
 * @brief Sets the contact's port.
*/
void Contact::setPort(int port) {
    _port = port;
}

/**
 * @brief Contact equality operator.
*/
bool Contact::operator==(const Contact &rhs) const {
    return _ip == rhs._ip &&
           _name == rhs._name &&
           _port == rhs._port;
}

/**
 * @brief Contact difference operator.
*/
bool operator!=(const Contact &lhs, const Contact &rhs) {
    return !(rhs == lhs);
}
