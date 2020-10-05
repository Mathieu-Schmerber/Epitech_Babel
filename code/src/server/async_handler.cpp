/*
** EPITECH PROJECT, 2020
** async_handler
** File description:
** lucas mascaut
*/

#include "TcpQuery.hpp"
#include "async_handler.hpp"

async_handler::async_handler(boost::asio::io_service& io_service) : _socket(io_service)
{
}

 boost::shared_ptr<async_handler> async_handler::create(boost::asio::io_service& io_service)
 {
     return boost::shared_ptr<async_handler>(new async_handler(io_service));
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
     auto query = TcpQuery(TcpQuery::QueryType::CLIENT_LIST);
     query.addLine(Contact("127.0.0.1", "name4242", 4242));
     query.addLine(Contact("127.0.0.1", "name4343", 4343));

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