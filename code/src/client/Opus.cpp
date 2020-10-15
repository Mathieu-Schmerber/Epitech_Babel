/*
** EPITECH PROJECT, 2020
** code
** File description:
** TODO: add description
*/

#include "Opus.hpp"

Opus::Opus(uint32_t sampleRate, uint32_t bufferSize, int channels) : IAudioEncoder()
{
    _sampleRate = sampleRate;
    _bufferSize = bufferSize;
    _channels = channels;
    this->InitEncoder();
    this->InitDecoder();
}

Opus::~Opus(){}

void Opus::Error(std::string errorMessage)
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
    } else {
        opus_encoder_ctl(_encoder, OPUS_GET_BANDWIDTH(&_rate));
    }
}

void Opus::InitDecoder()
{
    _decoder = opus_decoder_create(_sampleRate, _channels, &_error);
    if (_error != OPUS_OK) {
        std::cout << "opus_encoder_create failed: " << _error << "\n";
    }
}

std::vector<uint16_t> Opus::Encode(std::vector<uint16_t> data)
{
    std::vector<uint16_t> encodedData(_rate);

    opus_encode(_encoder, reinterpret_cast<opus_int16 const*>(data.data()), data.size(), reinterpret_cast<unsigned char *>(encodedData.data()), FRAMES_PER_BUFFER);
    return (encodedData);
}

std::vector<uint16_t> Opus::Decode(std::vector<uint16_t> encodedData)
{
    std::vector<uint16_t> decodedData(FRAMES_PER_BUFFER);

    opus_decode(_decoder, reinterpret_cast<unsigned char *>(encodedData.data()), _rate, reinterpret_cast<opus_int16 *>(decodedData.data()), encodedData.size(), 0);
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
