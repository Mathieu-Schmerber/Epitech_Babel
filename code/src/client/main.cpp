/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** main babel
*/

#include <iostream>
#include "ArgParser.hpp"
#include "Core.hpp"

int error(const std::string &msg)
{
    std::cerr << msg << std::endl;
    return 84;
}

int usage(int returnValue)
{
    printf("USAGE:\n\t./babel_client ip port\n");
    printf("\tip\tis the server ip address.\n");
    printf("\tport\tis the server port.\n");
    return returnValue;
}

int setup(const std::pair<std::string, int> &args)
{
    Core *core = new Core(args.first, args.second);

    try {
        core->initialize();
    } catch(std::exception &error) { //TODO: Link custom error class
        return 84;
    }
    return 0;
}

int main(int ac, char **av)
{
    auto *parser = new ArgParser(ac, av);

    if (parser->isUsage())
        return usage(0);
    else if (!parser->isValid())
        return error("Error: Invalid Arguments.");
    return setup(parser->getParsedArgs());
}

