/*
** EPITECH PROJECT, 2020
** database
** File description:
** babel
*/

#include "SQLdatabase.hpp"

SQLdatabase::SQLdatabase()
{
    std::string sql;
    rc = sqlite3_open("babel.db",&db);
    if (rc) {
        std::cout << "DataBase Error: " << sqlite3_errmsg(db) << std::endl;
        sqlite3_close(db);
    }
    sql = "CREATE TABLE CONTACT ("  \
      "ID             INT PRIMARY KEY     NOT NULL," \
      "IP             VARCHAR(30)         NOT NULL," \
      "PORT           VARCHAR(10)         NOT NULL," \
      "NAME           TEXT                NOT NULL);";

    rc = sqlite3_exec(db, sql.c_str(), callback, 0, &error);
    if( rc != SQLITE_OK ){
      if (rc != 1)
        fprintf(stderr, "SQL error: %s\n", error);
      sqlite3_free(error);
    }
}

SQLdatabase::~SQLdatabase()
{
    sqlite3_close(db);
}

int SQLdatabase::callback(void *not_used, int ac, char **av, char **azColName)
{
    return(0);
}