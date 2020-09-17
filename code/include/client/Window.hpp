/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Window
*/

#ifndef CPP_Window_HPP
#define CPP_Window_HPP

#include <QtWidgets/QApplication>
#include <QtWidgets/QWidget>
#include <QtWidgets/QPushButton>
#include <vector>
#include <string>

#define COLUMN_MAX 5

class Window : public QWidget
{
	private:
        std::pair<int, int> _lastCell;
        std::vector<QPushButton *> _buttons;

    public:
		Window(const std::pair<int, int> &size, const std::string &title);
		~Window();

        void addButton(const std::string &content);
        void layout();
};

#endif
