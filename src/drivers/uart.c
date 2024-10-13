#include "uart.h"
#include "ring_buffer.h"
#include "assert_handler.h"
#include <msp430.h>
#include <assert.h>
#include <stdint.h>

#define UART_BUFFER_SIZE (16)
static uint8_t buffer[UART_BUFFER_SIZE];
static struct ring_buffer tx_buffer = { .buffer = buffer, .size = sizeof(buffer) };

#define SMCLK (16000000u)
#define BRCLK (SMCLK)
#define UART_BAUD_RATE (115200u)
static_assert(UART_BAUD_RATE < (BRCLK / 3.0f),
              "Baudrate must be smaller than 1/3 of input clock in Low-Frequency Mode");
#define UART_DIVISOR ((float)BRCLK / UART_BAUD_RATE)
static_assert(UART_DIVISOR < 0xFFFFu, "Sanity check divisor fits in 16-bit");
#define UART_DIVISOR_INT_16BIT ((uint16_t)UART_DIVISOR)
#define UART_DIVISOR_INT_LOW_BYTE (UART_DIVISOR_INT_16BIT & 0xFF)
#define UART_DIVISOR_INT_HIGH_BYTE (UART_DIVISOR_INT_16BIT >> 8)
#define UART_DIVISOR_FRACTIONAL (UART_DIVISOR - UART_DIVISOR_INT_16BIT)
#define UART_UCBRS ((uint8_t)(8 * UART_DIVISOR_FRACTIONAL))
#define UART_UCBRF (0)
#define UART_UC0S16 (0)
static_assert(UART_UCBRS < 8, "Sanity check second modulation stage value fits in 3-bit");

static inline void uart_tx_clear_interrupt(void)
{
    IFG2 &= ~UCA0TXIFG;
}

static inline void uart_tx_enable_interrupt(void)
{
    UC0IE |= UCA0TXIE;
}

static inline void uart_tx_disable_interrupt(void)
{
    UC0IE &= ~UCA0TXIE;
}

static void uart_tx_start(void)
{
    if (!ring_buffer_empty(&tx_buffer)) {
        UCA0TXBUF = ring_buffer_peek(&tx_buffer);
    }
}

__attribute__((interrupt(USCIAB0TX_VECTOR))) void isr_uart_tx()
{
    if (ring_buffer_empty(&tx_buffer)) {
        // TODO: Assert
        while (1)
            ;
    }

    // Remove the transmitted data byte from the buffer
    ring_buffer_get(&tx_buffer);

    uart_tx_clear_interrupt();

    if (!ring_buffer_empty(&tx_buffer)) {
        uart_tx_start();
    }
}

static bool initialized = false;
void uart_init(void)
{
    ASSERT(!initialized);

    /* Reset module. It stays in reset until cleared. The module should be in reset
     * condition while configured according to the user guide (SLAU144K). */
    UCA0CTL1 &= UCSWRST;

    /* Use default (data word length 8 bits, 1 stop bit, no parity bit)
     * [ Start (1 bit) | Data (8 bits) | Stop (1 bit) ] */
    UCA0CTL0 = 0;

    // Set SMCLK as clock source.
    UCA0CTL1 |= UCSSEL_2;

    // Set clock prescaler to the integer part of divisor N.
    UCA0BR0 = UART_DIVISOR_INT_LOW_BYTE;
    UCA0BR1 = UART_DIVISOR_INT_HIGH_BYTE;

    /* Set modulation to account for the fractional part of divisor N.
     * UCA0MCTL = [UCBRF (4 bits) | UCBRS (3 bits) | UC0S16 (1 bit) ] */
    UCA0MCTL = (UART_UCBRF << 4) + (UART_UCBRS << 1) + UART_UC0S16;

    // Clear reset to release the module for operation.
    UCA0CTL1 &= ~UCSWRST;

    uart_tx_clear_interrupt();

    uart_tx_enable_interrupt();

    initialized = true;
}

void uart_putchar_polling(char c)
{
    // Wait for any ongoing transmittion to finish
    while (!(IFG2 & UCA0TXIFG)) { }
    UCA0TXBUF = c;

    // Some terminals expect carriage return (\r) after line-feedd (\n) for proper new line
    if (c == '\n') {
        uart_putchar_polling('\r');
    }
}

void uart_putchar_interrupt(char c)
{
    // Poll if full
    while (ring_buffer_full(&tx_buffer)) { };

    uart_tx_disable_interrupt();
    const bool tx_ongoing = !ring_buffer_empty(&tx_buffer);
    ring_buffer_put(&tx_buffer, c);
    if (!tx_ongoing) {
        uart_tx_start();
    }
    uart_tx_enable_interrupt();

    // Some terminals expect carriage return (\r) after line-feedd (\n) for proper new line
    if (c == '\n') {
        uart_putchar_interrupt('\r');
    }
}

void uart_print_interrupt(const char *string)
{
    int i = 0;
    while (string[i] != '\0') {
        uart_putchar_interrupt(string[i]);
        i++;
    }
}
