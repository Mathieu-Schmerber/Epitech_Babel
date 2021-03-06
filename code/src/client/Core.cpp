/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** Core
*/

#include <csignal>
#include <cstdlib>
#include "Core.hpp"

Core::Core(int ac, char **av)
{
    this->_app = new QApplication(ac, av);
    this->_networkForm = new QtNetworkForm("Babel: Connection");
    this->_database = nullptr;
    this->_manager = nullptr;
    this->_window = nullptr;
}

Core::~Core()
{
    delete this->_manager;
    delete this->_database;
    delete this->_window;
    delete this->_app;
}

/**
 * @brief Initializes everything, like the Window, the Database, the CallManager and handles the QtNetworkForm.
*/
void Core::initialize()
{
    std::vector<Contact> contactList;
    std::string title;

    this->_networkForm->exec();
    if (this->_networkForm->result() == QDialog::Rejected)
        return;
    _me.setName(this->_networkForm->getMyName());
    _me.setIp(this->_networkForm->getIPV4().toUtf8().constData());
    _me.setPort(this->_networkForm->getMyPort());
    this->_window = new Window({1000, 800}, "Babel");
    this->_manager = new CallManager(_window, _me);
    this->_database = new Database(_networkForm->getSrvIp(), _networkForm->getSrvPort(), this->_window);
    title = _me.getName() + " => " + _me.getIp() + ":" + std::to_string(_me.getPort());
    this->_window->setWindowTitle(title.c_str());
    this->_window->getContactList()->bindDatabase(_database);
    this->_database->connect(_me);
    this->_window->display();
    this->_app->exec();
    this->_manager->sendStopCall();
    this->_database->disconnect(_me);
}