/*
** EPITECH PROJECT, 2020
** code
** File description:
** TODO: add description
*/

#include <opus.h>
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

bool Opus::Encode()
{

}

bool Opus::Decode()
{
}


