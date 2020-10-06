/*
** EPITECH PROJECT, 2020
** server
** File description:
** lucas mascaut
*/

#ifndef SERVER_HPP_
#define SERVER_HPP_

#include <iostream>
#include <boost/asio.hpp>
#include <boost/bind.hpp>
#include <boost/enable_shared_from_this.hpp>
#include "async_handler.hpp"
#include "database.hpp"

class server
{
    public:
        server(boost::asio::io_service& io_service);
        void start_accept();
        void handle_accept(boost::shared_ptr<async_handler> client, const boost::system::error_code& err);
    private:
        boost::asio::ip::tcp::acceptor _acceptor;
        database *_db;
};

#endif /* !SERVER_HPP_ */
