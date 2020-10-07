#include "Audio.hpp"

int main(void)
{
    Audio audio;

    audio.InitAudio();
    audio.InitInput();
    audio.InitOutput();
    audio.OpenStream();
    audio.StartStream();
    audio.CloseStream();
    return (0);
}