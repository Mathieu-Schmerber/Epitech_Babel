/*
** EPITECH PROJECT, 2020
** Babel
** File description:
** TODO: add description
*/

#ifndef CPP_Audio_HPP
#define CPP_Audio_HPP

#include <vector>
#include <cstdio>
#include <cmath>
#include <iostream>
#include <cstdlib>
#include <cstring>
#include "portaudio.h"
#include "Opus.hpp"
#include "IAudioStream.hpp"

class Audio : public IAudioStream
{
    private:
        uint32_t _sampleRate;
        uint32_t _bufferSize;
        uint32_t _channelNb;
        PaError _error;
        PaStream *_stream;

        void Error(std::string errorMessage);
        void Error();

    public:
        Audio();
        ~Audio();
        void OpenStream();
        void StartStream();
        std::vector<uint16_t> ReadStream();
        void WriteStream(std::vector<uint16_t> sample);
        void StopStream();
        void CloseStream();
        void Terminate();

        const uint32_t getSampleRate();
        const uint32_t getBufferSize();
        const uint32_t getChannelNb();
};

#endif