/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** main babel
*/

#include <iostream>
#include "Core.hpp"
#include "Error.hpp"

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

int setup(ArgParser *parser)
{
    Core *core = new Core(parser);

    try {
        core->initialize();
    } catch(Error &err) {
        std::cerr << "Error [" << err.getType() << "]: " << err.getMessage()
                  << std::endl;
        return 84;
    }
    return 0;
}

int main(int ac, char **av)
{
    auto *parser = new ArgParser(&ac, av);

    if (parser->isUsage())
        return usage(0);
    else if (!parser->isValid())
        return error("Error: Invalid Arguments.");
    return setup(parser);
}

