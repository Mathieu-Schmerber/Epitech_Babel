/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Core
*/

#include "Core.hpp"

Core::Core(int ac, char **av)
{
    this->_app = new QApplication(ac, av);
    this->_networkForm = new QtNetworkForm("Babel: Connection");
}

Core::~Core()
{
    delete this->_database;
    delete this->_manager;
    delete this->_window;
    delete this->_app;
}

void Core::initialize()
{
    std::vector<Contact *> contactList;
    std::string title;

    this->_networkForm->exec();
    if (this->_networkForm->result() == QDialog::Rejected)
        return;
    this->_window = new Window({1000, 800}, "Babel");
    this->_manager = new CallManager(_window, _networkForm->getMyPort());
    this->_database = new Database(_networkForm->getSrvIp(), _networkForm->getSrvPort(), this->_window);
    title = _networkForm->getMyName() + " 127.0.0.1:" + std::to_string(_networkForm->getMyPort());
    this->_window->setWindowTitle(title.c_str());
    contactList = this->_database->getContactList();
    this->_window->getContactList()->pushContacts(contactList);
    this->_window->display();
    this->_app->exec();
}