cmake_minimum_required(VERSION 3.9)

project(ftab
  LANGUAGES C)

set (CMAKE_C_STANDARD 11)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

if(WIN32)
  add_definitions(-DWINDOWS)
endif()


add_library( ftab ftab.c )

set_target_properties(ftab PROPERTIES PUBLIC_HEADER "ftab.h")
INSTALL(TARGETS ftab)
