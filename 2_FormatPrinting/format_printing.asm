section .data
	message db "hello, world", 0
	int_number dd 816
	float_number dq 3.14

	format_string db "The string: %s", 10, 0
	format_int db "Int number: %d", 10, 0
	format_float db "Float number: %lf", 10, 0
section .bss
section .text
extern printf
	global main
main:
	push rbp 
	mov rbp, rsp
	
	mov rax, 0
	mov rdi, format_string
	mov rsi, message
	call printf

	mov rax, 0
	mov rdi, format_int
	mov rsi, [int_number]
	call printf

	mov rax, 1
	movq xmm0, [float_number]
	mov rdi, format_float
	call printf
		
	mov rsp, rbp
	pop rbp
ret
