cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_C_COMPILER_FORCED 1)
set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_FORCED 1)

project(simpleProject)

set(SOURCE_EXE main.cpp)

set(SOURCE_LIB simpleLib.cpp)

add_library(simpleLib STATIC ${SOURCE_LIB})

add_executable(mainTest ${SOURCE_EXE})

target_link_libraries(mainTest simpleLib)
