# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jiwon/sumobot

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jiwon/sumobot

# Include any dependencies generated for this target.
include CMakeFiles/test_uart.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test_uart.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test_uart.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_uart.dir/flags.make

CMakeFiles/test_uart.dir/src/drivers/io.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/src/drivers/io.c.o: src/drivers/io.c
CMakeFiles/test_uart.dir/src/drivers/io.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/test_uart.dir/src/drivers/io.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/src/drivers/io.c.o -MF CMakeFiles/test_uart.dir/src/drivers/io.c.o.d -o CMakeFiles/test_uart.dir/src/drivers/io.c.o -c /home/jiwon/sumobot/src/drivers/io.c

CMakeFiles/test_uart.dir/src/drivers/io.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/src/drivers/io.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/src/drivers/io.c > CMakeFiles/test_uart.dir/src/drivers/io.c.i

CMakeFiles/test_uart.dir/src/drivers/io.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/src/drivers/io.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/src/drivers/io.c -o CMakeFiles/test_uart.dir/src/drivers/io.c.s

CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o: src/drivers/mcu_init.c
CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o -MF CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o.d -o CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o -c /home/jiwon/sumobot/src/drivers/mcu_init.c

CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/src/drivers/mcu_init.c > CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.i

CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/src/drivers/mcu_init.c -o CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.s

CMakeFiles/test_uart.dir/src/drivers/led.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/src/drivers/led.c.o: src/drivers/led.c
CMakeFiles/test_uart.dir/src/drivers/led.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/test_uart.dir/src/drivers/led.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/src/drivers/led.c.o -MF CMakeFiles/test_uart.dir/src/drivers/led.c.o.d -o CMakeFiles/test_uart.dir/src/drivers/led.c.o -c /home/jiwon/sumobot/src/drivers/led.c

CMakeFiles/test_uart.dir/src/drivers/led.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/src/drivers/led.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/src/drivers/led.c > CMakeFiles/test_uart.dir/src/drivers/led.c.i

CMakeFiles/test_uart.dir/src/drivers/led.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/src/drivers/led.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/src/drivers/led.c -o CMakeFiles/test_uart.dir/src/drivers/led.c.s

CMakeFiles/test_uart.dir/src/drivers/uart.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/src/drivers/uart.c.o: src/drivers/uart.c
CMakeFiles/test_uart.dir/src/drivers/uart.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/test_uart.dir/src/drivers/uart.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/src/drivers/uart.c.o -MF CMakeFiles/test_uart.dir/src/drivers/uart.c.o.d -o CMakeFiles/test_uart.dir/src/drivers/uart.c.o -c /home/jiwon/sumobot/src/drivers/uart.c

CMakeFiles/test_uart.dir/src/drivers/uart.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/src/drivers/uart.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/src/drivers/uart.c > CMakeFiles/test_uart.dir/src/drivers/uart.c.i

CMakeFiles/test_uart.dir/src/drivers/uart.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/src/drivers/uart.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/src/drivers/uart.c -o CMakeFiles/test_uart.dir/src/drivers/uart.c.s

CMakeFiles/test_uart.dir/src/common/assert_handler.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/src/common/assert_handler.c.o: src/common/assert_handler.c
CMakeFiles/test_uart.dir/src/common/assert_handler.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/test_uart.dir/src/common/assert_handler.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/src/common/assert_handler.c.o -MF CMakeFiles/test_uart.dir/src/common/assert_handler.c.o.d -o CMakeFiles/test_uart.dir/src/common/assert_handler.c.o -c /home/jiwon/sumobot/src/common/assert_handler.c

CMakeFiles/test_uart.dir/src/common/assert_handler.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/src/common/assert_handler.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/src/common/assert_handler.c > CMakeFiles/test_uart.dir/src/common/assert_handler.c.i

CMakeFiles/test_uart.dir/src/common/assert_handler.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/src/common/assert_handler.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/src/common/assert_handler.c -o CMakeFiles/test_uart.dir/src/common/assert_handler.c.s

CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o: src/common/ring_buffer.c
CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o -MF CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o.d -o CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o -c /home/jiwon/sumobot/src/common/ring_buffer.c

CMakeFiles/test_uart.dir/src/common/ring_buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/src/common/ring_buffer.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/src/common/ring_buffer.c > CMakeFiles/test_uart.dir/src/common/ring_buffer.c.i

CMakeFiles/test_uart.dir/src/common/ring_buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/src/common/ring_buffer.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/src/common/ring_buffer.c -o CMakeFiles/test_uart.dir/src/common/ring_buffer.c.s

