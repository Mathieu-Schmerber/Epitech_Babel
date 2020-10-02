/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** main babel
*/

#include "Audio.hpp"
#include "Opus.hpp"
#include <iostream>
#include <unistd.h>
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
    } catch(Error &err) { //TODO: Link custom error class
        std::cerr << "Error [" << err.getType() << "]: " << err.getMessage()
                  << std::endl;
        return 84;
    }
    return 0;
}

int main(int ac, char **av)
{
    /*auto *parser = new ArgParser(&ac, av);

    if (parser->isUsage())
        return usage(0);
    else if (!parser->isValid())
        return error("Error: Invalid Arguments.");
    return setup(parser);*/
    Audio audio;
    Opus opus;
    unsigned char *encoded;

    write(1, "t po trua?\n", 10);
    audio.InitAudio();
    write(1, "t po trub?\n", 10);
    while (true) {
    write(1, "t po truc?\n", 10);
        audio.RecordAudio();
        audio.PlayAudio();
    }
    return (0);
}

