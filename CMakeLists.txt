cmake_minimum_required(VERSION 3.20)
project(BlinkLED_MSP430 C)

# Set toolchain root directory
set(TOOLS_DIR $ENV{TOOLS_PATH})
set(MSPGCC_ROOT_DIR ${TOOLS_DIR}/msp430-gcc)
set(MSPGCC_BIN_DIR ${MSPGCC_ROOT_DIR}/bin)
set(MSPGCC_INCLUDE_DIR ${MSPGCC_ROOT_DIR}/include)

# Set compiler
set(CMAKE_C_COMPILER ${MSPGCC_BIN_DIR}/msp430-elf-gcc)

#Ignore warnings
#add_compile_options(-w)

# Set CPPCHECK
find_program(CPPCHECK cppcheck)

if(CPPCHECK)
	message(STATUS "cppcheck found: ${CPPCHECK}")
else()
	message(WARNING "cppcheck not found")
endif()

# Set clang format
find_program(CLANG_FORMAT clang-format-12)

if(CLANG_FORMAT)
	message(STATUS "clang format found: ${CLANG_FORMAT}")
else()
        message(WARNING "clang format not found")
endif()

# Set the defines
set(HW $ENV{HW})
set(TEST $ENV{TEST})

# Check if we are building one of the custom targets
if (CMAKE_CURRENT_SOURCE_DIR)
    message(STATUS "Current target: ${CMAKE_CURRENT_SOURCE_DIR}")
endif()

if ("${CMAKE_COMMAND}" MATCHES "cppcheck")
    message(STATUS "Running cppcheck...")
endif()

# Check the HW argument
if ("${HW}" STREQUAL "LAUNCHPAD")
	set(TARGET_HW "launchpad")
	add_definitions(-DLAUNCHPAD)
elseif ("${HW}" STREQUAL "SBOT")
	set(TARGET_HW "sbot")
	add_definitions(-DSBOT)
else() 
endif()
 
if (NOT "${TEST}" STREQUAL "")
	if (NOT "${TEST}" MATCHES "^test_.*")
            message(FATAL_ERROR "TEST=${TEST} is invalid (test function must start with test_)")
    else()
	    add_definitions(-DTEST=${TEST})
    endif()
endif()

#set(DEFINES
#    -D${HW}
#    -DTEST=${TEST}    
#	)

# Set the microcontroller and compilation flags
set(MCU msp430g2553)
set(LINKER_SCRIPT_PATH ${TOOLS_DIR}/msp430-gcc/include/msp430g2553.ld) # Update this path

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mmcu=${MCU} -fshort-enums -I${MSPGCC_INCLUDE_DIR} -D${HW} -DTEST=${TEST} -Og -g -Wall -Wextra -Werror -Wshadow")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mmcu=${MCU} -L${MSPGCC_INCLUDE_DIR} -T${LINKER_SCRIPT_PATH} -D${HW} -DTEST=${TEST}")


# Set source directory
set(SOURCE_DIR ${CMAKE_SOURCE_DIR}/src)
            
# Set headers directories
set(HEADER_DIR
    ${MSPGCC_INCLUDE_DIR}
    src/drivers
    ${SOURCE_DIR}/common
    ${SOURCE_DIR}/app
    ${SOURCE_DIR}/test
    )

# Include directories for header files
include_directories(${HEADER_DIR})

# Source Files with headers
set(SOURCES_HEADER
    src/drivers/io.c
    src/drivers/mcu_init.c
    src/drivers/led.c
    src/common/assert_handler.c
    # external/printf/printf.c

   )

if ("${TEST}" STREQUAL "") # Equivalent of ifndef TEST
    set(SOURCES
        src/drivers/io.c
        src/drivers/mcu_init.c
        src/drivers/led.c
        src/common/assert_handler.c
        src/main.c
        ${SOURCES_HEADERS}
    )
else()
    set(SOURCES
        src/drivers/io.c
        src/drivers/mcu_init.c
        src/drivers/led.c
        src/common/assert_handler.c
        src/test/test.c
        ${SOURCES_HEADERS}
    )

    # Define the name of the object file for the test
    set(TEST_OBJECT_FILE "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/blink.dir/src/test/test.c.o")

endif()

# Specify output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Define the executable target
add_executable(blink ${SOURCES})

# Set Debug tool paths
set(TI_CCS_DIR ${TOOLS_DIR}ccs1280/ccs)
set(DEBUG_BIN_DIR ${TI_CCS_DIR}/ccs_base/DebugServer/bin)
set(DEBUG_DRIVERS_DIR ${TI_CCS_DIR}/ccs_base/DebugServer/drivers)
set(DEBUG LD_LIBRARY_PATH=${DEBUG_DRIVERS_DIR} ${DEBUG_BIN_DIR}/mspdebug)

#set(HEADERS
#    ${CMAKE_SOURCE_DIR}/include/main.h
#    ${CMAKE_SOURCE_DIR}/external/printf/printf.h
#)

# This ensures the printf include is treated as a system include
#target_include_directories(blink SYSTEM PUBLIC ${CMAKE_SOURCE_DIR}/external/printf)
set(CPPCHECK_INCLUDES
	
    ./src ./
)

set(FORMAT_FOLDER ${CMAKE_SOURCE_DIR}/src)

file(GLOB_RECURSE FORMAT_FILES
    ${FORMAT_FOLDER}/*.c
    ${FORMAT_FOLDER}/*.h    
	
)

# Add custom target for flashing
add_custom_target(flash
    COMMAND env LD_LIBRARY_PATH=${DEBUG_DRIVERS_DIR}:${DEBUG_BIN_DIR} ${DEBUG} tilib "prog ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/blink" "exit"
    DEPENDS blink
    COMMENT "Flashing the MSP430 device"
)


# Add custom clean command if needed
add_custom_target(distclean
    COMMAND ${CMAKE_COMMAND} -P cmake_clean_target.cmake
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}
    COMMENT "Cleaning up build directories"
)


# Add custom target for cppcheck
#if(CPPCHECK)
	add_custom_target(cppcheck

		COMMAND ${CPPCHECK} --quiet --enable=all --error-exitcode=1
		--inline-suppr
		--suppress=missingIncludeSystem
		--suppress=unmatchedSuppression
		--suppress=unusedFunction
		--suppress=unusedVariable
		--suppress=missingInclude
		-i${CMAKE_SOURCE_DIR}/external/printf
		-i${CMAKE_SOURCE_DIR}/CMakeFiles
		-i${CMAKE_SOURCE_DIR}/CMakeFiles/3.22.1/CompilerIdC
		-I${CPPCHECK_INCLUDES}
		COMMENT "Running cppcheck"

	)
#endif()

# Add custom target for clang format

add_custom_target(format

	COMMAND ${CLANG_FORMAT}
	-i ${FORMAT_FILES}
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
	COMMENT "Formatting files"
	
)

