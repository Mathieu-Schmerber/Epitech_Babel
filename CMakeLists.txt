project(Babel)
cmake_minimum_required(VERSION 2.8.12)
add_definitions("-fPIC")

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

find_package(Qt5Widgets CONFIG REQUIRED)

include_directories(${CMAKE_INCLUDE_PATH})
include_directories(code/include/client)

set(CLIENT_SOURCES
        code/src/client/ArgParser.cpp
        code/src/client/Contact.cpp
        code/src/client/Core.cpp
        code/src/client/Database.cpp
        code/src/client/Graphical.cpp
        code/src/client/main.cpp)

add_executable(babel_client
        ${CLIENT_SOURCES})

target_link_libraries(babel_client ${CONAN_LIBS} Qt5::Widgets)