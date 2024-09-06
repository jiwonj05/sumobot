cmake_minimum_required(VERSION 3.10)
project(BlinkLED_MSP430 C)

# Set tools directory
set(TOOLS_DIR ${TOOLS_PATH})


# Set toolchain root directory
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



# Set the microcontroller and compilation flags
set(MCU msp430g2553)
set(LINKER_SCRIPT_PATH ${TOOLS_DIR}/msp430-gcc/include/msp430g2553.ld) # Update this path

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mmcu=${MCU} -I${MSPGCC_INCLUDE_DIR} -Og -g -Wall -Wextra -Werror -Wshadow")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mmcu=${MCU} -L${MSPGCC_INCLUDE_DIR} -T${LINKER_SCRIPT_PATH} ")

# Include directories
include_directories(${MSPGCC_INCLUDE_DIR})

# Add source files
set(SOURCES
    src/main.c
    
)

# Specify output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Define the executable target
add_executable(blink ${SOURCES})

# Set Debug tool paths
set(TI_CCS_DIR ${TOOLS_DIR}/ccs1280/ccs)
set(DEBUG_BIN_DIR ${TI_CCS_DIR}/ccs_base/DebugServer/bin)
set(DEBUG_DRIVERS_DIR ${TI_CCS_DIR}/ccs_base/DebugServer/drivers)
set(DEBUG LD_LIBRARY_PATH=${DEBUG_DRIVERS_DIR} ${DEBUG_BIN_DIR}/mspdebug)

# Add custom target for flashing
add_custom_target(flash
    COMMAND env LD_LIBRARY_PATH=${DEBUG_DRIVERS_DIR}:${DEBUG_BIN_DIR} ${DEBUG} tilib "prog ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/blink"
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
if(CPPCHECK)
	add_custom_target(cppcheck

		COMMAND ${CPPCHECK} --quiet --enable=all --error-exitcode=1
		--inline-suppr 
		-I${MSPGCC_INCLUDE_DIR}
		${SOURCES}
		COMMENT "Running cppcheck"

	)
endif()



