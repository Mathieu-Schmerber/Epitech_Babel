/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtCallSection
*/

#ifndef CPP_QtCallSection_HPP
#define CPP_QtCallSection_HPP

#include <QtWidgets/QWidget>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QLabel>
#include "Contact.hpp"

class QtCallSection : public QWidget
{
    Q_OBJECT
    public:
        enum State {
            NO_CALL,
            CALLING,
            IN_CALL
        };

	private:
        State _state;
        QLabel *_stateTxt;
        QLabel *_infoTxt;
        QPushButton *_hangup;

        QLabel *createText(const std::string &text, int size, bool isBold);
        void setBackgroundColor(const QColor &color);

private slots:
        void hangup();

	public:

		QtCallSection(QWidget *parent);
		~QtCallSection();

		void setState(State state, Contact *contact = nullptr);
		State getState() const;
		void display();
};

#endif
