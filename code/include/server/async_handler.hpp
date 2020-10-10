/*
** EPITECH PROJECT, 2020
** async_handler
** File description:
** lucas mascaut
*/

#ifndef HANDLER_HPP_
#define HANDLER_HPP_

#include <iostream>
#include <boost/asio.hpp>
#include <boost/bind.hpp>
#include <boost/enable_shared_from_this.hpp>
#include "SQLdatabase.hpp"

class async_handler : public boost::enable_shared_from_this<async_handler>
{
    public:
        async_handler(boost::asio::io_service& io_service, SQLdatabase *db);
        static boost::shared_ptr<async_handler> create(boost::asio::io_context& io_service, SQLdatabase *db);
        boost::asio::ip::tcp::socket& get_socket();
        void start();
        void handle_read(const boost::system::error_code& err, size_t bytes);
        void handle_write(const boost::system::error_code& err, size_t bytes);

        SQLdatabase *_db;
        std::string buffer;
    private:
        boost::asio::ip::tcp::socket _socket;
        std::string msg = "Oh Hi Marc!";
        enum { max_length = 1024};
        char data[max_length];
};

#endif /* !HANDLER_HPP_ */
