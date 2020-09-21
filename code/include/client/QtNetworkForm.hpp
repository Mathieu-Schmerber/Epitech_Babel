/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** QtNetworkForm
*/

#ifndef CPP_QtNetworkForm_HPP
#define CPP_QtNetworkForm_HPP

#include <QtWidgets/QApplication>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QLabel>
#include <QtWidgets/QDialog>

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
    QLabel *_myIpLabel;
    QLineEdit *_myPortEdit;
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

    const std::string &getSrvIp() const;
    const std::string &getMyName() const;
    int getSrvPort() const;
    int getMyPort() const;
};

#endif
