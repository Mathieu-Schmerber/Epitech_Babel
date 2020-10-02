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
#define NUM_SECONDS     (5)
#define NUM_CHANNELS        (2)
#define SAMPLE_SILENCE  (0)
#define DITHER_FLAG     (0) 

using namespace std;

typedef struct
{
    int          frameIndex;  /* Index into sample array. */
    int          maxFrameIndex;
    SAMPLE      *recordedSamples;
} paTestData;

class Audio
{
    private:
        PaStreamParameters inputParameters;
        PaStreamParameters outputParameters;
        PaStream *inStream;
        PaStream *outStream;
        PaError error;
        SAMPLE *inputSample;
        SAMPLE *outputSample;
        paTestData data;
        int                 totalFrames;
        int                 numSamples;
        int                 numBytes;
        SAMPLE              max, val;

        static int PlayCallback(const void *inputBuffer, void *outputBuffer,
                            unsigned long framesPerBuffer,
                            const PaStreamCallbackTimeInfo* timeInfo,
                            PaStreamCallbackFlags statusFlags,
                            void *userData);

        static int RecordCallback(const void *inputBuffer, void *outputBuffer,
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
        void RecordAudio();
        void PlayAudio();
        void SetOutputSample(SAMPLE *sample);
        bool OpenInStream();
        bool OpenOutStream();
        bool StartInStream();
        bool StartOutStream();
        bool ReadStream();
        bool WriteStream();
        bool CloseInStream();
        bool CloseOutStream();
        void Terminate();
};

#endif