CMakeFiles/test_uart.dir/src/common/trace.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/src/common/trace.c.o: src/common/trace.c
CMakeFiles/test_uart.dir/src/common/trace.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/test_uart.dir/src/common/trace.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/src/common/trace.c.o -MF CMakeFiles/test_uart.dir/src/common/trace.c.o.d -o CMakeFiles/test_uart.dir/src/common/trace.c.o -c /home/jiwon/sumobot/src/common/trace.c

CMakeFiles/test_uart.dir/src/common/trace.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/src/common/trace.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/src/common/trace.c > CMakeFiles/test_uart.dir/src/common/trace.c.i

CMakeFiles/test_uart.dir/src/common/trace.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/src/common/trace.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/src/common/trace.c -o CMakeFiles/test_uart.dir/src/common/trace.c.s

CMakeFiles/test_uart.dir/external/printf/printf.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/external/printf/printf.c.o: external/printf/printf.c
CMakeFiles/test_uart.dir/external/printf/printf.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/test_uart.dir/external/printf/printf.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/external/printf/printf.c.o -MF CMakeFiles/test_uart.dir/external/printf/printf.c.o.d -o CMakeFiles/test_uart.dir/external/printf/printf.c.o -c /home/jiwon/sumobot/external/printf/printf.c

CMakeFiles/test_uart.dir/external/printf/printf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/external/printf/printf.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/external/printf/printf.c > CMakeFiles/test_uart.dir/external/printf/printf.c.i

CMakeFiles/test_uart.dir/external/printf/printf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/external/printf/printf.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/external/printf/printf.c -o CMakeFiles/test_uart.dir/external/printf/printf.c.s

CMakeFiles/test_uart.dir/src/test/test.c.o: CMakeFiles/test_uart.dir/flags.make
CMakeFiles/test_uart.dir/src/test/test.c.o: src/test/test.c
CMakeFiles/test_uart.dir/src/test/test.c.o: CMakeFiles/test_uart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/test_uart.dir/src/test/test.c.o"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test_uart.dir/src/test/test.c.o -MF CMakeFiles/test_uart.dir/src/test/test.c.o.d -o CMakeFiles/test_uart.dir/src/test/test.c.o -c /home/jiwon/sumobot/src/test/test.c

CMakeFiles/test_uart.dir/src/test/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_uart.dir/src/test/test.c.i"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jiwon/sumobot/src/test/test.c > CMakeFiles/test_uart.dir/src/test/test.c.i

CMakeFiles/test_uart.dir/src/test/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_uart.dir/src/test/test.c.s"
	/home/jiwon/dev/tools//msp430-gcc/bin/msp430-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jiwon/sumobot/src/test/test.c -o CMakeFiles/test_uart.dir/src/test/test.c.s

# Object files for target test_uart
test_uart_OBJECTS = \
"CMakeFiles/test_uart.dir/src/drivers/io.c.o" \
"CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o" \
"CMakeFiles/test_uart.dir/src/drivers/led.c.o" \
"CMakeFiles/test_uart.dir/src/drivers/uart.c.o" \
"CMakeFiles/test_uart.dir/src/common/assert_handler.c.o" \
"CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o" \
"CMakeFiles/test_uart.dir/src/common/trace.c.o" \
"CMakeFiles/test_uart.dir/external/printf/printf.c.o" \
"CMakeFiles/test_uart.dir/src/test/test.c.o"

# External object files for target test_uart
test_uart_EXTERNAL_OBJECTS =

bin/launchpad/test_uart: CMakeFiles/test_uart.dir/src/drivers/io.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/src/drivers/mcu_init.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/src/drivers/led.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/src/drivers/uart.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/src/common/assert_handler.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/src/common/ring_buffer.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/src/common/trace.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/external/printf/printf.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/src/test/test.c.o
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/build.make
bin/launchpad/test_uart: CMakeFiles/test_uart.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jiwon/sumobot/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking C executable bin/launchpad/test_uart"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_uart.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_uart.dir/build: bin/launchpad/test_uart
.PHONY : CMakeFiles/test_uart.dir/build

CMakeFiles/test_uart.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_uart.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_uart.dir/clean

CMakeFiles/test_uart.dir/depend:
	cd /home/jiwon/sumobot && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jiwon/sumobot /home/jiwon/sumobot /home/jiwon/sumobot /home/jiwon/sumobot /home/jiwon/sumobot/CMakeFiles/test_uart.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_uart.dir/depend

