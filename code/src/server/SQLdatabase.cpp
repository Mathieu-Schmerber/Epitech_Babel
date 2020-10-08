/*
** EPITECH PROJECT, 2020
** database
** File description:
** babel
*/

#include "TcpQuery.hpp"
#include "SQLdatabase.hpp"
#include "Contact.hpp"

SQLdatabase::SQLdatabase()
{
    std::string sql;
    rc = sqlite3_open("babel.db",&db);
    if (rc) {
        std::cout << "DataBase Error: " << sqlite3_errmsg(db) << std::endl;
        sqlite3_close(db);
    }
    sql = "CREATE TABLE CONTACT ("  \
      "ID             INTEGER PRIMARY KEY AUTOINCREMENT," \
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

int SQLdatabase::getContactList(void *data, int ac, char **av, char **azColName)
{
    std::string port;
    std::string name;
    std::string ip;

    for (int i = 0; i < ac; i++) {
        if (strcmp(azColName[i], "NAME") == 0)
            name.assign(av[i]);
        if (strcmp(azColName[i], "PORT") == 0)
            port.assign(av[i]);
        if (strcmp(azColName[i], "IP") == 0)
            ip.assign(av[i]);
    }
    Contact contact(ip, name, std::stoi(port));
    std::vector<Contact> *contactList = static_cast<std::vector<Contact>*>(data);
    contactList->push_back(contact);
    return 0;
}

std::string SQLdatabase::getContactQuery() {
    TcpQuery query(TcpQuery::CONNECT);

    if (query.getType() == TcpQuery::CONNECT) {
        std::vector<Contact> contacts;
        std::string sqlselect = "SELECT * from CONTACT";
        rc = sqlite3_exec(db, sqlselect.c_str(), SQLdatabase::getContactList, static_cast<void *>(&contacts), &error);
        if(rc != SQLITE_OK ) {
            fprintf(stderr, "SQL error: %s\n", error);
        }
        sqlite3_free(error);
        query.setData(contacts);
    }
    std::string serialised(TcpSerializeQuery(query));
    return serialised;
}
