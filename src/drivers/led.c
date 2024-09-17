#include "led.h"
#include "defines.h"
#include "assert_handler.h"
#include <stdbool.h>

static bool initialized = false;
void led_init(void)
{
    ASSERT(!initialized);
    //TODO: Assert !initialized
    //TODO: Assert current configuration
    initialized = true;
}

void led_set(led_e led, led_state_e state)
{
    ASSERT(initialized);
    UNUSED(led);
    UNUSED(state);
    //TODO: Assert inintialized
    //TODO: Toggle GPIO
}
