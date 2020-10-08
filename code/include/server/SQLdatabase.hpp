/*
** EPITECH PROJECT, 2020
** database
** File description:
** babel_database
*/

#ifndef DATABASE_HPP_
#define DATABASE_HPP_

#include <boost/asio.hpp>
#include <boost/bind.hpp>
#include <boost/enable_shared_from_this.hpp>
#include <sqlite3.h>
#include <iostream>

class SQLdatabase : public boost::enable_shared_from_this<SQLdatabase>
{
    public:
        SQLdatabase();
        static boost::shared_ptr<SQLdatabase> create();
        std::string getContactQuery();
        ~SQLdatabase();
        sqlite3 *db;
        int rc;
        char *error;
        static int callback(void *not_used, int ac, char **av, char **azColName);
        static int getContactList(void *not_used, int ac, char **av, char **azColName);
    private:
        //sqlite3 *db;
        //int rc;
        //char *error;
};

#endif /* !DATABASE_HPP_ */
