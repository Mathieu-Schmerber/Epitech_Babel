/*
** EPITECH PROJECT, 2020
** async_handler
** File description:
** lucas mascaut
*/

#include "TcpQuery.hpp"
#include "async_handler.hpp"

async_handler::async_handler(boost::asio::io_context& io_context, SQLdatabase *db) : _socket(io_context), _db(db)
{
}

 boost::shared_ptr<async_handler> async_handler::create(boost::asio::io_context& io_context, SQLdatabase *db)
 {
     return boost::shared_ptr<async_handler>(new async_handler(io_context, db));
 }

 boost::asio::ip::tcp::socket& async_handler::get_socket()
 {
     return _socket;
 }

 void async_handler::start()
 {
     _socket.async_read_some(
         boost::asio::buffer(data, max_length),
         boost::bind(&async_handler::handle_read,
                    shared_from_this(),
                    boost::asio::placeholders::error,
                    boost::asio::placeholders::bytes_transferred));
 }

 void async_handler::loginUser(const Contact &user)
 {
     std::string sql = "INSERT INTO CONTACT (IP,PORT,NAME) VALUES (";
     std::string buffer = _db->getContactQuery();

     sql += "'" + user.getIp() + "'" + ','
         + "'" + std::to_string(user.getPort()) + "'" + ','
         + "'" + user.getName() + "'" + ");";
     _db->rc = sqlite3_exec(_db->db, sql.c_str(), SQLdatabase::callback, 0, &_db->error);
     if (_db->rc != SQLITE_OK)
         std::cerr << "SQL error: " << _db->error << std::endl;
     else
         std::cout << "[SQL] " << sql << std::endl;
     sqlite3_free(_db->error);
     _socket.async_write_some(
         boost::asio::buffer(buffer),
         boost::bind(&async_handler::handle_write,
             shared_from_this(),
             boost::asio::placeholders::error,
             boost::asio::placeholders::bytes_transferred));
 }

 void async_handler::logoutUser(const Contact &user)
 {
     std::ostringstream sqlQuery;
     
     sqlQuery << "DELETE FROM CONTACT WHERE IP='" << user.getIp() << "' AND PORT='" << user.getPort() << "'";
     _db->rc = sqlite3_exec(_db->db, sqlQuery.str().c_str(), SQLdatabase::callback, 0, &_db->error);
     if (_db->rc != SQLITE_OK)
         std::cerr << "SQL error: " << _db->error << std::endl;
     else
         std::cout << "[SQL] " << sqlQuery.str() << std::endl;
     sqlite3_free(_db->error);
 }

 void async_handler::handleQueries(const TcpQuery &query)
 {
     switch (query.getType())
     {
     case TcpQuery::QueryType::CONNECT:
         for (auto &usr : query.getData())
            this->loginUser(usr);
         break;
     case TcpQuery::QueryType::DISCONNECT:
         for (auto& usr : query.getData())
             this->logoutUser(usr);
         break;
     default:
         break;
     }
 }

 void async_handler::handle_read(const boost::system::error_code& err, size_t bytes)
 {
     TcpQuery query;

     if (!err)
     {
         query = TcpDeserializeQuery(data);
         this->handleQueries(query);
         memset(data, 0, sizeof(data));
         _socket.async_read_some(
             boost::asio::buffer(data, max_length),
             boost::bind(&async_handler::handle_read,
                 shared_from_this(),
                 boost::asio::placeholders::error,
                 boost::asio::placeholders::bytes_transferred));
     }
     else
     {
         std::cerr << "ERROR ==> " << err.message() << std::endl;
         _socket.close();
     }
 }

 void async_handler::handle_write(const boost::system::error_code& err, size_t bytes)
 {
     if (!err)
        std::cout << "Message sent."<< std::endl;
    else
    {
        std::cerr << "here1" << std::endl;
        std::cerr << "ERROR ==> " << err.message() << std::endl;
        _socket.close(); 
    }
 }