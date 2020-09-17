/*
** EPITECH PROJECT, 2020
** asynclucas mascaut
** File description:
** async
*/

#include "async.hpp"

async::async(boost::asio::io_service& io_service) : _socket(io_service),_msg(122222,'\n')
{ 
}

boost::shared_ptr<async> async::create(boost::asio::io_service& io_service)
{
    return boost::shared_ptr<async>(new async(io_service));
}

boost::asio::ip::tcp::socket& async::_get_socket()
{
    return (_socket);
}

void async::start()
{
    while (_socket.is_open()) {
        boost::asio::async_write(_socket, 
                                boost::asio::buffer(_msg),
                                boost::bind(&async::hdl_write,
                                shared_from_this(),boost::asio::placeholders::error,
                                boost::asio::placeholders::bytes_transferred));
    }
}

void async::hdl_write(const boost::system::error_code& error, size_t bytes)
{
    if  (error) {
        if (_socket.is_open()) {
            std::cout << "Sending Error" << std::endl;
            _socket.close();
        }
    }
}