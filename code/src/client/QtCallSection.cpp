/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtCallSection
*/

#include <QtWidgets/QApplication>
#include <iostream>
#include "QtCallSection.hpp"

QtCallSection::QtCallSection(QWidget *parent) : QWidget(parent)
{
    this->_stateTxt = this->createText("", 20, true);
    this->_infoTxt = this->createText("", 15, true);
    this->_hangupBtn = this->createBtn("/hangup.png", QSize(130, 130));
    this->_acceptBtn = this->createBtn("/accept.png", QSize(100, 100));
    this->setState(CallManager::NONE);
}

QtCallSection::~QtCallSection() {}

QLabel *QtCallSection::createText(const std::string &text, int size, bool isBold)
{
    auto *res = new QLabel(text.c_str(), this);

    res->setStyleSheet("color: white;");
    res->setAlignment(Qt::AlignCenter);
    res->setFont(QFont("Arial", size, (isBold ? QFont::Bold : QFont::Normal)));
    return res;
}

QPushButton * QtCallSection::createBtn(const std::string &resource, QSize size)
{
    auto *res = new QPushButton(this);

    res->setIcon(QIcon(QCoreApplication::applicationDirPath() + resource.c_str()));
    res->setStyleSheet("border: none;"
                       "background: transparent;");
    res->setFixedSize(100, 100);
    res->setIconSize(size);
    return res;
}

void QtCallSection::setBackgroundColor(const QColor &color)
{
    QPalette pal = palette();

    pal.setColor(QPalette::Window, color);
    this->setAutoFillBackground(true);
    this->setPalette(pal);
}

void QtCallSection::noCallState()
{
    this->setBackgroundColor(QColor(36, 59, 77));
    this->_infoTxt->setVisible(false);
    this->_stateTxt->setVisible(false);
    this->_hangupBtn->setEnabled(false);
    this->_hangupBtn->setVisible(false);
}

void QtCallSection::callingState(const Contact &contact)
{
    std::string info;

    this->setBackgroundColor(QColor(0, 0, 50));
    this->_stateTxt->setText(QString("Calling, awaiting response"));
    info = contact.getName() + "\n" + contact.getIp() + ":" + std::to_string(contact.getPort());
    this->_infoTxt->setText(QString(info.c_str()));
    this->_hangupBtn->move(int((this->width() - _hangupBtn->width()) / 2),
                           this->height() - (_hangupBtn->height() * 2));
}

void QtCallSection::gettingCallState(const Contact &contact)
{
    std::string info;
    std::string state = contact.getName() + " is calling";
    int padding = 10;

    this->setBackgroundColor(QColor(0, 50, 50));
    this->_stateTxt->setText(QString(state.c_str()));
    info = contact.getName() + "\n" + contact.getIp() + ":" + std::to_string(contact.getPort());
    this->_infoTxt->setText(QString(info.c_str()));
    this->_acceptBtn->setEnabled(true);
    this->_acceptBtn->setVisible(true);

    this->_hangupBtn->move(int((this->width() - ((_hangupBtn->width() * 2) + padding)) / 2),
                           this->height() - (_hangupBtn->height() * 2));
    this->_acceptBtn->move(int((this->width()) / 2 + padding),
                           this->height() - (_acceptBtn->height() * 2));


}

void QtCallSection::inCallState(const Contact &contact)
{
    this->setBackgroundColor(QColor(50, 0, 50));
    this->_stateTxt->setText("In Call");
    this->_hangupBtn->move(int((this->width() - _hangupBtn->width()) / 2),
                           this->height() - (_hangupBtn->height() * 2));
    connect(_hangupBtn, SIGNAL(clicked()), this, SLOT(hangup()));
}

void QtCallSection::setState(CallManager::State state, const Contact &contact)
{
    this->_hangupBtn->setEnabled(true);
    this->_hangupBtn->setVisible(true);
    this->_acceptBtn->setEnabled(false);
    this->_acceptBtn->setVisible(false);
    this->_infoTxt->setVisible(true);
    this->_stateTxt->setVisible(true);
    switch (state) {
        case CallManager::State::NONE:
            this->noCallState();
            break;
        case CallManager::State::WAITING_FOR_RESPONSE:
            this->callingState(contact);
            break;
        case CallManager::State::RECEIVING_CALL:
            this->gettingCallState(contact);
            break;
        case CallManager::State::IN_CALL:
            this->inCallState(contact);
            break;
    }
}

void QtCallSection::display()
{
    this->_infoTxt->resize(this->width(), int(this->height() * 0.2));
    this->_stateTxt->resize(this->width(), int(this->height() * 0.2));
    this->_stateTxt->move(0, int((this->height() - _stateTxt->height()) / 2));
    connect(_hangupBtn, SIGNAL(clicked()), this, SLOT(hangup()));
    connect(_acceptBtn, SIGNAL(clicked()), this, SLOT(accept()));
    this->show();
}

/*  SLOTS & SIGNALS  */

void QtCallSection::hangup()
{
    emit hangupEvt();
}

void QtCallSection::accept()
{
    emit acceptEvt();
}