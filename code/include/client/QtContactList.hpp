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
#include <QSignalMapper>
#include "Database.hpp"

class Contact;

class QtContactList : public QWidget
{
Q_OBJECT
private:
        std::vector<QPushButton *> _buttons;
        std::vector<Contact> _contacts;
        QWidget *_container;
        QScrollArea *_scroll;
        QVBoxLayout *_layout;
        QSignalMapper *_mapper;

    void addContactButton(const std::string &name, size_t index);

signals:
    void startEvt(const Contact &);

private slots:
    void callClicked(int index);
    void pushContacts(const std::vector<Contact> &list);

	public:
		QtContactList(QWidget *parent, int w, int h);
		~QtContactList();

		void bindDatabase(Database *db);

        void display();
};

#endif
