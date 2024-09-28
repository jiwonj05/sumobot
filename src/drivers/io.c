#include "io.h"
#include "defines.h"
#include "assert_handler.h"

#include <msp430.h>
#include <stdint.h>
#include <assert.h>

#if defined(LAUNCHPAD)
#define IO_PORT_CNT (2u)
#elif defined(SBOT)
#define IO_PORT_CNT (3u)
#endif
#define IO_PIN_CNT_PER_PORT (8u)

/* Enums are represented as 16-bit by default on MSP43. The enum value can be viewed as:
 * [ Zeros (11 bits) | Port (2 bits) | pin (3 bits)] */
static_assert(sizeof(io_generic_e) == 1, "Unexpected size, -fshort-enums missing?");
#define IO_PORT_OFFSET (3u) // this represents the position of where the port bits are located
#define IO_PORT_MASK (0x3u << IO_PORT_OFFSET)
#define IO_PIN_MASK (0x7u)

static uint8_t io_port(io_e io)
{
    return (io & IO_PORT_MASK) >> IO_PORT_OFFSET;
}

static inline uint8_t io_pin_idx(io_e io)
{
    return io & IO_PIN_MASK;
}

static uint8_t io_pin_bit(io_e io)
{
    return 1 << io_pin_idx(io);
}

#if defined(LAUNCHPAD)
static volatile uint8_t *const port_dir_regs[IO_PORT_CNT] = { &P1DIR, &P2DIR };
static volatile uint8_t *const port_ren_regs[IO_PORT_CNT] = { &P1REN, &P2REN };
static volatile uint8_t *const port_out_regs[IO_PORT_CNT] = { &P1OUT, &P2OUT };
static volatile uint8_t *const port_in_regs[IO_PORT_CNT] = { &P1IN, &P2IN };
static volatile uint8_t *const port_sel1_regs[IO_PORT_CNT] = { &P1SEL, &P2SEL };
static volatile uint8_t *const port_sel2_regs[IO_PORT_CNT] = { &P1SEL2, &P2SEL2 };
#elif defined(SBOT)
static volatile uint8_t *const port_dir_regs[IO_PORT_CNT] = { &P1DIR, &P2DIR, &P3DIR };
static volatile uint8_t *const port_ren_regs[IO_PORT_CNT] = { &P1REN, &P2REN, &P3REN };
static volatile uint8_t *const port_out_regs[IO_PORT_CNT] = { &P1OUT, &P2OUT, &P3OUT };
static volatile uint8_t *const port_in_regs[IO_PORT_CNT] = { &P1IN, &P2IN, &P3IN };
static volatile uint8_t *const port_sel1_regs[IO_PORT_CNT] = { &P1SEL, &P2SEL, &P3SEL };
static volatile uint8_t *const port_sel2_regs[IO_PORT_CNT] = { &P1SEL2, &P2SEL2, &P3SEL2 };
#endif

#define UNUSED_CONFIG                                                                              \
    {                                                                                              \
        IO_SELECT_GPIO, IO_RESISTOR_ENABLED, IO_DIR_OUTPUT, IO_OUT_LOW                             \
    }

// This array holds the initial configuration for all IO pins

static const struct io_config io_initial_configs[IO_PORT_CNT * IO_PIN_CNT_PER_PORT] = {
    // Output
    [IO_TEST_LED] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },

    /* UART RX/TX
     * Resistor: Not needed (pulled by transmitter/reciever
     * Direction : Not applicable (overriden) does not matter
     * Output: Not applicable */
    [IO_UART_RXD] = { IO_SELECT_ALT3, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_UART_TXD] = { IO_SELECT_ALT3, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },

#if defined(LAUNCHPAD)
    // Unused pins
    [IO_UNUSED_2] = UNUSED_CONFIG,
    [IO_UNUSED_3] = UNUSED_CONFIG,
    [IO_UNUSED_11] = UNUSED_CONFIG,
    [IO_UNUSED_13] = UNUSED_CONFIG,
