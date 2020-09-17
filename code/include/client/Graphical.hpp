/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Graphical
*/

#ifndef CPP_Graphical_HPP
#define CPP_Graphical_HPP

#include <string>
#include "Contact.hpp"

class Graphical
{
	private:
	public:
        Graphical(const std::pair<int, int> &size, const std::string &title);
        ~Graphical();

        void addButton(Contact *content);
        void display() const;
};

#endif
