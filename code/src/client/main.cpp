/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** main babel
*/


#include <vector>
#include <iostream>
#include <string>
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

int setup(int ac, char **av)
{
    Core *core = new Core(ac, av);

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
    if (ac == 2 && std::string(av[1]) == "-h")
        return usage(0);
    return setup(ac, av);
}

