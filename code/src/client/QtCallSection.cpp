/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtCallSection
*/

#include "QtCallSection.hpp"

QtCallSection::QtCallSection(QWidget *parent) : QWidget(parent)
{
    this->setState(NO_CALL);
}

QtCallSection::~QtCallSection() {}

QtCallSection::State QtCallSection::getState() const
{
    return this->_state;
}

void QtCallSection::setState(State state)
{
    this->_state = state;
    if (this->_state == NO_CALL)
        this->setStyleSheet("background: black;");
}

void QtCallSection::display()
{
    this->show();
}