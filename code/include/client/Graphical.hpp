/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Graphical
*/

#ifndef CPP_Graphical_HPP
#define CPP_Graphical_HPP

#include <string>
#include <vector>
#include <QtWidgets/QApplication>
#include <QtWidgets/QPushButton>
#include "Contact.hpp"

class Graphical
{
	private:
        QApplication *_app;
        std::vector<QPushButton *> _buttons;

	public:
        Graphical(const std::pair<int, int> &size, const std::string &title,
                  int ac, char **av);
        ~Graphical();

        void addButton(Contact *content);
        void display() const;
};

#endif
