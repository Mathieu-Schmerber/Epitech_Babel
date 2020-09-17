/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Contact
*/

#ifndef CPP_Contact_HPP
#define CPP_Contact_HPP

#include <string>

class Contact
{
	private:
        const std::string _ip;
        const std::string _name;

	public:
		Contact(const std::string &ip, const std::string &name);
		~Contact() = default;

    std::string getName() const;
    std::string getIp() const;
};

#endif
