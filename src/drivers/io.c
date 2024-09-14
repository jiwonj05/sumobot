#include "io.h"
#include "defines.h"

/* Enums are represented as 16-bit by default on MSP43. The enum value can be viewed as:
 * [ Zeros (11 bits) | Port (2 bits) | pin (3 bits)] */


#define IO_PORT_OFFSET (3u) //this represents the position of where the port bits are located
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


void io_set_select(io_e io, io_select_e select)
{
    UNUSED(io);
    UNUSED(select);
    switch (select)
    {
	    case IO_SELECT_GPIO:
		    switch (io_port(io)){
		    case 0:
			    break;
		    case 1:
		            break;
		    case 2:
			    break;
		    
		    }
		    break

    
    
    
    
    
    }
   
    // TODO: implementation
}

void io_set_direction(io_e io, io_dir_e direction)
{
    UNUSED(io);
    UNUSED(direction);
    // TODO: implementation
}

void io_set_resistor(io_e io, io_resistor_e resistor)
{
    UNUSED(io);
    UNUSED(resistor);
    // TODO: implementation
}

void io_set_out(io_e io, io_out_e out)
{
    UNUSED(io);
    UNUSED(out);
    // TODO: implementation
}

io_in_e io_get_input(io_e io)
{
    UNUSED(io);
    // TODO: implementation
    return 0;
}
