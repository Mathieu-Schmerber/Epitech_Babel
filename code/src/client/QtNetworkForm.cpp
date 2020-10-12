/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtNetworkForm
*/

#include <iostream>
#include "QtNetworkForm.hpp"
#include "Error.hpp"
#include "QtStyle.hpp"
#include <QtWidgets\qmessagebox.h>

QtNetworkForm::QtNetworkForm(const std::string &title) : QDialog()
{
    this->_myName = "";
    this->_myPort = -1;
    this->_srvIp = "127.0.0.1";
    this->_srvPort = -1;
    this->initGUI(title);
    this->applyStyle();
}

QtNetworkForm::~QtNetworkForm() {}

void QtNetworkForm::initGUI(const std::string &title)
{
    this->setWindowTitle(title.c_str());
    this->resize(500, 270);
    this->_layout = new QFormLayout(this);
    this->_databaseIpEdit = new QLineEdit();
    this->_databasePortEdit = new QLineEdit();
    this->_myNameEdit = new QLineEdit();
    this->_myIpLabel = new QLabel(this->getIPV4());
    this->_myPortEdit = new QLineEdit();
    this->_databaseTitle = new QLabel("Babel server");
    this->_myTitle = new QLabel("Babel client");
    this->_validationBtn = new QPushButton("Connect to server");
    this->_databaseIpLabel = new QLabel("Ip:");
    this->_databasePortLabel = new QLabel("Port:");
    this->_myNameLabel = new QLabel("Nickname:");
    this->_myIpTextLabel = new QLabel("Ip:");
    this->_myPortLabel = new QLabel("Port:");

    this->_databaseTitle->setFont(QFont("sans-serif", 14, QFont::Bold));
    this->_myTitle->setFont(QFont("sans-serif", 14, QFont::Bold));
    this->_databaseIpEdit->setText("127.0.0.1");
    this->_databasePortEdit->setText("6666");
    this->_myPortEdit->setText("4242");
    this->_layout->labelForField(this->_databaseTitle);
    this->_layout->addRow(this->_databaseTitle);
    this->_layout->addRow(this->_databaseIpLabel, this->_databaseIpEdit);
    this->_layout->addRow(this->_databasePortLabel, this->_databasePortEdit);
    this->_layout->addRow(this->_myTitle);
    this->_layout->addRow(this->_myNameLabel, this->_myNameEdit);
    this->_layout->addRow(this->_myIpTextLabel, this->_myIpLabel);
    this->_layout->addRow(this->_myPortLabel, this->_myPortEdit);
    this->_layout->addRow(this->_validationBtn);
    this->_validationBtn->setFont(QFont("sans-serif", 14));
    connect(_validationBtn, SIGNAL(clicked()), this, SLOT(saveForm()));
}

void QtNetworkForm::applyStyle()
{
    this->_databaseTitle->setStyleSheet(QtStyle::titleStyle);
    this->_myTitle->setStyleSheet(QtStyle::titleStyle);
    this->_validationBtn->setStyleSheet(QtStyle::buttonStyle);
    this->_databaseIpEdit->setStyleSheet(QtStyle::inputStyle);
    this->_databasePortEdit->setStyleSheet(QtStyle::inputStyle);
    this->_myNameEdit->setStyleSheet(QtStyle::inputStyle);
    this->_myPortEdit->setStyleSheet(QtStyle::inputStyle);
    this->_databaseIpLabel->setStyleSheet(QtStyle::labelStyle);
    this->_databasePortLabel->setStyleSheet(QtStyle::labelStyle);
    this->_myIpLabel->setStyleSheet(QtStyle::labelStyle);
    this->_myIpTextLabel->setStyleSheet(QtStyle::labelStyle);
    this->_myNameLabel->setStyleSheet(QtStyle::labelStyle);
    this->_myPortLabel->setStyleSheet(QtStyle::labelStyle);
    this->setStyleSheet("background: #3e4349;");
}

/**
 * @brief Gets the world wild IPv4 of the client.
 * @return The clients IPv4
*/
QString QtNetworkForm::getIPV4() const
{
    QList<QHostAddress> list = QHostInfo::fromName(QHostInfo::localHostName()).addresses();
    
    for (auto& addr : list)
    {
        if (addr.protocol() == QAbstractSocket::NetworkLayerProtocol::IPv4Protocol)
            return addr.toString();
    }
    return QString("127.0.0.1");
}

/**
 * @brief Gets the referenced server IP.
*/
const std::string &QtNetworkForm::getSrvIp() const
{
    return _srvIp;
}

/**
 * @brief Gets the referenced server port.
*/
int QtNetworkForm::getSrvPort() const
{
    return _srvPort;
}

/**
 * @brief Gets the referenced client's port.
*/
int QtNetworkForm::getMyPort() const
{
    return _myPort;
}

/**
 * @brief Gets the referenced client's username.
*/
const std::string & QtNetworkForm::getMyName() const
{
    return _myName;
}

/**
 * @brief Save the QtNetworkForm so each referenced value is gettable.
*/
void QtNetworkForm::saveForm()
{
    try {
        this->_srvIp = this->_databaseIpEdit->text().toUtf8().constData();
        this->_srvPort = this->_databasePortEdit->text().toInt();
        this->_myPort = this->_myPortEdit->text().toInt();
        this->_myName = this->_myNameEdit->text().toUtf8().constData();
    } catch (std::exception &e) {
        throw ServerError("Wrong arguments");
    }
    if (_myPort == 4343 || _myPort == 4444) {
        QMessageBox::critical(this, "Connection refused", QString("Your port must be different from 4343 and 4444."));
        return;
    }
    emit accept();
}