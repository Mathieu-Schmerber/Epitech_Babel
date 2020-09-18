/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtContactList
*/

#ifndef CPP_QtContactList_HPP
#define CPP_QtContactList_HPP

#include <QtWidgets/QScrollArea>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QVBoxLayout>

class QtContactList : public QWidget
{
	private:
        std::vector<QPushButton *> _buttons;
        QWidget *_container;
        QScrollArea *_scroll;
        QVBoxLayout *_layout;
	public:
		QtContactList(QWidget *parent, int w, int h);
		~QtContactList();

        void addButton(const std::string &content);
        void display();
};

#endif
