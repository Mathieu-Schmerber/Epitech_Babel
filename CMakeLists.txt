project(Babel)
cmake_minimum_required(VERSION 2.8.12)
add_definitions("-fPIC")

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

if(EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup()
else()
    message(WARNING "The file ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif()

set (CMAKE_CXX_FLAGS "-lboost_system -pthread")

find_package(Qt5Widgets CONFIG REQUIRED)
find_package(Qt5Network CONFIG REQUIRED)

include_directories(${CMAKE_INCLUDE_PATH})
include_directories(code/include/client)
include_directories(code/include/server)

set(SERVER_HEADERS
        code/include/server/async_handler.hpp
        code/include/server/server.hpp)

set(SERVER_SOURCES
        code/src/server/server.cpp
        code/src/server/async_handler.cpp)

set(CLIENT_HEADERS
        code/include/client/ArgParser.hpp
        code/include/client/Contact.hpp
        code/include/client/Core.hpp
        code/include/client/Database.hpp
        code/include/client/Window.hpp
        code/include/client/QtContactList.hpp
        code/include/client/QtCallSection.hpp)

set(CLIENT_SOURCES
        code/src/client/ArgParser.cpp
        code/src/client/Contact.cpp
        code/src/client/Core.cpp
        code/src/client/Database.cpp
        code/src/client/Window.cpp
        code/src/client/QtContactList.cpp
        code/src/client/QtCallSection.cpp
        code/src/client/main.cpp)

add_executable(babel_client
        ${CLIENT_HEADERS}
        ${CLIENT_SOURCES})

add_executable(babel_server
        ${SERVER_HEADERS}
        ${SERVER_SOURCES})

target_link_libraries(babel_client ${CONAN_LIBS} Qt5::Widgets Qt5::Network)
target_link_libraries(babel_server ${CONAN_LIBS})