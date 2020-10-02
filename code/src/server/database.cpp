/*
** EPITECH PROJECT, 2020
** database
** File description:
** babel
*/

#include "../../include/server/database.hpp"

database::database()
{
    rc = sqlite3_open("babel.db",&db);
}

database::~database()
{
    sqlite3_close(db);
}

int database::callback(void *not_used, int ac, char **av, char **azColName)
{
    return(0);
}