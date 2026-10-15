
# UFCFWK-15-2 Worksheet 1: An echo of Assembler



Build everything with `make` in the repo root, clean with `make clean`.

Programs are 32-bit NASM assembly called from a small C driver (`src/driver.c`).



## Task 1



### task1.asm

Adds two integers stored in global memory and prints the result with `print_int`.



```nasm

mov  eax, [a]      ; [a] reads the VALUE stored at label a

add  eax, [b]

mov  ebx, eax      ; keep the sum, print_string overwrites eax

mov  eax, msg      ; no brackets: the ADDRESS of the string

call print_string

mov  eax, ebx

call print_int

```



Output: `a + b = 40`



### task1_2.asm

Reads two integers with `read_int` (result returned in `eax`), stores them in `.bss`, adds them and prints the sum.



## Task 2



### task2_1.asm: name and welcome loop

The name is read with `read_char` until newline (10) and stored as a 0-terminated string. The count is checked with `cmp` and conditional jumps, then `loop` repeats the welcome message `ecx` times.



```nasm

cmp  eax, 50

jle  too_small      ; n <= 50 is an error

cmp  eax, 100

jge  too_big        ; n >= 100 is an error

mov  ecx, [count]

print_loop:

...

loop print_loop     ; ecx--, jump back while ecx != 0

```



### task2_2.asm: sum of array 1..100

The array has 100 dwords in `.bss`. Element `i` is at `[array + ecx*4]` because each element is 4 bytes.



```nasm

lea  eax, [ecx+1]

mov  [array + ecx*4], eax

```



Output: `Sum = 5050`



### task2_3.asm: sum of a range

Same array, the user enters start and end. The range is valid only if `1 <= start <= end <= 100`. The array index is `start-1` because the array is 0-based.



## Task 3: Makefile

The `all` target builds `task1`, `task1_2`, `task2_1`, `task2_2` and `task2_3`. Pattern rules assemble each `.asm` with `nasm -f elf` and link with `gcc -m32` together with `driver.o` and `asm_io.o`.



## Screenshots

