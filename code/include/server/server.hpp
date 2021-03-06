/*
** EPITECH PROJECT, 2020
** server
** File description:
** lucas mascaut
*/

#ifndef SERVER_HPP_
#define SERVER_HPP_

#include <iostream>
#include <vector>
#include <boost/asio.hpp>
#include <boost/bind.hpp>
#include <boost/enable_shared_from_this.hpp>
#include "async_handler.hpp"
#include "SQLdatabase.hpp"

class server
{
    public:
        server(boost::asio::io_context& io_context);
        void start_accept();
        void handle_accept(boost::shared_ptr<async_handler> client, const boost::system::error_code& err);
    private:
        boost::asio::ip::tcp::acceptor _acceptor;
        SQLdatabase *_db;
};

#endif
