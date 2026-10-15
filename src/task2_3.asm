
%include "asm_io.inc"



segment .data

p_start db "Start (1-100): ", 0

p_end   db "End (1-100): ", 0

msg     db "Sum of range = ", 0

err     db "Error: invalid range", 0



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



        mov  eax, p_start

        call print_string

        call read_int

        mov  ebx, eax

        mov  eax, p_end

        call print_string

        call read_int

        mov  esi, eax



        cmp  ebx, 1

        jl   bad

        cmp  esi, 100

        jg   bad

        cmp  ebx, esi

        jg   bad



        lea  ecx, [ebx-1]

        mov  edx, 0

rsum:

        add  edx, [array + ecx*4]

        inc  ecx

        cmp  ecx, esi

        jl   rsum



        mov  eax, msg

        call print_string

        mov  eax, edx

        call print_int

        call print_nl

        jmp  done

bad:

        mov  eax, err

        call print_string

        call print_nl

done:

        popa

        mov  eax, 0

        leave

        ret

