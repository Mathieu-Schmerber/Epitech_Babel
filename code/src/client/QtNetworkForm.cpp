/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtNetworkForm
*/

#include <iostream>
#include "QtNetworkForm.hpp"
#include "Error.hpp"

QtNetworkForm::QtNetworkForm(const std::string &title) : QDialog()
{
    this->_myName = "";
    this->_myPort = -1;
    this->_srvIp = "127.0.0.1";
    this->_srvPort = -1;
    this->initGUI(title);
}

QtNetworkForm::~QtNetworkForm() {}

void QtNetworkForm::initGUI(const std::string &title)
{
    this->setWindowTitle(title.c_str());
    this->resize(500, 300);
    this->_layout = new QFormLayout(this);
    this->_databaseIpEdit = new QLineEdit();
    this->_databasePortEdit = new QLineEdit();
    this->_myNameEdit = new QLineEdit();
    this->_myIpLabel = new QLabel("127.0.0.1");
    this->_myPortEdit = new QLineEdit();
    this->_databaseTitle = new QLabel("Babel server");
    this->_myTitle = new QLabel("Babel client");
    this->_validationBtn = new QPushButton("Connect to server");

    this->_databaseTitle->setFont(QFont("sans-serif", 14, QFont::Bold));
    this->_myTitle->setFont(QFont("sans-serif", 14, QFont::Bold));
    this->_databaseIpEdit->setText("127.0.0.1");
    this->_databasePortEdit->setText("6666");
    this->_myPortEdit->setText("4242");
    this->_layout->labelForField(this->_databaseTitle);
    this->_layout->addRow(this->_databaseTitle);
    this->_layout->addRow("Ip:", this->_databaseIpEdit);
    this->_layout->addRow("Port:", this->_databasePortEdit);
    this->_layout->addRow(this->_myTitle);
    this->_layout->addRow("Nickname:", this->_myNameEdit);
    this->_layout->addRow("Ip:", this->_myIpLabel);
    this->_layout->addRow("Port:", this->_myPortEdit);
    this->_layout->addRow(this->_validationBtn);
    this->_validationBtn->setFont(QFont("sans-serif", 14));
    connect(_validationBtn, SIGNAL(clicked()), this, SLOT(saveForm()));
}

const std::string &QtNetworkForm::getSrvIp() const
{
    return _srvIp;
}

int QtNetworkForm::getSrvPort() const
{
    return _srvPort;
}

int QtNetworkForm::getMyPort() const
{
    return _myPort;
}

const std::string & QtNetworkForm::getMyName() const
{
    return _myName;
}

void QtNetworkForm::saveForm()
{
    std::cout << "QtNetworkForm => saveForm()" << std::endl;
    try {
        std::cout << "QtNetworkForm => saveForm() -> _srvIp" << std::endl;
        this->_srvIp = this->_databaseIpEdit->text().toUtf8().constData();
        std::cout << "QtNetworkForm => saveForm() -> _srvPort" << std::endl;
        this->_srvPort = this->_databasePortEdit->text().toInt();
        std::cout << "QtNetworkForm => saveForm() -> _myPort" << std::endl;
        this->_myPort = this->_myPortEdit->text().toInt();
        std::cout << "QtNetworkForm => saveForm() -> _myName" << std::endl;
        this->_myName = this->_myNameEdit->text().toUtf8().constData();
    } catch (std::exception &e) {
        throw ServerError("Wrong arguments");
    }
    std::cout << "QtNetworkForm => saveForm() => emit accept()" << std::endl;
    emit accept();
}