project(Babel)
cmake_minimum_required(VERSION 2.8.12)

if (UNIX)
    add_definitions("-fPIC")
endif()
if(WIN32)
    add_compile_options("/std:c++latest")
endif()

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5Widgets CONFIG REQUIRED)
find_package(Qt5Network CONFIG REQUIRED)

include_directories(${Boost_INCLUDE_DIRS}) 
include_directories(${CMAKE_INCLUDE_PATH})
include_directories(code/include/client)
include_directories(code/include/server)
include_directories(code/include/)

set(SERVER_HEADERS
        code/include/server/async_handler.hpp
        code/include/TcpQuery.hpp
        code/include/Contact.hpp
        code/include/server/server.hpp
        code/include/server/SQLdatabase.hpp
        )

set(SERVER_SOURCES
        code/src/server/server.cpp
        code/src/TcpQuery.cpp
        code/src/Contact.cpp
        code/src/server/async_handler.cpp
        code/src/server/SQLdatabase.cpp
        )

set(CLIENT_HEADERS
        code/include/client/Core.hpp
        code/include/client/Database.hpp
        code/include/client/Window.hpp
        code/include/client/QtContactList.hpp
        code/include/client/QtCallSection.hpp
        code/include/client/CallManager.hpp
        code/include/client/QtNetworkForm.hpp
        code/include/client/UdpQuery.hpp
        code/include/client/QtStyle.hpp
        code/include/TcpQuery.hpp
        code/include/Contact.hpp
        code/include/client/Opus.hpp
        code/include/client/Audio.hpp
        code/include/client/UdpSoundIO.hpp
        code/include/client/IAudioEncoder.hpp
        code/include/client/IAudioStream.hpp)

set(CLIENT_SOURCES
        code/src/client/Core.cpp
        code/src/client/Database.cpp
        code/src/client/main.cpp
        code/src/client/Audio.cpp
        code/src/client/Opus.cpp
        code/src/client/Window.cpp
        code/src/client/QtContactList.cpp
        code/src/client/QtCallSection.cpp
        code/src/client/CallManager.cpp
        code/src/client/QtNetworkForm.cpp
        code/src/client/main.cpp
        code/src/client/UdpQuery.cpp
        code/src/TcpQuery.cpp
        code/src/Contact.cpp
        code/src/client/Opus.cpp
        code/src/client/Audio.cpp
        code/src/client/UdpSoundIO.cpp)

add_executable(babel_client
        ${CLIENT_HEADERS}
        ${CLIENT_SOURCES})

add_executable(babel_server
        ${SERVER_HEADERS}
        ${SERVER_SOURCES})

add_custom_command(TARGET babel_client POST_BUILD
                   COMMAND ${CMAKE_COMMAND} -E copy_directory
                       ${CMAKE_SOURCE_DIR}/code/resources/ $<TARGET_FILE_DIR:babel_client>)

target_link_libraries(babel_client ${CONAN_LIBS} Qt5::Widgets Qt5::Network)
target_link_libraries(babel_server ${CONAN_LIBS})
