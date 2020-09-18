/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtCallSection
*/

#ifndef CPP_QtCallSection_HPP
#define CPP_QtCallSection_HPP

#include <QtWidgets/QWidget>
#include <QtWidgets/QLabel>

class QtCallSection : public QWidget
{
    public:
        enum State {
            NO_CALL,
            CALLING,
            IN_CALL
        };

	private:
        State _state;

	public:

		QtCallSection(QWidget *parent);
		~QtCallSection();

		void setState(State state);
		State getState() const;
		void display();
};

#endif
