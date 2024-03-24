# Find all subdirectories within the project directory
file(GLOB SUBDIRECTORIES LIST_DIRECTORIES true ${CMAKE_CURRENT_SOURCE_DIR}/*)

# Iterate over the list of subdirectories
foreach(subdir ${SUBDIRECTORIES})
    if(IS_DIRECTORY ${subdir})
        add_subdirectory(${subdir})
    endif()
endforeach()