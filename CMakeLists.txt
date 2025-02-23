cmake_minimum_required(VERSION 3.20)
project(BlinkLED_MSP430 C)

# Set toolchain root directory
set(TOOLS_DIR $ENV{TOOLS_PATH})
set(MSPGCC_ROOT_DIR ${TOOLS_DIR}/msp430-gcc)
set(MSPGCC_BIN_DIR ${MSPGCC_ROOT_DIR}/bin)
set(MSPGCC_INCLUDE_DIR ${MSPGCC_ROOT_DIR}/include)

# Set compiler
set(CMAKE_C_COMPILER ${MSPGCC_BIN_DIR}/msp430-elf-gcc)

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

# Set MSP430 Size Program
find_program(SIZE msp430-elf-size HINTS ${MSPGCC_BIN_DIR})


if(SIZE)
	message(STATUS "Size Program found: ${SIZE}")
else()
	message(WARNING "Size Program not found")
endif()

# Set MSP430 Size Program #2
find_program(READELF msp430-elf-readelf HINTS ${MSPGCC_BIN_DIR})

if(READELF)
	message(STATUS "READELF Program found: ${READELF}")
else()
	message(WARNING "READELF Program not found")
endif()

# Set MSP430 ADDR2LINE program
find_program(ADDR2LINE msp430-elf-addr2line HINTS ${MSPGCC_BIN_DIR})

if(ADDR2LINE)
	message(STATUS "ADDR2LINE Program found: ${ADDR2LINE}")
else()
	message(WARNING "ADDR2LINE Program not found")
endif()

# Create the output directory for the executable
file(MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/bin/${TARGET_HW}")

# Set the defines
set(HW $ENV{HW})
set(TEST $ENV{TEST})
set(ADDR $ENV{ADDR})

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
	message(WARNING "HW argument not called") 
endif()

set(TARGET_NAME ${TARGET_HW})

if (NOT "${TEST}" STREQUAL "")
	if (NOT "${TEST}" MATCHES "^test_.*")
            message(FATAL_ERROR "TEST=${TEST} is invalid (test function must start with test_)")
    else()
	    add_definitions(-DTEST=${TEST})
	    set(TARGET_NAME ${TEST})
    endif()
endif()

set(MCU msp430g2553)
set(LINKER_SCRIPT_PATH ${TOOLS_DIR}/msp430-gcc/include/msp430g2553.ld) # Update this path

set(INCLUDE_DIRS
    ${MSPGCC_INCLUDE_DIR}
    ${CMAKE_SOURCE_DIR}/external     
    ${CMAKE_SOURCE_DIR}/external/printf
)

set(DEFINES
    ${HW}
    PRINTF_INCLUDE_CONFIG_H
    TEST=${TEST}
)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mmcu=${MCU} -fshort-enums -Og -g -Wall -Wextra -Werror -Wshadow -Os")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mmcu=${MCU} -L${MSPGCC_INCLUDE_DIR} -T${LINKER_SCRIPT_PATH} --data-sections")


# Set source directory
set(SOURCE_DIR ${CMAKE_SOURCE_DIR}/src)
            
# Set headers directories
set(HEADER_DIR
    ${MSPGCC_INCLUDE_DIR}
    src/drivers
    ${SOURCE_DIR}/common
    ${SOURCE_DIR}/app
    ${SOURCE_DIR}/test
    ${SOURCE_DIR}/external/printf
    ${SOURCE_DIR}/external
    )

# Include directories for header files
include_directories(${HEADER_DIR})

# Source Files with headers
set(SOURCES_HEADER
    src/drivers/io.c
    src/drivers/mcu_init.c
    src/drivers/led.c
    src/common/assert_handler.c
    external/printf/printf.c

   )

if ("${TEST}" STREQUAL "") # Equivalent of ifndef TEST
    set(SOURCES
        src/drivers/io.c
        src/drivers/mcu_init.c
        src/drivers/led.c
	src/drivers/uart.c
        src/common/assert_handler.c
	src/common/ring_buffer.c
	src/common/trace.c
	external/printf/printf.c
        src/main.c
    )
else()
    set(SOURCES
        src/drivers/io.c
        src/drivers/mcu_init.c
        src/drivers/led.c
	src/drivers/uart.c
        src/common/assert_handler.c
	src/common/ring_buffer.c
	src/common/trace.c
        external/printf/printf.c
	src/test/test.c
        
    )

    # Define the name of the object file for the test
    set(TEST_OBJECT_FILE "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/blink.dir/src/test/test.c.o")

endif()

# Specify output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/${TARGET_HW})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Define the executable target
add_executable(${TARGET_NAME} ${SOURCES})

target_include_directories(${TARGET_NAME} PRIVATE ${INCLUDE_DIRS})

#target_compile_definitions(${TARGET_NAME} PRIVATE PRINTF_INCLUDE_CONFIG_H)
target_compile_definitions(${TARGET_NAME} PRIVATE ${DEFINES})


# Set Debug tool paths
set(TI_CCS_DIR ${TOOLS_DIR}ccs1280/ccs)
set(DEBUG_BIN_DIR ${TI_CCS_DIR}/ccs_base/DebugServer/bin)
set(DEBUG_DRIVERS_DIR ${TI_CCS_DIR}/ccs_base/DebugServer/drivers)
set(DEBUG LD_LIBRARY_PATH=${DEBUG_DRIVERS_DIR} ${DEBUG_BIN_DIR}/mspdebug)

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
	COMMAND env LD_LIBRARY_PATH=${DEBUG_DRIVERS_DIR}:${DEBUG_BIN_DIR} ${DEBUG} tilib "prog ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TARGET_NAME}" "exit"
	DEPENDS ${TARGET_NAME}
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
		--suppress=unknownMacro
		-i${CMAKE_SOURCE_DIR}/external/printf
		-i${CMAKE_SOURCE_DIR}/CMakeFiles
		-i${CMAKE_SOURCE_DIR}/CMakeFiles/3.22.1/CompilerIdC
		-I${CPPCHECK_INCLUDES}
		DEPENDS ${SOURCES}
		COMMENT "Running cppcheck"

	)
#endif()

# Add custom target for checking flash size

add_custom_target(size
	COMMAND env LD_LIBRARY_PATH=${DEBUG_DRIVERS_DIR}:${DEBUG_BIN_DIR} ${SIZE} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TARGET_NAME}
	DEPENDS ${TARGET_NAME}
    COMMENT "Checking flash size"
    VERBATIM
)


# Add a custom target to call addr2line
add_custom_target(addr2line
	COMMAND ${ADDR2LINE} -e ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TARGET_NAME} ${ADDR}
	DEPENDS ${TARGET_NAME}
	COMMENT "Running addr2line on ${TARGET_NAME} with address ${ADDR}"
)

# Define the custom target for listing symbols
add_custom_target(symbols
    COMMAND ${CMAKE_COMMAND} -E echo "Listing symbols for ${TARGET_NAME}"
    COMMAND ${CMAKE_COMMAND} -E env LD_LIBRARY_PATH=${DEBUG_DRIVERS_DIR}:${DEBUG_BIN_DIR} ${READELF} -s ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TARGET_NAME} | sort -n -k3
    DEPENDS ${TARGET_NAME}
    COMMENT "Generating sorted symbol list for ${TARGET_NAME}"
    VERBATIM
)

# Add custom target for clang format

add_custom_target(format

	COMMAND ${CLANG_FORMAT}
	-i ${FORMAT_FILES}
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
	COMMENT "Formatting files"
	
)

