extern printf

section .data
    number1 dq 17.0
    number2 dq 64.0
    
    format db "The numbers are %f and %f", 10, 0
    format_float db "%s %f", 10, 0
    
    format_sum db "The sum of %f and %f is %f", 10, 0
    format_difference db "The difference of %f and %f is %f", 10, 0
    format_product db "The product of %f and %f is %f", 10, 0
    format_quotient db "The quotient of %f and %f is %f", 10, 0
    format_squareroot db "The square root of %f is %f", 10, 0

section .bss
section .text
    global main

main:
    push rbp
    mov rbp, rsp
    
    movsd xmm0, [number1]
    movsd xmm1, [number2]
    mov rdi, format
    mov rax, 2 ; two numbers
    call printf
    
    ; sum of two numbers
    movsd xmm2, [number1]
    addsd xmm2, [number2]
    
    movsd xmm0, [number1]
    movsd xmm1, [number2]
    mov rdi, format_sum
    mov rax, 3
    call printf
    
    ; difference of two numbers
    movsd xmm2, [number2]
    subsd xmm2, [number1]
    
    movsd xmm0, [number2]
    movsd xmm1, [number1]
    mov rdi, format_difference
    mov rax, 3
    call printf
    
    ; product of two numbers
    movsd xmm2, [number1]
    mulsd xmm2, [number2]
    
    movsd xmm0, [number1]
    movsd xmm1, [number2]
    mov rdi, format_product
    mov rax, 3
    call printf
    
    ; quotient of two numbers
    movsd xmm2, [number1]
    divsd xmm2, [number2]
    
    movsd xmm0, [number1]
    movsd xmm1, [number2]
    mov rdi, format_quotient
    mov rax, 3
    call printf
    
    ; square root of a number
    sqrtsd xmm1, [number1]
    
    movsd xmm0, [number1]
    mov rdi, format_squareroot
    mov rax, 2
    call printf
    
    mov rsp, rbp
    pop rbp
    ret
