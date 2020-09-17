/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Core
*/

#ifndef CPP_Core_HPP
#define CPP_Core_HPP

#include "Database.hpp"
#include "Graphical.hpp"
#include "ArgParser.hpp"

class Core
{
	private:
        Graphical *_interface;
        Database *_database;

	public:
		Core(ArgParser *parser);
		~Core();

		void initialize();
};

#endif
