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
            GETTING_CALL,
            IN_CALL
        };

	private:
        State _state;
        QLabel *_stateTxt;
        QLabel *_infoTxt;
        QPushButton *_hangupBtn;
        QPushButton *_acceptBtn;

        QLabel *createText(const std::string &text, int size, bool isBold);
        QPushButton *createBtn(const std::string &resource, QSize size);
        void setBackgroundColor(const QColor &color);

        void noCallState();
        void callingState(Contact *contact);
        void gettingCallState(Contact *contact);
        void inCallState(Contact *contact);

signals:
    void hangupEvt();
    void acceptEvt();

private slots:
    void hangup();
    void accept();

	public:

		QtCallSection(QWidget *parent);
		~QtCallSection();

		void setState(State state, Contact *contact = nullptr);
		State getState() const;
		void display();
};

#endif
