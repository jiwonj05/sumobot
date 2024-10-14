#ifndef DISABLE_TRACE
#include "trace.h"
#include "assert_handler.h"
#include "uart.h"
#include "printf.h"
#include <stdbool.h>

static bool initialized = false;
void trace_init(void)
{
    ASSERT(!initialized);
    uart_init();
    initialized = true;
}

void trace(const char *format, ...)
{
    ASSERT(initialized);
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}

#endif // DIABLE_TRACE
