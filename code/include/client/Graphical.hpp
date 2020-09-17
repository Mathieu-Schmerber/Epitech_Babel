/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Graphical
*/

#ifndef CPP_Graphical_HPP
#define CPP_Graphical_HPP

#include "Window.hpp"

class Graphical
{
	private:
        Window *_window;
        QApplication *_app;

	public:
        Graphical(const std::pair<int, int> &size, const std::string &title,
                  int ac, char **av);
        ~Graphical();

        Window *getWindow() const;
        void display() const;
};

#endif
