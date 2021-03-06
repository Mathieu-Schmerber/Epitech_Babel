/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtNetworkForm
*/

#ifndef CPP_QtNetworkForm_HPP
#define CPP_QtNetworkForm_HPP

#include <QtWidgets/QApplication>
#include <QtNetwork/QHostInfo>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QLabel>
#include <QtWidgets/QDialog>

/**
 * @brief A window used to collect server's and client's informations before connection.
*/
class QtNetworkForm : public QDialog
{
    Q_OBJECT
private:
    QLabel *_databaseTitle;
    QLabel *_myTitle;
    QFormLayout *_layout;
    QLineEdit *_databaseIpEdit;
    QLineEdit *_databasePortEdit;
    QLineEdit *_myNameEdit;
    QLabel *_databaseIpLabel;
    QLabel *_databasePortLabel;
    QLabel *_myNameLabel;
    QLabel *_myIpLabel;
    QLabel *_myIpTextLabel;
    QLineEdit *_myPortEdit;
    QLabel *_myPortLabel;
    QPushButton *_validationBtn;

private:
    std::string _srvIp;
    std::string _myName;
    int _srvPort;
    int _myPort;

private slots:
    void saveForm();

public:
		QtNetworkForm(const std::string &title);
		~QtNetworkForm();

        QString getIPV4() const;
        void initGUI(const std::string &title);
        void applyStyle();
        const std::string &getSrvIp() const;
        const std::string &getMyName() const;
        int getSrvPort() const;
        int getMyPort() const;
};

#endif
