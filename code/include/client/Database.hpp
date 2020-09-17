/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Database
*/

#ifndef CPP_Database_HPP
#define CPP_Database_HPP

#include <string>
#include <vector>
#include "Contact.hpp"

class Database
{
	private:
        const std::string _ip;
        const int _port;

	public:
		Database(const std::string &ip, const int &port);
		~Database() = default;

		void connect();
		std::vector<Contact *> getContactList();
};

#endif
