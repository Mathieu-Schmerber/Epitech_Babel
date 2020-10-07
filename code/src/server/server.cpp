/*
** EPITECH PROJECT, 2020
** server
** File description:
** lucas mascaut
*/

#include "server.hpp"

server::server(boost::asio::io_context& io_context) : _acceptor(io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), 6666))
{
    _db = new SQLdatabase();
    start_accept();
}

void server::start_accept()
{
    boost::asio::executor e = _acceptor.get_executor();
    boost::asio::execution_context &e_context = e.context();
    boost::asio::io_context &io_context = static_cast<boost::asio::io_context&>(e_context);
    boost::shared_ptr<async_handler> client = async_handler::create(io_context);
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
    boost::asio::io_context io_context;  
    server server(io_context);
    io_context.run();
    }
  catch(std::exception& e)
    {
    std::cerr << e.what() << std::endl;
    }
  return 0;
}
