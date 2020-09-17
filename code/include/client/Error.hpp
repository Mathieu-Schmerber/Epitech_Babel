/*
** EPITECH PROJECT, 2020
** OOP_indie_studio_2019
** File description:
** Error
*/

#ifndef OOP_ERROR_HPP
#define OOP_ERROR_HPP

#include <string>

class Error : public std::exception {
private:
    std::string _message;
    std::string _type;
public:
    explicit Error(std::string const &message,
                   std::string const &type = "Unknown") {
        _type = type;
        _message = message;
    }
    ~Error() override = default;
    const char *what() const noexcept override { return _message.c_str(); };
    std::string const &getType() const { return _type; }
    std::string const &getMessage() const { return _message; }
};

class ServerError : public Error {
public:
    explicit ServerError(std::string const &message,
                         std::string const &type = "Server")
                         : Error(message, type) {}
};

#endif //OOP_ERROR_HPP
