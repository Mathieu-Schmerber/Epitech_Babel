#include <cstdio>
#include "Audio.hpp"
#include "portaudio.h"
#include <unistd.h>

static int gNumNoInputs = 0;

Audio::Audio(){}

Audio::~Audio(){}

bool Audio::InitAudio()
{
    data.maxFrameIndex = totalFrames = NUM_SECONDS * SAMPLE_RATE / 100; /* Record for a few seconds. */
    data.frameIndex = 0;
    numSamples = totalFrames * NUM_CHANNELS;
    numBytes = numSamples * sizeof(SAMPLE);
    data.recordedSamples = (SAMPLE *) malloc( numBytes ); /* From now on, recordedSamples is initialised. */
    if( data.recordedSamples == NULL )
    {
        printf("Could not allocate record array.\n");
        exit (1);
    }

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

int Audio::PlayCallback(const void *inputBuffer, void *outputBuffer,
    unsigned long framesPerBuffer, const PaStreamCallbackTimeInfo *timeInfo,
    PaStreamCallbackFlags statusFlags, void *userData)
{
       paTestData *data = (paTestData*)userData;
       SAMPLE *rptr = &data->recordedSamples[data->frameIndex * NUM_CHANNELS];
       SAMPLE *wptr = (SAMPLE*)outputBuffer;
       unsigned int i;
       int finished;
       unsigned int framesLeft = data->maxFrameIndex - data->frameIndex;
   
       (void) inputBuffer; /* Prevent unused variable warnings. */
       (void) timeInfo;
       (void) statusFlags;
       (void) userData;
   
       if( framesLeft < framesPerBuffer )
       {
           /* final buffer... */
           for( i=0; i<framesLeft; i++ )
           {
               *wptr++ = *rptr++;  /* left */
               if( NUM_CHANNELS == 2 ) *wptr++ = *rptr++;  /* right */
           }
           for( ; i<framesPerBuffer; i++ )
           {
               *wptr++ = 0;  /* left */
               if( NUM_CHANNELS == 2 ) *wptr++ = 0;  /* right */
           }
           data->frameIndex += framesLeft;
           finished = paComplete;
       }
       else
       {
           for( i=0; i<framesPerBuffer; i++ )
           {
               *wptr++ = *rptr++;  /* left */
               if( NUM_CHANNELS == 2 ) *wptr++ = *rptr++;  /* right */
           }
           data->frameIndex += framesPerBuffer;
           finished = paContinue;
       }
       return finished;
}

int Audio::RecordCallback(const void *inputBuffer, void *outputBuffer,
    unsigned long framesPerBuffer, const PaStreamCallbackTimeInfo *timeInfo,
    PaStreamCallbackFlags statusFlags, void *userData)
{
paTestData *data = (paTestData*)userData;
       const SAMPLE *rptr = (const SAMPLE*)inputBuffer;
       SAMPLE *wptr = &data->recordedSamples[data->frameIndex * NUM_CHANNELS];
       long framesToCalc;
       long i;
       int finished;
       unsigned long framesLeft = data->maxFrameIndex - data->frameIndex;
   
       (void) outputBuffer; /* Prevent unused variable warnings. */
       (void) timeInfo;
       (void) statusFlags;
       (void) userData;
   
       if( framesLeft < framesPerBuffer )
       {
           framesToCalc = framesLeft;
           finished = paComplete;
       }
       else
       {
           framesToCalc = framesPerBuffer;
           finished = paContinue;
       }
   
       if( inputBuffer == NULL )
       {
           for( i=0; i<framesToCalc; i++ )
           {
               *wptr++ = SAMPLE_SILENCE;  /* left */
               if( NUM_CHANNELS == 2 ) *wptr++ = SAMPLE_SILENCE;  /* right */
           }
       }
       else
       {
           for( i=0; i<framesToCalc; i++ )
           {
               *wptr++ = *rptr++;  /* left */
               if( NUM_CHANNELS == 2 ) *wptr++ = *rptr++;  /* right */
           }
       }
       data->frameIndex += framesToCalc;
       return finished;
}


bool Audio::OpenInStream()
{
    error = Pa_OpenStream(
        &inStream,
        &inputParameters,
        NULL,
        SAMPLE_RATE,
        FRAMES_PER_BUFFER,
        paClipOff, /* we won't output out of range samples so don't bother clipping them */
        RecordCallback,
        &data);
    if (error != paNoError)
        return false;
        //goto error;
    return true;
}

bool Audio::OpenOutStream()
{
    error = Pa_OpenStream(
          &outStream,
          NULL,
          &outputParameters,
          SAMPLE_RATE,
          FRAMES_PER_BUFFER,
          0, /* paClipOff, */  /* we won't output out of range samples so don't bother clipping them */
          PlayCallback,
        &data);
    if (error != paNoError)
        return false;
        //goto error;
    return true;
}

bool Audio::StartInStream()
{
    error = Pa_StartStream(inStream);
    if (error != paNoError)
        return false;

    return true;
}

bool Audio::StartOutStream()
{
    error = Pa_StartStream(outStream);
    if (error != paNoError)
        return false;
    return true;
}


bool Audio::AllocSample()
{
    inputSample = (SAMPLE *) malloc((SAMPLE_RATE * NUM_CHANNELS) * (sizeof(SAMPLE)));
    if (!inputSample) {
        cerr << "Could not allocate record array." << endl;
        return false;
    }
    return true;
}

SAMPLE * Audio::GetInputSample()
{
    return (inputSample);
}

SAMPLE * Audio::GetOutputSample()
{
    return (outputSample);
}

void Audio::SetOutputSample(SAMPLE *sample)
{
    outputSample = sample;
}

bool Audio::CloseInStream()
{
    error = Pa_CloseStream(inStream);
    if (error != paNoError) {
        cerr << "Error occured when closing stream." << endl;
        //goto error
        return false;
    }
    return true;
}

bool Audio::CloseOutStream()
{
    error = Pa_CloseStream(outStream);
    if (error != paNoError) {
        cerr << "Error occured when closing stream." << endl;
        //goto error
        return false;
    }
    return true;
}

void Audio::Terminate()
{
    Pa_Terminate();
}

bool Audio::Error()
{
    fprintf(stderr, "An error occured while using the portaudio stream\n");
    fprintf(stderr, "Error number: %d\n", error);
    fprintf(stderr, "Error message: %s\n", Pa_GetErrorText(error));
    return false;
}

void Audio::RecordAudio()
{
    data.frameIndex = 0;
    for (int i = 0; i < numSamples; i++) data.recordedSamples[i] = 0;
    InitInput();
    OpenInStream();
    StartInStream();
    while ((error = Pa_IsStreamActive ( inStream)) == 1)
    {
//        write(1, "REC\n", 4);
//        Pa_Sleep(100);
    }
    CloseInStream();
}

void Audio::PlayAudio()
{

    InitOutput();
    OpenOutStream();
    StartOutStream();
    data.frameIndex = 0;
    while ((error = Pa_IsStreamActive(outStream)) == 1)
    {
 //       write(1, "PLE\n", 4);
  //      Pa_Sleep(100);
        
    }
    CloseOutStream();
}