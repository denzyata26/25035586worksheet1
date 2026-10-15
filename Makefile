CC = gcc
NASM = nasm
CFLAGS = -m32
NASMFLAGS = -f elf -I src/
SRC = src
PROGS = task1 task1_2 task2_1 task2_2 task2_3
TARGETS = $(addprefix $(SRC)/,$(PROGS))

all: $(TARGETS)

$(TARGETS): $(SRC)/%: $(SRC)/%.o $(SRC)/driver.o $(SRC)/asm_io.o
	$(CC) $(CFLAGS) $(SRC)/driver.o $< $(SRC)/asm_io.o -o $@

$(SRC)/%.o: $(SRC)/%.asm $(SRC)/asm_io.inc
	$(NASM) $(NASMFLAGS) $< -o $@

$(SRC)/driver.o: $(SRC)/driver.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(SRC)/*.o $(TARGETS)

.PHONY: all clean
