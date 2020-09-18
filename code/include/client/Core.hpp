/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Core
*/

#ifndef CPP_Core_HPP
#define CPP_Core_HPP

#include "ArgParser.hpp"
#include "Database.hpp"
#include "Window.hpp"
#include "CallManager.hpp"

class Core
{
	private:
        Window *_window;
        QApplication *_app;
        Database *_database;
        CallManager *_manager;

	public:
		Core(ArgParser *parser);
		~Core();

		void initialize();
};

#endif
