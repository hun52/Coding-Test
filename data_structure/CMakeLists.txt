# NOTE 
# MAKE A SHARED LIBRARY by This CMake. --> Make a common file

# 1. sub directory makes own object library
# 2. Get all object library list after [#1]
# 3. Make a shared library

# ----------------------------------------------------------------------------
# Directories
# ----------------------------------------------------------------------------
set(CT_TARGET_NAME              "")
set(CT_TARGET_DIR               "${CMAKE_CURRENT_SOURCE_DIR}")

# ----------------------------------------------------------------------------
# Make a shared library target
# ----------------------------------------------------------------------------
get_filename_component(CT_TARGET_NAME ${CT_TARGET_DIR} NAME_WE)
set(${CT_TARGET_NAME}_OBJ_LIST  "" CACHE INTERNAL "List variable populated by subdirectories")
message(STATUS "[MAKE TARGET] : ${CT_TARGET_NAME}") 


### 1. sub directory makes own object library ###
file(GLOB SUBDIRECTORIES LIST_DIRECTORIES true ${CT_TARGET_DIR}/*)

foreach(subdir ${SUBDIRECTORIES})
    if(IS_DIRECTORY ${subdir})
        add_subdirectory(${subdir})
    endif()
endforeach()

### 2. Get all object library list after [#1]
message(STATUS "!!! list: ${${CT_TARGET_NAME}_OBJ_LIST}")


