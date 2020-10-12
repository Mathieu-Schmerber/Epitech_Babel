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
#include "CallManager.hpp"

/**
 * @brief The graphical interface representing the CallManager's state.
*/
class QtCallSection : public QWidget
{
    Q_OBJECT

	private:
        QLabel *_stateTxt;
        QLabel *_infoTxt;
        QPushButton *_hangupBtn;
        QPushButton *_acceptBtn;

        QLabel *createText(const std::string &text, int size, bool isBold);
        QPushButton *createBtn(const std::string &resource, QSize size);
        void setBackgroundColor(const QColor &color);

        void noCallState();
        void callingState(const Contact &contact);
        void gettingCallState(const Contact &contact);
        void inCallState(const Contact &contact);

signals:
    void hangupEvt();
    void acceptEvt();

private slots:
    void hangup();
    void accept();

	public:

		QtCallSection(QWidget *parent);
		~QtCallSection();

		void setState(CallManager::State state, const Contact &contact = Contact());
		void display();
};

#endif
