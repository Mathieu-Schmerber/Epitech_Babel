/*
** EPITECH PROJECT, 2020
** code
** File description:
** TODO: add description
*/

#ifndef CPP_OPUS_HPP
#define CPP_OPUS_HPP

#include <iostream>

#define CHANNELS (2)
#define SAMPLE_RATE (44100)

using namespace std;

class Opus
{
    private:
        int error;
        OpusEncoder* encoder;
        OpusDecoder* decoder;

    public:
        Opus();
        ~Opus();
        bool InitEncoder();
        bool InitDecoder();
        bool Encode();
        bool Decode();
        bool DestroyEncoder();
        bool DestroyDecoder();
};

#endif

