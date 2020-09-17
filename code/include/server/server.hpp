/*
** EPITECH PROJECT, 2020
** server
** File description:
** lucas mascaut
*/

#ifndef SERVER_HPP_
#define SERVER_HPP_

#include "async.hpp"

class server
{
    public:
        server(boost::asio::io_context& io_context);

        void start_accept();
        void handle_accept(boost::shared_ptr<async> new_client, const boost::system::error_code& error);

        //boost::asio::io_context _io_context;
        //boost::asio::ip::tcp::acceptor _acceptor;

    private:
        boost::asio::io_context& _io_context;
        boost::asio::ip::tcp::acceptor _acceptor;
};

#endif /* !SERVER_HPP_ */
