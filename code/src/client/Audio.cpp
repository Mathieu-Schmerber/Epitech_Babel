#include "Audio.hpp"
#include "portaudio.h"

Audio::Audio() : IAudioStream()
{
    _sampleRate = 48000;
    _bufferSize = 480;
    _channelNb = 1;
    _stream = nullptr;

    _error = Pa_Initialize();
    if (_error != paNoError)
        Error();
    this->OpenStream();
    this->StartStream();
}

Audio::~Audio()
{
    StopStream();
    CloseStream();
    Terminate();
}

void Audio::Error(std::string errorMessage)
{
    if (_stream)
        Pa_AbortStream(_stream);
    fprintf(stdout, errorMessage.c_str());
    fprintf(stdout, "\n");
    exit (84);
}

void Audio::Error()
{
    if (_stream)
        Pa_AbortStream(_stream);
    fprintf(stdout, Pa_GetErrorText(_error));
    fprintf(stdout, "\n");
    exit (84);
}

void Audio::OpenStream()
{
    _error = Pa_OpenDefaultStream(
        &_stream,
        _channelNb,
        _channelNb,
        paInt16,
        _sampleRate,
        _bufferSize,
        nullptr,
        nullptr
    );

    if (_error != paNoError)
        Error();
}

void Audio::StartStream()
{
    _error = Pa_StartStream(_stream);
    if (_error != paNoError)
        Error();
}

std::vector<uint16_t> Audio::ReadStream()
{
    std::vector<uint16_t> res(_bufferSize);
    long readAvailable = Pa_GetStreamReadAvailable(_stream);

    if (readAvailable < (long)_bufferSize)
        _error = Pa_ReadStream(_stream, res.data(), (unsigned long)readAvailable);
    else
        _error = Pa_ReadStream(_stream, res.data(), _bufferSize);
    if (_error != paNoError)
        Error();
    return res;
}

void Audio::WriteStream(std::vector<uint16_t> sample)
{
    while (Pa_GetStreamWriteAvailable(_stream) < (long)sample.size());
    _error = Pa_WriteStream(_stream, sample.data(), (unsigned long)sample.size());
    if (_error != paNoError)
        Error();
}


void Audio::StopStream()
{
    _error = Pa_StopStream(_stream);
    if (_error != paNoError)
        Error();
}

void Audio::CloseStream()
{
    _error = Pa_CloseStream(_stream);
    if (_error != paNoError)
        Error();
}

void Audio::Terminate()
{
    Pa_Terminate();
}

uint32_t Audio::getSampleRate() const
{
    return _sampleRate;
}
uint32_t Audio::getBufferSize() const
{
    return _bufferSize;
}
uint32_t Audio::getChannelNb() const
{
    return _channelNb;
}