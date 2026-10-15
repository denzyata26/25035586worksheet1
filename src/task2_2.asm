
%include "asm_io.inc"



segment .data

msg     db "Sum = ", 0



segment .bss

array   resd 100



segment .text

        global asm_main

asm_main:

        enter 0,0

        pusha



        mov  ecx, 0

fill:

        lea  eax, [ecx+1]

        mov  [array + ecx*4], eax

        inc  ecx

        cmp  ecx, 100

        jl   fill



        mov  ecx, 0

        mov  edx, 0

sum:

        add  edx, [array + ecx*4]

        inc  ecx

        cmp  ecx, 100

        jl   sum



        mov  eax, msg

        call print_string

        mov  eax, edx

        call print_int

        call print_nl



        popa

        mov  eax, 0

        leave

        ret

