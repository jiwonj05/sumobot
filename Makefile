# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

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
CMAKE_SOURCE_DIR = ./ 

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = ./

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start $(CMAKE_SOURCE_DIR)/CMakeFiles $(CMAKE_SOURCE_DIR)//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start $(CMAKE_SOURCE_DIR)/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named blink

# Build rule for target.
blink: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 blink
.PHONY : blink

# fast build rule for target.
blink/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/build
.PHONY : blink/fast

#=============================================================================
# Target rules for targets named flash

# Build rule for target.
flash: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 flash
.PHONY : flash

# fast build rule for target.
flash/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/flash.dir/build.make CMakeFiles/flash.dir/build
.PHONY : flash/fast

#=============================================================================
# Target rules for targets named distclean

# Build rule for target.
distclean: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 distclean
.PHONY : distclean

# fast build rule for target.
distclean/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/distclean.dir/build.make CMakeFiles/distclean.dir/build
.PHONY : distclean/fast

#=============================================================================
# Target rules for targets named cppcheck

# Build rule for target.
cppcheck: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 cppcheck
.PHONY : cppcheck

# fast build rule for target.
cppcheck/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cppcheck.dir/build.make CMakeFiles/cppcheck.dir/build
.PHONY : cppcheck/fast

#=============================================================================
# Target rules for targets named format

# Build rule for target.
format: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 format
.PHONY : format

# fast build rule for target.
format/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/format.dir/build.make CMakeFiles/format.dir/build
.PHONY : format/fast

src/common/assert_handler.o: src/common/assert_handler.c.o
.PHONY : src/common/assert_handler.o

# target to build an object file
src/common/assert_handler.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/common/assert_handler.c.o
.PHONY : src/common/assert_handler.c.o

src/common/assert_handler.i: src/common/assert_handler.c.i
.PHONY : src/common/assert_handler.i

# target to preprocess a source file
src/common/assert_handler.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/common/assert_handler.c.i
.PHONY : src/common/assert_handler.c.i

src/common/assert_handler.s: src/common/assert_handler.c.s
.PHONY : src/common/assert_handler.s

# target to generate assembly for a file
src/common/assert_handler.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/common/assert_handler.c.s
.PHONY : src/common/assert_handler.c.s

src/drivers/io.o: src/drivers/io.c.o
.PHONY : src/drivers/io.o

# target to build an object file
src/drivers/io.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/io.c.o
.PHONY : src/drivers/io.c.o

src/drivers/io.i: src/drivers/io.c.i
.PHONY : src/drivers/io.i

# target to preprocess a source file
src/drivers/io.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/io.c.i
.PHONY : src/drivers/io.c.i

src/drivers/io.s: src/drivers/io.c.s
.PHONY : src/drivers/io.s

# target to generate assembly for a file
src/drivers/io.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/io.c.s
.PHONY : src/drivers/io.c.s

src/drivers/led.o: src/drivers/led.c.o
.PHONY : src/drivers/led.o

# target to build an object file
src/drivers/led.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/led.c.o
.PHONY : src/drivers/led.c.o

src/drivers/led.i: src/drivers/led.c.i
.PHONY : src/drivers/led.i

# target to preprocess a source file
src/drivers/led.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/led.c.i
.PHONY : src/drivers/led.c.i

src/drivers/led.s: src/drivers/led.c.s
.PHONY : src/drivers/led.s

# target to generate assembly for a file
src/drivers/led.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/led.c.s
.PHONY : src/drivers/led.c.s

src/drivers/mcu_init.o: src/drivers/mcu_init.c.o
.PHONY : src/drivers/mcu_init.o

# target to build an object file
src/drivers/mcu_init.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/mcu_init.c.o
.PHONY : src/drivers/mcu_init.c.o

src/drivers/mcu_init.i: src/drivers/mcu_init.c.i
.PHONY : src/drivers/mcu_init.i

# target to preprocess a source file
src/drivers/mcu_init.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/mcu_init.c.i
.PHONY : src/drivers/mcu_init.c.i

src/drivers/mcu_init.s: src/drivers/mcu_init.c.s
.PHONY : src/drivers/mcu_init.s

# target to generate assembly for a file
src/drivers/mcu_init.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/drivers/mcu_init.c.s
.PHONY : src/drivers/mcu_init.c.s

src/main.o: src/main.c.o
.PHONY : src/main.o

# target to build an object file
src/main.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/main.c.o
.PHONY : src/main.c.o

src/main.i: src/main.c.i
.PHONY : src/main.i

# target to preprocess a source file
src/main.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/main.c.i
.PHONY : src/main.c.i

src/main.s: src/main.c.s
.PHONY : src/main.s

# target to generate assembly for a file
src/main.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/blink.dir/build.make CMakeFiles/blink.dir/src/main.c.s
.PHONY : src/main.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... cppcheck"
	@echo "... distclean"
	@echo "... flash"
	@echo "... format"
	@echo "... blink"
	@echo "... src/common/assert_handler.o"
	@echo "... src/common/assert_handler.i"
	@echo "... src/common/assert_handler.s"
	@echo "... src/drivers/io.o"
	@echo "... src/drivers/io.i"
	@echo "... src/drivers/io.s"
	@echo "... src/drivers/led.o"
	@echo "... src/drivers/led.i"
	@echo "... src/drivers/led.s"
	@echo "... src/drivers/mcu_init.o"
	@echo "... src/drivers/mcu_init.i"
	@echo "... src/drivers/mcu_init.s"
	@echo "... src/main.o"
	@echo "... src/main.i"
	@echo "... src/main.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

