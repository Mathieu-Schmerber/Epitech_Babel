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
#include <vector>
#include <string>

typedef float SAMPLE;

#define CHANNELS (2)
#define FRAMES_PER_BUFFER   (1024)
#define SAMPLE_RATE (48000)

using namespace std;

class Opus
{
    private:
        int _error;
        OpusEncoder* _encoder;
        OpusDecoder* _decoder;
        uint32_t _sampleRate;
        opus_int32 _sampleSize;
        uint32_t _bufferSize;
        int _channels;

        void Error(string errorMessage);
        void Error();

    public:
        Opus(uint32_t _sampleRate, uint32_t _bufferSize, int _channels);
        ~Opus();
        void InitEncoder();
        void InitDecoder();
        string Encode(vector<uint16_t> data);
        vector<uint16_t> Decode(string encodedData);
        void DestroyEncoder();
        void DestroyDecoder();
};

#endif

