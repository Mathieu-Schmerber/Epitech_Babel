/*
** EPITECH PROJECT, 2020
** code
** File description:
** TODO: add description
*/

#include "Opus.hpp"
#include <unistd.h>

Opus::Opus(uint32_t sampleRate, uint32_t bufferSize, int channels)
{
    _sampleRate = sampleRate;
    _bufferSize = bufferSize;
    _channels = channels;
}

Opus::~Opus(){}

void Opus::Error(string errorMessage)
{
    exit(84);
}

void Opus::Error()
{
    exit(84);
}

void Opus::InitEncoder()
{
    _encoder = opus_encoder_create(_sampleRate, _channels, OPUS_APPLICATION_VOIP, &_error);
    if (_error != OPUS_OK) {
        std::cout << "opus_encoder_create failed: " << _error << "\n";
    }
    opus_encoder_ctl(_encoder, OPUS_GET_BANDWIDTH(&_sampleSize));
}

void Opus::InitDecoder()
{
    _decoder = opus_decoder_create(_sampleRate, _channels, &_error);
    if (_error != OPUS_OK) {
        std::cout << "opus_encoder_create failed: " << _error << "\n";
    }
}

string Opus::Encode(vector<uint16_t> data)
{
    unsigned char *encodedData = (unsigned char *)malloc(_sampleSize);

    opus_encode(_encoder, reinterpret_cast<opus_int16 const*>(data.data()), _bufferSize, encodedData, _sampleSize);
    string sample(encodedData);
    return (sample);
}

vector<uint16_t> Opus::Decode(string encodedData)
{
    vector<uint16_t> decodedData;

    opus_decode(_decoder, encodedData.c_str(), _sampleSize, reinterpret_cast<opus_int16 *>(decodedData.data()), _bufferSize, 0);
    return (decodedData);
}

void Opus::DestroyEncoder()
{
    opus_encoder_destroy(_encoder);
}

void Opus::DestroyDecoder()
{
    opus_decoder_destroy(_decoder);
}