#elif defined(SBOT)
    // Input (no resistor required according to datasheet)
    [IO_IR_REMOTE] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_INPUT, IO_OUT_LOW },

    /* I2C clock/data
     * Resistor: Disabled (there are extrenal pull-up resistors)
     * Direction: Not applicable
     * Output: Not applicable */
    [IO_I2C_SCL] = { IO_SELECT_ALT3, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_I2C_SDA] = { IO_SELECT_ALT3, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },

    // Output
    [IO_MOTORS_LEFT_CC_1] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_MOTORS_LEFT_CC_2] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_MOTORS_RIGHT_CC_1] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_MOTORS_RIGHT_CC_2] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },

    // Output driven by A0, direction must be set to output
    [IO_PWM_MOTORS_LEFT] = { IO_SELECT_ALT1, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_PWM_MOTORS_RIGHT] = { IO_SELECT_ALT1, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },

    /* Input
     * Range sensor provides open-driven output and should be connected to an external pull-up
     * resistor but internal pull-up is fine instead */
    [IO_RANGE_SENSOR_FRONT_INT] = { IO_SELECT_GPIO, IO_RESISTOR_ENABLED, IO_DIR_INPUT,
                                    IO_OUT_HIGH },

    // Outputs
    [IO_XSHUT_FRONT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_XSHUT_FRONT_LEFT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_XSHUT_RIGHT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_XSHUT_LEFT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },
    [IO_XSHUT_FRONT_RIGHT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_OUTPUT, IO_OUT_LOW },

    // Overriden by ADC, so just default it to floating input here
    [IO_LINE_DETECT_FRONT_RIGHT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_INPUT,
                                     IO_OUT_LOW },
    [IO_LINE_DETECT_FRONT_LEFT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_INPUT,
                                    IO_OUT_LOW },
    [IO_LINE_DETECT_BACK_RIGHT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_INPUT,
                                    IO_OUT_LOW },
    [IO_LINE_DETECT_BACK_LEFT] = { IO_SELECT_GPIO, IO_RESISTOR_DISABLED, IO_DIR_INPUT, IO_OUT_LOW },
#endif
};

void io_init(void)
{
    for (io_e io = (io_e)IO_10; io < ARRAY_SIZE(io_initial_configs); io++) {
        io_configure(io, &io_initial_configs[io]);
    }
}

void io_configure(io_e io, const struct io_config *config)
{
    io_set_select(io, config->select);
    io_set_direction(io, config->dir);
    io_set_out(io, config->out);
    io_set_resistor(io, config->resistor);
}

void io_get_current_config(io_e io, struct io_config *current_config)
{
    const uint8_t port = io_port(io);
    const uint8_t pin = io_pin_bit(io);
    const uint8_t sel1 = *port_sel1_regs[port] & pin;
    const uint8_t sel2 = *port_sel2_regs[port] & pin;
    current_config->select = (io_select_e)((sel2 << 1) | sel1);
    current_config->resistor = (io_resistor_e)(*port_ren_regs[port] & pin);
    current_config->dir = (io_dir_e)(*port_dir_regs[port] & pin);
    current_config->out = (io_out_e)(*port_out_regs[port] & pin);
}

bool io_config_compare(const struct io_config *cfg1, const struct io_config *cfg2)
{
    return (cfg1->dir == cfg2->dir) && (cfg1->out == cfg2->out)
        && (cfg1->resistor == cfg2->resistor) && (cfg1->select == cfg2->select);
}

void io_set_select(io_e io, io_select_e select)
{
    const uint8_t port = io_port(io);
    const uint8_t pin = io_pin_bit(io);
    switch (select) {
    case IO_SELECT_GPIO:
        *port_sel1_regs[port] &= ~pin;
        *port_sel2_regs[port] &= ~pin;
        break;
    case IO_SELECT_ALT1:
        *port_sel1_regs[port] |= pin;
        *port_sel2_regs[port] &= ~pin;
        break;
    case IO_SELECT_ALT2:
        *port_sel1_regs[port] &= ~pin;
        *port_sel2_regs[port] |= pin;
        break;
    case IO_SELECT_ALT3:
        *port_sel1_regs[port] |= pin;
        *port_sel2_regs[port] |= pin;
        break;
    }
}

void io_set_direction(io_e io, io_dir_e direction)
{
    const uint8_t port = io_port(io);
    const uint8_t pin = io_pin_bit(io);
    switch (direction) {
    case IO_DIR_INPUT:
        *port_dir_regs[port] &= ~pin;
        break;
    case IO_DIR_OUTPUT:
        *port_dir_regs[port] |= pin;
        break;
    }
}

void io_set_resistor(io_e io, io_resistor_e resistor)
{
    const uint8_t port = io_port(io);
    const uint8_t pin = io_pin_bit(io);
    switch (resistor) {
    case IO_RESISTOR_DISABLED:
        *port_ren_regs[port] &= ~pin;
        break;
    case IO_RESISTOR_ENABLED:
        *port_ren_regs[port] |= pin;
        break;
    }
}

void io_set_out(io_e io, io_out_e out)
{
    const uint8_t port = io_port(io);
    const uint8_t pin = io_pin_bit(io);
    switch (out) {
    case IO_OUT_LOW:
        *port_out_regs[port] &= ~pin;
        break;
    case IO_OUT_HIGH:
        *port_out_regs[port] |= pin;
        break;
    }
}

io_in_e io_get_input(io_e io)
{
    return (*port_in_regs[io_port(io)] & io_pin_bit(io)) ? IO_IN_HIGH : IO_IN_LOW;
}
