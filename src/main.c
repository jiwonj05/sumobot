#include <msp430.h>
#include "io.h"
#include "mcu_init.h"
#include "assert_handler.h"

static void test_setup(void)
{
    mcu_init();
}

// TODO: Move to test file
static void test_assert(void)
{
    test_setup();
    ASSERT(0);
}

static void test_blink_led(void)
{
    const struct io_config led_config = { .dir = IO_DIR_OUTPUT,
                                          .select = IO_SELECT_GPIO,
                                          .resistor = IO_RESISTOR_DISABLED,
                                          .out = IO_OUT_LOW };
    io_configure(IO_TEST_LED, &led_config);
    io_out_e out = IO_OUT_LOW;

    while (1) {
        out = (out == IO_OUT_LOW) ? IO_OUT_HIGH : IO_OUT_LOW;
        io_set_out(IO_TEST_LED, out);
        __delay_cycles(250000);
    }
}

/*static void test_launchpad_io_pins_output(void)
{
   test_setup();
   const struct io_config output_config = { .select = IO_SELECT_GPIO,
                                            .resistor = IO_RESISTOR_DISABLED,
                                            .dir = IO_DIR_OUTPUT,
                                            .out = IO_OUT_LOW };
}

*/

int main(void)
{
    test_assert();
    // WDTCTL = WDTPW + WDTHOLD;
    // test_blink_led();
    return 0;
}
