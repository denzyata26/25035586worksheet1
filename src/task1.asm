
%include "asm_io.inc"



segment .data

a       dd 15

b       dd 25

msg     db "a + b = ", 0



segment .text

        global asm_main

asm_main:

        enter 0,0

        pusha



        mov  eax, [a]

        add  eax, [b]

        mov  ebx, eax

        mov  eax, msg

        call print_string

        mov  eax, ebx

        call print_int

        call print_nl



        popa

        mov  eax, 0

        leave

        ret

