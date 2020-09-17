/*
** EPITECH PROJECT, 2020
** server
** File description:
** babel
*/

#include "server.hpp"

server::server(boost::asio::io_context& io_context) : _io_context(io_context), _acceptor(io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), 1234))
{
    start_accept();
}

void server::start_accept()
{
    boost::shared_ptr<async> new_client = async::create(_io_context);
    _acceptor.async_accept(new_client->_get_socket(),
                            boost::bind(&server::handle_accept, this, new_client,
                            boost::asio::placeholders::error));
}

void server::handle_accept(boost::shared_ptr<async> new_client,
                           const boost::system::error_code& error)
{
    if (!error)
    {
      new_client->start();
    }
    start_accept();
}

int main()
{
  try
  {
    boost::asio::io_context io_context;
    server server(io_context);
    io_context.run();
  }
  catch (std::exception& e)
  {
    std::cerr << e.what() << std::endl;
  }
  return 0;
}