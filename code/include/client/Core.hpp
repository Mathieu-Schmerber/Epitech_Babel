/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Core
*/

#ifndef CPP_Core_HPP
#define CPP_Core_HPP

#include "Database.hpp"
#include "Window.hpp"
#include "CallManager.hpp"
#include "QtNetworkForm.hpp"

/**
 * @brief This is the core of the Babel's client
*/
class Core
{
	private:
        Window *_window;
        QApplication *_app;

private:
    Database *_database;
        CallManager *_manager;
        QtNetworkForm *_networkForm;
		Contact _me;

	public:
		Core(int ac, char **av);
		~Core();

		void initialize();
};

#endif
