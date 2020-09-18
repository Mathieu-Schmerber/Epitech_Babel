/*
** EPITECH PROJECT, 2020
** code
** File description:
** TODO: add description
*/

#include "Opus.hpp"

Opus::Opus(){}

Opus::~Opus(){}

bool Opus::InitEncoder()
{
    encoder = opus_encoder_create(SAMPLE_RATE, CHANNELS, OPUS_APPLICATION_AUDIO, &error);
    if (error != OPUS_OK) {
        std::cout << "opus_encoder_create failed: " << error << "\n";
        return false;
    }
    opus_encoder_ctl(encoder, OPUS_GET_BANDWIDTH(&rate));
    return true;
}

bool Opus::InitDecoder()
{
    decoder = opus_decoder_create(SAMPLE_RATE, CHANNELS, &error);
    if (error != OPUS_OK) {
        std::cout << "opus_encoder_create failed: " << error << "\n";
        return false;
    }
    return true;
}

unsigned char *Opus::Encode(SAMPLE *inputSample)
{
    unsigned char *encodedData;

    opus_encode(encoder, reinterpret_cast<opus_int16 const*>(inputSample), FRAMES_PER_BUFFER, encodedData, rate);
    return (encodedData);
}

SAMPLE *Opus::Decode(unsigned char *encodedData)
{
    auto *decodedData = new (float[FRAMES_PER_BUFFER * CHANNELS]);

    opus_decode(decoder, encodedData, rate, reinterpret_cast<opus_int16 *>(decodedData), FRAMES_PER_BUFFER, 0);
    return (decodedData);
}

bool Opus::DestroyEncoder()
{
    opus_encoder_destroy(encoder);
}

bool Opus::DestroyDecoder()
{
    opus_decoder_destroy(decoder);
}
