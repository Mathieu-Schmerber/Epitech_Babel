/*
** EPITECH PROJECT, 2020
** server
** File description:
** lucas mascaut
*/

#include "server.hpp"

server::server(boost::asio::io_service& io_service) : _acceptor(io_service, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), 6666))
{
    _db = new database;
    start_accept();
}

void server::start_accept()
{
    boost::shared_ptr<async_handler> client = async_handler::create(_acceptor.get_io_service());
    _acceptor.async_accept(client->get_socket(),
                            boost::bind(&server::handle_accept, this, client,
                            boost::asio::placeholders::error));
    
}

void server::handle_accept(boost::shared_ptr<async_handler> client, const boost::system::error_code& err)
{
    if (!err)
        client->start();
    start_accept();
}

int main(int argc, char *argv[])
{
  try
    {
    boost::asio::io_service io_service;  
    server server(io_service);
    io_service.run();
    }
  catch(std::exception& e)
    {
    std::cerr << e.what() << std::endl;
    }
  return 0;
}
