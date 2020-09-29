project(Babel)
cmake_minimum_required(VERSION 2.8.12)

if (UNIX)
    add_definitions("-fPIC")
endif()
if(WIN32)
    add_compile_options("/std:c++latest")
endif()

if(EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup()
else()
    message(WARNING "The file ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif()

macro(get_WIN32_WINNT version)
    if (WIN32 AND CMAKE_SYSTEM_VERSION)
        set(ver ${CMAKE_SYSTEM_VERSION})
        string(REPLACE "." "" ver ${ver})
        string(REGEX REPLACE "([0-9])" "0\\1" ver ${ver})

        set(${version} "0x${ver}")
    endif()
endmacro()

get_WIN32_WINNT(ver)
add_definitions(-D_WIN32_WINNT=${ver})

set(Boost_USE_STATIC_LIBS OFF) 
set(Boost_USE_MULTITHREADED ON)  
set(Boost_USE_STATIC_RUNTIME OFF)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5Widgets CONFIG REQUIRED)
find_package(Qt5Network CONFIG REQUIRED)
find_package(Boost 1.69.0 COMPONENTS REQUIRED)

include_directories(${Boost_INCLUDE_DIRS}) 
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
        code/include/client/Contact.hpp
        code/include/client/Core.hpp
        code/include/client/Database.hpp
        code/include/client/Window.hpp
        code/include/client/QtContactList.hpp
        code/include/client/QtCallSection.hpp
        code/include/client/CallManager.hpp
        code/include/client/QtNetworkForm.hpp)

set(CLIENT_SOURCES
        code/src/client/Contact.cpp
        code/src/client/Core.cpp
        code/src/client/Database.cpp
        code/src/client/Window.cpp
        code/src/client/QtContactList.cpp
        code/src/client/QtCallSection.cpp
        code/src/client/CallManager.cpp
        code/src/client/QtNetworkForm.cpp
        code/src/client/main.cpp)

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
target_link_libraries(babel_server ${Boost_LIBRARIES})