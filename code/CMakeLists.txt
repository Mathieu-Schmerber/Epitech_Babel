cmake_minimum_required(VERSION 3.17)
project(code)

set(CMAKE_CXX_STANDARD 14)

include_directories(include)
include_directories(include/client)

add_executable(code
        src/client/main.cpp
        src/client/ArgParser.cpp
        src/client/Contact.cpp
        src/client/Core.cpp
        src/client/Database.cpp
        src/client/Graphical.cpp
        src/client/Window.cpp)
