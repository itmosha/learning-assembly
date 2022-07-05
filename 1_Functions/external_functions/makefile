main: main.o circle.o rectangle.o
	gcc -g -o main main.o circle.o rectangle.o -no-pie
main.o: main.asm
	nasm -f elf64 -g -F dwarf main.asm -l main.lst
circle.o: circle.asm
	nasm -f elf64 -g -F dwarf circle.asm -l circle.lst
rectangle.o: rectangle.asm
	nasm -f elf64 -g -F dwarf rectangle.asm -l rectangle.lst
