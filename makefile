main: main.o
	gcc -o main main.o -no-pie
main.o: main.asm
	nasm -f elf64 -g -F dwarf main.asm -l main.lst
