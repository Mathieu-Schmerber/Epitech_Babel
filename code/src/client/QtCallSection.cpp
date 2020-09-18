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
    this->_hangup = new QPushButton(this);
    this->_hangup->setIcon(QIcon(QCoreApplication::applicationDirPath() + "/hangup.png"));
    this->_hangup->setStyleSheet("border: none;"
                                 "background: transparent;");
    this->setState(NO_CALL);
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

QtCallSection::State QtCallSection::getState() const
{
    return this->_state;
}

void QtCallSection::setBackgroundColor(const QColor &color)
{
    QPalette pal = palette();

    pal.setColor(QPalette::Background, color);
    this->setAutoFillBackground(true);
    this->setPalette(pal);
}

void QtCallSection::setState(State state, Contact *contact)
{
    std::string info;

    this->_state = state;
    if (this->_state == NO_CALL) {
        this->setBackgroundColor(Qt::black);
        this->_hangup->setEnabled(false);
        this->_hangup->setVisible(false);
        this->_infoTxt->setVisible(false);
        this->_stateTxt->setVisible(false);
    } else {
        this->setBackgroundColor(QColor(0, 0, 50));
        this->_stateTxt->setText(QString("Calling, awaiting response"));
        info = contact->getName() + "\n" + contact->getIp() + ":" + contact->getPort();
        this->_infoTxt->setText(QString(info.c_str()));
        this->_hangup->setEnabled(true);
        this->_hangup->setVisible(true);
        this->_infoTxt->setVisible(true);
        this->_stateTxt->setVisible(true);
    }
}

void QtCallSection::display()
{
    this->_infoTxt->resize(this->width(), int(this->height() * 0.2));
    this->_stateTxt->resize(this->width(), int(this->height() * 0.2));
    this->_hangup->resize(int(this->width() * 0.15), int(this->height() * 0.15));
    this->_stateTxt->move(0, int((this->height() - _stateTxt->height()) / 2));
    this->_hangup->move(int((this->width() - _hangup->width()) / 2),
                         this->height() - (_hangup->height() * 2));
    this->_hangup->setIconSize(QSize(int(this->width() * 0.15), int(this->height() * 0.15)));
    connect(_hangup, SIGNAL(clicked()), this, SLOT(hangup()));
    this->show();
}

void QtCallSection::hangup()
{
    this->setState(NO_CALL);
}