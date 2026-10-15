
%include "asm_io.inc"



segment .data

prompt1 db "Enter first number: ", 0

prompt2 db "Enter second number: ", 0

outmsg  db "Sum = ", 0



segment .bss

input1  resd 1

input2  resd 1



segment .text

        global asm_main

asm_main:

        enter 0,0

        pusha



        mov  eax, prompt1

        call print_string

        call read_int

        mov  [input1], eax



        mov  eax, prompt2

        call print_string

        call read_int

        mov  [input2], eax



        mov  eax, [input1]

        add  eax, [input2]

        mov  ebx, eax

        mov  eax, outmsg

        call print_string

        mov  eax, ebx

        call print_int

        call print_nl



        popa

        mov  eax, 0

        leave

        ret

