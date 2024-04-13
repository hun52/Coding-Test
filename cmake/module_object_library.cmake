# ----------------------------------------------------------------------------
# Directories
# ----------------------------------------------------------------------------
set(CT_MODULE_NAME              "")
set(CT_MODULE_DIR               "${CMAKE_CURRENT_SOURCE_DIR}")
set(CT_MODULE_INCLUDE_DIR       "${CT_MODULE_DIR}/interface")
set(CT_MODULE_SOURCE_DIR        "${CT_MODULE_DIR}/src")

# ----------------------------------------------------------------------------
# Find Module Naming from directory
# ----------------------------------------------------------------------------
get_filename_component(CT_MODULE_NAME ${CT_MODULE_DIR} NAME_WE)
message(" |-[ADD TARGET]  : ${CT_TARGET_NAME} <- ${CT_MODULE_NAME}") 

# ----------------------------------------------------------------------------
# Configure build flags
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Apply dependency
# ----------------------------------------------------------------------------
include("component_dependencies.cmake" OPTIONAL)
### CHECK DEPENDENCY !! -> TO DO

# ----------------------------------------------------------------------------
# Find source files
# ----------------------------------------------------------------------------
file(GLOB CT_MODULE_INCLUDE_FILES "${CT_MODULE_INCLUDE_DIR}/*")
file(GLOB CT_MODULE_SOURCE_FILES  "${CT_MODULE_SOURCE_DIR}/*")

add_library(${CT_MODULE_NAME} OBJECT
    ${CT_MODULE_SOURCE_FILES}
    ${CT_MODULE_INCLUDE_FILES}
)

target_include_directories(${CT_MODULE_NAME} PRIVATE ${CT_MODULE_INCLUDE_DIR} ${CT_MODULE_SOURCE_DIR})

set_property(TARGET ${CT_MODULE_NAME} PROPERTY FOLDER "${CT_TARGET_NAME}")

source_group("Module Include Files"     FILES       ${CT_MODULE_INCLUDE_FILES})
source_group("Module Source Files"      FILES       ${CT_MODULE_SOURCE_FILES})

set_property(TARGET ${CT_MODULE_NAME} PROPERTY PUBLIC_HEADER
    ${CT_MODULE_INCLUDE_DIR}
)

set(MODULE_${CT_MODULE_NAME}_INCLUDE_DIRS ${CT_MODULE_INCLUDE_DIR}  CACHE STRING "The interface directories of this module")
set(MODULE_${CT_MODULE_NAME}_CORE_LIBRARY ${CT_MODULE_NAME}         CACHE STRING "The target module object library")

list(APPEND ${CT_TARGET_NAME}_OBJ_LIST      $<TARGET_OBJECTS:${MODULE_${CT_MODULE_NAME}_CORE_LIBRARY}>)
list(APPEND ${CT_TARGET_NAME}_OBJ__INC_LIST MODULE_${CT_MODULE_NAME}_INCLUDE_DIRS)
