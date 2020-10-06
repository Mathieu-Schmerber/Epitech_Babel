#!/usr/bin/env bash
## 
## EPITECH PROJECT, 2020
## run babel
## File description:
## compile and run
##

mkdir -p build && cd build
conan install --build=missing .. && cmake ..
cmake --build .
cd ..
