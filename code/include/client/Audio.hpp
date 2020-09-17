/*
** EPITECH PROJECT, 2020
** Babel
** File description:
** TODO: add description
*/

#ifndef CPP_Audio_HPP
#define CPP_Audio_HPP

#include <stdio.h>
#include <math.h>
#include <iostream>
#include "Audio.hpp"
#include "portaudio.h"

#define SAMPLE_RATE         (44100)
#define PA_SAMPLE_TYPE      paFloat32
#define FRAMES_PER_BUFFER   paFramesPerBufferUnspecified

using namespace std;

class Audio
{
    private:
        PaStreamParameters inputParameters;
        PaStreamParameters outputParameters;
        PaStream *stream;
        PaError error;

        static int FuzzCallback(const void *inputBuffer, void *outputBuffer,
                         unsigned long framesPerBuffer,
                         const PaStreamCallbackTimeInfo* timeInfo,
                         PaStreamCallbackFlags statusFlags,
                         void *userData);
        bool Error();

    public:
        Audio();
        ~Audio();
        bool InitAudio();
        bool InitInput();
        bool InitOutput();
        bool OpenStream();
        bool StartStream();
        bool CloseStream();
};

#endif