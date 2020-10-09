/*
** EPITECH PROJECT, 2020
** IAudioEncoder
** File description:
** babel
*/

#ifndef IAUDIOENCODER_HPP_
#define IAUDIOENCODER_HPP_

#include <vector>
#include <iostream>

class IAudioEncoder {
    public:
        ~IAudioEncoder() = default;
        virtual std::vector<uint16_t> Encode(std::vector<uint16_t> data) = 0;
        virtual std::vector<uint16_t> Decode(std::vector<uint16_t> encodedData) = 0;


};

#endif /* !IAUDIOENCODER_HPP_ */
