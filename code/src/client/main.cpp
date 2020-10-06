/*
** EPITECH PROJECT, 2020
** Mathieu Schmerber
** File description:
** main babel
*/

#include "Audio.hpp"
#include "Opus.hpp"
#include <vector>
#include <iostream>
#include <unistd.h>
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
    Opus opus(audio.getSampleRate(), audio.getBufferSize(), audio.getChannelNb());

    vector<uint16_t> test;
    vector<uint16_t> sample;

    audio.OpenStream();
    audio.StartStream();
    opus.InitDecoder();
    opus.InitEncoder();
    printf("Wire on. Will run %d seconds.\n", 4); fflush(stdout);
    for (size_t i = 0; i < (4 * 48000)/480; i++) {
        test = audio.ReadStream();
        sample = opus.Encode(test);
        test = opus.Decode(sample);
        audio.WriteStream(test);
    }
    printf("Wire off.\n"); fflush(stdout);
    return (0);
}

