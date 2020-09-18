#!/usr/bin/env bash
## 
## EPITECH PROJECT, 2020
## run babel
## File description:
## compile and run
##

mkdir -p build && cd build # creates build directory
conan install .. && cmake .. && cmake --build . # compiles conan and cmake
cp ../code/resources/* bin # copies resources to build/bin
cd ..
