/*
** EPITECH PROJECT, 2020
** Babel
** File description:
** TODO: add description
*/

#ifndef CPP_Audio_HPP
#define CPP_Audio_HPP

#include <cstdio>
#include <cmath>
#include <iostream>
#include "portaudio.h"
#include "Opus.hpp"

typedef float SAMPLE;

#define SAMPLE_RATE         (44100)
#define PA_SAMPLE_TYPE      paInt32
#define FRAMES_PER_BUFFER   (480)
#define NUM_CHANNELS        (2)

using namespace std;

class Audio
{
    private:
        PaStreamParameters inputParameters;
        PaStreamParameters outputParameters;
        PaStream *stream;
        PaError error;
        SAMPLE *inputSample;
        SAMPLE *outputSample;

        int FuzzCallbackMethod(const void *inputBuffer, void *outputBuffer,
                            unsigned long framesPerBuffer,
                            const PaStreamCallbackTimeInfo* timeInfo,
                            PaStreamCallbackFlags statusFlags);
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
        bool AllocSample();
        SAMPLE *GetInputSample();
        SAMPLE *GetOutputSample();
        void SetOutputSample(SAMPLE *sample);
        bool OpenStream();
        bool StartStream();
        bool ReadStream();
        bool WriteStream();
        bool CloseStream();
};

#endif