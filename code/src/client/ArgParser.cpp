/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** ArgParser
*/

#include <algorithm>
#include "ArgParser.hpp"

ArgParser::ArgParser(int *ac, char **av) : _ac(ac), _av(av) {}

ArgParser::~ArgParser() = default;

bool ArgParser::isUsage() const
{
    return (*this->_ac == 2 && (std::string(this->_av[1]) == "-h" ||
    std::string(this->_av[1]) == "--help"));
}

bool ArgParser::isValid() const
{
    std::string s;

    if (*this->_ac != 3)
        return false;
    else
        s = std::string(this->_av[2]);
    return (std::find_if(s.begin(), s.end(), [](unsigned char c)
    { return !std::isdigit(c); }) == s.end());
}

std::pair<std::string, int> ArgParser::getParsedArgs() const
{
    return {std::string(this->_av[1]), std::stoi(this->_av[2])};
}

int *ArgParser::getAC() const
{
    return this->_ac;
}

char ** ArgParser::getAV() const
{
    return this->_av;
}