#include "assert_handler.h"

#define BREAKPOINT __asm volatile("CLR.B R3");

void assert_handler(void)
{
    // TODO: Turn off motors ("safe state")
    // TODO: Trace to console
    BREAKPOINT
    // TODO: Blink LED indefinetly
    while (1) { };
}
