/*
** EPITECH PROJECT, 2020
** IAudioStream
** File description:
** babel
*/

#ifndef IAUDIOSTREAM_HPP_
#define IAUDIOSTREAM_HPP_

#include <vector>
#include <iostream>

class IAudioStream {
    public:
        ~IAudioStream() = default;
        virtual std::vector<uint16_t> ReadStream() = 0;
        virtual void WriteStream(std::vector<uint16_t> sample) = 0;

};

#endif /* !IAUDIOSTREAM_HPP_ */
