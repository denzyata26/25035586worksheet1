
%macro ENTER_C 0

        push ebx

        push ecx

        push edx

        push esi

        push edi

        mov  esi, esp

        and  esp, 0xFFFFFFF0

        sub  esp, 16

%endmacro



%macro LEAVE_C 0

        mov  esp, esi

        pop  edi

        pop  esi

        pop  edx

        pop  ecx

        pop  ebx

%endmacro



segment .data

int_fmt   db "%d", 0

str_fmt   db "%s", 0



segment .bss

tmp       resd 1



segment .text

        global print_int, print_char, print_string, print_nl

        global read_int, read_char

        extern printf, putchar, scanf, getchar, fflush



print_int:

        ENTER_C

        mov  [esp+4], eax

        mov  dword [esp], int_fmt

        call printf

        LEAVE_C

        ret



print_char:

        ENTER_C

        movzx eax, al

        mov  [esp], eax

        call putchar

        LEAVE_C

        ret



print_string:

        ENTER_C

        mov  [esp+4], eax

        mov  dword [esp], str_fmt

        call printf

        LEAVE_C

        ret



print_nl:

        ENTER_C

        mov  dword [esp], 10

        call putchar

        LEAVE_C

        ret



read_int:

        ENTER_C

        mov  dword [esp], 0

        call fflush

        mov  dword [esp+4], tmp

        mov  dword [esp], int_fmt

        call scanf

        mov  eax, [tmp]

        LEAVE_C

        ret



read_char:

        ENTER_C

        mov  dword [esp], 0

        call fflush

        call getchar

        LEAVE_C

        ret

