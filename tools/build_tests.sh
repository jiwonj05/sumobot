#!/bin/bash
# This script is used by CI to build all test functions

SCRIPT_DIR=$(dirname "$0")
TEST_FUNCTIONS=$(cat src/test/test.c | grep -P '(?<=void )test_.+(?=\()' -o)
for test_function in $TEST_FUNCTIONS
do
    make HW=LAUNCHPAD TEST=$test_function
    make HW=SBOT TEST=$test_function
    cd /home/jiwon/sumobot
    ./cleanup.sh
done
