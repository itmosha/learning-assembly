section .data
	message dd "hello, world", 10, 0
section .bss
section .text
	global main
main:
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 13

	syscall
	mov rax, 60
	mov rdi, 0
	syscall

