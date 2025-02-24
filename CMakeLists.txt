cmake_minimum_required(VERSION 3.9)

project(ftab
  VERSION 0.1.5
  LANGUAGES C)

set (CMAKE_C_STANDARD 11)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

if(WIN32)
  add_definitions(-DWINDOWS)
endif()

# Replace variables by their values
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/ftab_config.h.in ${CMAKE_CURRENT_SOURCE_DIR}/ftab_config.h)


add_library( ftab ftab.c )
set_target_properties(ftab PROPERTIES VERSION ${PROJECT_VERSION} SOVERSION ${PROJECT_VERSION})

set_target_properties(ftab PROPERTIES PUBLIC_HEADER "ftab.h")
INSTALL(TARGETS ftab)
