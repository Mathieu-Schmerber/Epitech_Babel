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

class CallManager;
class Contact;

class QtContactList : public QWidget
{
Q_OBJECT
private:
        std::vector<QPushButton *> _buttons;
        std::vector<Contact *> _contacts;
        QWidget *_container;
        QScrollArea *_scroll;
        QVBoxLayout *_layout;
        CallManager *_manager;
        QSignalMapper *_mapper;

    void addContactButton(const std::string &name, size_t index);

private slots:
        void callClicked(int index);

	public:
		QtContactList(QWidget *parent, int w, int h);
		~QtContactList();

		void setCallManager(CallManager *manager);
        void pushContacts(const std::vector<Contact *> &list);
        void display();
};

#endif
