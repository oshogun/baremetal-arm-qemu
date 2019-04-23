GCC = /usr/local/arm/gcc-7.2.0/bin/arm-epos-eabi-gcc-7.2.0
CFLAGS = -c -mcpu=arm926ej-s -g
AS = /usr/local/arm/gcc-7.2.0/arm-epos-eabi/bin/as 
ASFLAGS = -mcpu=arm926ej-s -g 
LD = /usr/local/arm/gcc-7.2.0/arm-epos-eabi/bin/ld -T 
OBJCOPY = /usr/local/arm/gcc-7.2.0/arm-epos-eabi/bin/objcopy 

all: compile assemble link 

compile:
	${GCC} ${CFLAGS} src/test.cpp -o test.o 

assemble:
	${AS} ${ASFLAGS} src/startup.s -o startup.o 

link: 
	${LD} src/test.ld test.o startup.o -o test.elf
	${OBJCOPY} -O binary test.elf test.bin

run:
	qemu-system-arm -M versatilepb -m 128M -nographic -kernel test.bin

clean:
	rm *.o 
	rm test.*