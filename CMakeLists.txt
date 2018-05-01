cmake_minimum_required(VERSION 3.9)
project(itsSomething)

set(CMAKE_CXX_STANDARD 17)

# Includes
include_directories(itsSomething PUBLIC "${CMAKE_SOURCE_DIR}/external/include")

# Source files
set (SOURCES
        src/main.cpp
        src/utils/util.cpp
        src/utils/util_init.cpp
        src/renderer.cpp)

# Headers
set (ROOT_HEADERS
        src/renderer.h)
set (DATA_HEADERS
        src/data/cube_data.h)
set (UTIL_HEADERS
        src/utils/util.hpp
        src/utils/util_init.hpp)
set (HEADERS
        ${ROOT_HEADERS}
        ${DATA_HEADERS}
        ${UTIL_HEADERS}
        )

# Library
add_library (itsSomething STATIC ${SOURCES} ${HEADERS})

# Installation
set (CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/macOS/itsSomething-lib")
install (TARGETS itsSomething DESTINATION lib)
install (FILES ${ROOT_HEADERS} DESTINATION include)
install (FILES ${DATA_HEADERS} DESTINATION include/data)
install (FILES ${UTIL_HEADERS} DESTINATION include/utils)
