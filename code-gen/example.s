@ assemble: arm-none-eabi-as -o example.o example.s 
@ link: arm-none-eabi-ld -Ttext=0x0 -o example.elf example.o
@ convert to binary: arm-none-eabi-objcopy -O binary example.elf example.bin
@ create Flash representation: dd if=/dev/zero of=flash.bin bs=4096 count=4096
@ copy the binary to Flash: dd if=example.bin of=flash.bin bs=4096 conv=notrunc
@ start qemu: qemu-system-arm -M connex -pflash flash.bin -nographic -serial /dev/null
@ info registers
@ quit

        MOV  R0, #0         @ R0 accumulates total
        MOV  R1, #10        @ R1 counts from 10 down to 1        
again:   ADD  R0, R0, R1
        SUBS R1, R1, #1
        BNE  again
halt:    B    halt           @ infinite loop to stop computation
