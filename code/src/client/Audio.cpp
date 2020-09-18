#include <cstdio>
#include "Audio.hpp"
#include "portaudio.h"

static int gNumNoInputs = 0;

Audio::Audio(){}

Audio::~Audio(){}

bool Audio::InitAudio()
{
    error = Pa_Initialize();
    if (error != paNoError) {
        Error();
        return false;
    }
    return true;
}

bool Audio::InitInput()
{
    inputParameters.device = Pa_GetDefaultInputDevice();
    if (inputParameters.device == paNoDevice) {
      fprintf(stderr,"Error: No default input device.\n");
      Error();
      return false;
    }
    inputParameters.channelCount = 2;       /* stereo input */
    inputParameters.sampleFormat = PA_SAMPLE_TYPE;
    inputParameters.suggestedLatency = Pa_GetDeviceInfo( inputParameters.device )->defaultLowInputLatency;
    inputParameters.hostApiSpecificStreamInfo = nullptr;
    return true;
}

bool Audio::InitOutput()
{
    outputParameters.device = Pa_GetDefaultOutputDevice(); /* default output device */
    if (outputParameters.device == paNoDevice) {
      fprintf(stderr,"Error: No default output device.\n");
      Error();
      return false;
    }
    outputParameters.channelCount = 2;       /* stereo output */
    outputParameters.sampleFormat = PA_SAMPLE_TYPE;
    outputParameters.suggestedLatency = Pa_GetDeviceInfo( outputParameters.device )->defaultLowOutputLatency;
    outputParameters.hostApiSpecificStreamInfo = nullptr;
    return true;
}

int Audio::FuzzCallbackMethod(const void *inputBuffer, void *outputBuffer,
    unsigned long framesPerBuffer, const PaStreamCallbackTimeInfo *timeInfo,
    PaStreamCallbackFlags statusFlags
)
{
    auto out = (SAMPLE*)outputBuffer;
    auto in = (const SAMPLE*)inputBuffer;
    (void) timeInfo;
    (void) statusFlags;

    if (inputBuffer == nullptr) {
        for(unsigned int i = 0; i < framesPerBuffer; i++) {
            *out++ = 0;  /* left - silent */
            *out++ = 0;  /* right - silent */
        }
        gNumNoInputs += 1;
    } else {
        for (unsigned int i = 0; i < framesPerBuffer; i++) {
            *out++ = *in++;
            *out++ = *in++;
        }
    }
    return paContinue;
}

int Audio::FuzzCallback(const void *inputBuffer, void *outputBuffer,
    unsigned long framesPerBuffer, const PaStreamCallbackTimeInfo *timeInfo,
    PaStreamCallbackFlags statusFlags, void *userData)
{
    return ((Audio*)userData)->FuzzCallbackMethod(inputBuffer, outputBuffer,
                framesPerBuffer,
                timeInfo,
                statusFlags);
}

bool Audio::OpenStream()
{
    error = Pa_OpenStream(
          &stream,
          &inputParameters,
          &outputParameters,
          SAMPLE_RATE,
          FRAMES_PER_BUFFER,
          0, /* paClipOff, */  /* we won't output out of range samples so don't bother clipping them */
          FuzzCallback,
        (void*)this);
    if (error != paNoError)
        return false;
        //goto error;
    return true;
}

bool Audio::StartStream()
{
    error = Pa_StartStream(stream);
    if (error != paNoError)
        return false;
        //goto error;
    return true;
}

bool Audio::ReadStream()
{
    /* Need to be moved */
    inputSample = (SAMPLE *)((SAMPLE_RATE * NUM_CHANNELS) * (sizeof(SAMPLE)));
    if (!inputSample) {
        cerr << "Could not allocate record array." << endl;
        return false;
    }
    /* To be called in a loop */
    if ((error = Pa_ReadStream(stream, inputSample, FRAMES_PER_BUFFER)) != paNoError) {
        cerr << "Pa_ReadStream failed: " << Pa_GetErrorText(error) << endl;
        return false;
    }
    return true;
}

bool Audio::WriteStream()
{
    /* Need to be moved */
        outputSample = (SAMPLE *)((SAMPLE_RATE * NUM_CHANNELS) * (sizeof(SAMPLE)));
    if (!outputSample) {
        cerr << "Could not allocate record array." << endl;
        return false;
    }
    /* To be called in a loop */
    if ((error = Pa_WriteStream(stream, outputSample, FRAMES_PER_BUFFER)) != paNoError) {
        cerr << "Pa_WriteStream failed: " << Pa_GetErrorText(error) << endl;
        return false;
    }
    return true;
}

bool Audio::CloseStream()
{
    error = Pa_CloseStream(stream);
    if (error != paNoError) {
        cerr << "Error occured when closing stream." << endl;
        //goto error
        return false;
    }
    Pa_Terminate();
    return true;
}

bool Audio::Error()
{
    fprintf(stderr, "An error occured while using the portaudio stream\n");
    fprintf(stderr, "Error number: %d\n", error);
    fprintf(stderr, "Error message: %s\n", Pa_GetErrorText(error));
    return false;
}