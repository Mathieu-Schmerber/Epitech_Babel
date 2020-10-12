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

/**
 * @brief Interface representing audio streaming libraries.
*/
class IAudioStream {
    public:
        ~IAudioStream() = default;
        virtual std::vector<uint16_t> ReadStream() = 0;
        virtual void WriteStream(std::vector<uint16_t> sample) = 0;

        virtual uint32_t getSampleRate() const = 0;
        virtual uint32_t getBufferSize() const = 0;
        virtual uint32_t getChannelNb() const = 0;
};

#endif /* !IAUDIOSTREAM_HPP_ */
