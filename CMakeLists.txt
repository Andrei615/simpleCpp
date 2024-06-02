cmake_minimum_required(VERSION 3.13)


project(simpleProject)

set(SOURCE_EXE main.cpp)

set(SOURCE_LIB simpleLib.cpp)

add_library(simpleLib STATIC ${SOURCE_LIB})

add_executable(mainTest ${SOURCE_EXE})

target_link_libraries(mainTest simpleLib)
