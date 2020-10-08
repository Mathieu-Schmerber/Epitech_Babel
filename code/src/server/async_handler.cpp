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

    TcpQuery query(TcpQuery::CLIENT_LIST);
    query.addLine(Contact("127.0.0.1", "ok", 4242));

    _socket.async_write_some(
        boost::asio::buffer(TcpSerializeQuery(query)),
        boost::bind(&async_handler::handle_write,
                    shared_from_this(),
                    boost::asio::placeholders::error,
                    boost::asio::placeholders::bytes_transferred));
 }

 void async_handler::handle_read(const boost::system::error_code& err, size_t bytes)
 {
     if (!err) {
        std::cout << data << std::endl;
        TcpQuery query = TcpDeserializeQuery(data);
        if (query.getType() == TcpQuery::CONNECT) {
            std::string sql = "INSERT INTO CONTACT (IP,PORT,NAME)" \
                              "VALUES (";

            sql += "'" + query.getData()[0].getIp() + "'" + ',' 
                + "'" +std::to_string(query.getData()[0].getPort()) + "'" + ',' 
                + "'" + query.getData()[0].getName() + "'" + ");";

            std::cout << sql << std::endl;
            _db->rc = sqlite3_exec(_db->db, sql.c_str(), SQLdatabase::callback, 0,&_db->error);
             if( _db->rc != SQLITE_OK ) {
                fprintf(stderr, "SQL error: %s\n", _db->error);
             }
            sqlite3_free(_db->error);
        }
        memset(data, 0, sizeof(data));
        _socket.async_read_some(
        boost::asio::buffer(data, max_length),
        boost::bind(&async_handler::handle_read,
                    shared_from_this(),
                    boost::asio::placeholders::error,
                    boost::asio::placeholders::bytes_transferred));
     } else {
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
        std::cerr << "ERROR ==> " << err.message() << std::endl;
        _socket.close(); 
    }
 }