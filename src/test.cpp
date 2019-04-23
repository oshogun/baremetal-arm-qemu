extern "C"
{
    volatile unsigned int * const UART0DR = (unsigned int *)0x10009000; // base memory address of the console output (UART0)
    
    // outputs to UART0
    void print_uart0(const char *s) {
        while(*s != '\0') { /* Loop until end of string */
            *UART0DR = (unsigned int)(*s); /* Transmit char */
            s++; /* Next char */
        }
    }

    // our "main" function
    void c_entry() {
        print_uart0("Isto esta rodando em metal desnudo\n");
    }
}