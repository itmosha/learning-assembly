extern printf

section .data
    format db "2pi = %.8f", 10, 0
    pi dq 3.14159265
    
section .bss
section .text

func3:
    push rbp
    movsd xmm0, [pi]
    addsd xmm0, [pi]
    
    mov rdi, format
    mov rax, 1
    call printf
    
    pop rbp
    ret
    
func2:
    push rbp
    call func3
    
    pop rbp
    ret
    
func1:
    push rbp
    call func2
    
    pop rbp
    ret
    
    global main
main:
    push rbp
    call func1
    pop rbp
    ret