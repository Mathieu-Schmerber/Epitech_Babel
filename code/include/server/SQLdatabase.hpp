/*
** EPITECH PROJECT, 2020
** database
** File description:
** babel_database
*/

#ifndef DATABASE_HPP_
#define DATABASE_HPP_

#include <sqlite3.h>
#include <iostream>

class SQLdatabase
{
    public:
        SQLdatabase();
        ~SQLdatabase();

        static int callback(void *not_used, int ac, char **av, char **azColName);
    private:
        sqlite3 *db;
        int rc;
        char *error;
};

#endif /* !DATABASE_HPP_ */
