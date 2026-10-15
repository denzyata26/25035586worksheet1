
%include "asm_io.inc"



segment .data

p_name  db "Name: ", 0

p_num   db "Times (50 < n < 100): ", 0

welcome db "Welcome, ", 0

excl    db "!", 0

err_lo  db "Error: number too small", 0

err_hi  db "Error: number too large", 0



segment .bss

name    resb 64

count   resd 1



segment .text

        global asm_main

asm_main:

        enter 0,0

        pusha



        mov  eax, p_name

        call print_string

        mov  ebx, name

read_loop:

        call read_char

        cmp  al, 10

        je   read_done

        mov  [ebx], al

        inc  ebx

        jmp  read_loop

read_done:

        mov  byte [ebx], 0



        mov  eax, p_num

        call print_string

        call read_int

        mov  [count], eax



        cmp  eax, 50

        jle  too_small

        cmp  eax, 100

        jge  too_big



        mov  ecx, [count]

print_loop:

        mov  eax, welcome

        call print_string

        mov  eax, name

        call print_string

        mov  eax, excl

        call print_string

        call print_nl

        loop print_loop

        jmp  done



too_small:

        mov  eax, err_lo

        call print_string

        call print_nl

        jmp  done

too_big:

        mov  eax, err_hi

        call print_string

        call print_nl

done:

        popa

        mov  eax, 0

        leave

        ret

