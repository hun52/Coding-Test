project(CODING_TEST)
cmake_minimum_required(VERSION 3.16) # Ubuntu 20.04 APT


############## Check Platform ###############
# Only MAC OS, LINUX(ubuntu 20.04)
#############################################

############# Directory Setting #############
# Current Directory: Proect_directory
# Find subdirectory, 
# if sub-directory has CMakeLists.txt, add subdirectory
#############################################
set(CT_DIR              "${CMAKE_SOURCE_DIR}"                   CACHE PATH "Coding Test PRJ Directory")
set(CT_CMAKE_DIR        "${CMAKE_SOURCE_DIR}/cmake"             CACHE PATH "Cmake context directory, common src")
set(CT_DS_DIR           "${CMAKE_SOURCE_DIR}/data_structure"    CACHE PATH "Data structure directory, hold src/header")
set(CT_ALGO_DIR         "${CMAKE_SOURCE_DIR}/algorithm"         CACHE PATH "Data structure directory, hold src/header")


############### Option Setting ##############
option(SH_SUPPORT_DATA_STRUCTURE    "Use Own Data structure, referencing APIS from shared library"      ON)
option(SH_SUPPORT_ALGORITHM         "Use Own Algorithm, referencing APIS from shared library"           ON)
option(SH_SUPPORT_NEON              "Use NEON for algorithm, will be checked useability of NEON"        OFF) # not implemented
option(SH_SUPPORT_AVX               "Use AVX for algorithm, will be checked useability of AVX, X86"     OFF) # not implemented


############### common cmake context ##############
include(CT_CMAKE_DIR/macro.cmake)


# ENABLE DATA STRUCTURE
if(SH_SUPPORT_DATA_STRUCTURE)
    add_subdirectory(data_structure)
endif(SH_SUPPORT_DATA_STRUCTURE)

# ENABLE ALGORITHM
if(SH_SUPPORT_ALGORITHM)
    add_subdirectory(algorithm)
endif(SH_SUPPORT_ALGORITHM)

