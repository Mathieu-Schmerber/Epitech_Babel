/*
** EPITECH PROJECT, 2020
** database
** File description:
** babel
*/

#include "../../include/server/database.hpp"

database::database()
{
    std::string sql;
    rc = sqlite3_open("babel.db",&db);
    if (rc) {
        std::cout << "DataBase Error: " << sqlite3_errmsg(db) << std::endl;
        sqlite3_close(db);
    }
    sql = "CREATE TABLE PEOPLE ("  \
      "ID INT PRIMARY KEY     NOT NULL," \
      "NAME           TEXT    NOT NULL);";

    rc = sqlite3_exec(db, sql.c_str(), callback, 0, &error);
    if( rc != SQLITE_OK ){
      fprintf(stderr, "SQL error: %s\n", error);
      sqlite3_free(error);
    }
}

database::~database()
{
    sqlite3_close(db);
}

int database::callback(void *not_used, int ac, char **av, char **azColName)
{
    return(0);
}