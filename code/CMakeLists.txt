cmake_minimum_required(VERSION 3.17)
project(code)

set(CMAKE_CXX_STANDARD 14)

include_directories(include)
include_directories(include/client)

add_executable(code
        include/client/Contact.hpp
        include/client/Core.hpp
        include/client/Database.hpp
        include/client/Graphical.hpp
        src/client/Contact.cpp
        src/client/Core.cpp
        src/client/Database.cpp
        src/client/Graphical.cpp
        src/client/ArgParser.cpp
        src/client/main.cpp
        src/server/main.cpp)
