/*
** EPITECH PROJECT, 2020
** code
** File description:
** TODO: add description
*/

#ifndef CPP_OPUS_HPP
#define CPP_OPUS_HPP

#include <opus.h>
#include <iostream>

typedef float SAMPLE;

#define CHANNELS (2)
#define FRAMES_PER_BUFFER   (480)
#define SAMPLE_RATE (44100)

using namespace std;

class Opus
{
    private:
        int error;
        OpusEncoder* encoder;
        OpusDecoder* decoder;
        opus_int32 rate;

    public:
        Opus();
        ~Opus();
        bool InitEncoder();
        bool InitDecoder();
        unsigned char *Encode(SAMPLE *inputSample);
        SAMPLE *Decode(unsigned char *encodedData);
        bool DestroyEncoder();
        bool DestroyDecoder();
};

#endif

