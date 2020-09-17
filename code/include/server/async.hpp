/*
** EPITECH PROJECT, 2020
** Async babel
** File description:
** lucas msacaut
*/

#ifndef ASYNC_HPP_
#define ASYNC_HPP_

#include <iostream>
#include <string>
#include <boost/bind.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/enable_shared_from_this.hpp>
#include <boost/asio.hpp>
#include <boost/thread.hpp>

class async : public boost::enable_shared_from_this<async>
{
    public:
        async(boost::asio::io_service& io_service);
        static boost::shared_ptr<async> create(boost::asio::io_service& io_service);
        boost::asio::ip::tcp::socket& _get_socket();
        void start();
        void hdl_write(const boost::system::error_code& error, size_t bytes);

    private:
        boost::asio::ip::tcp::socket _socket;
        std::string _msg;

};

#endif /* !ASYNC_HPP_ */
