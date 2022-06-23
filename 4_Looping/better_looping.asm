extern printf
section .data
    number dq 39
    format db "The sum from 1 to %d is %d", 10, 0
section .bss
section .text
    global main
main:
    push rbp
    mov rbp, rsp
    mov rcx, [number]
    mov rax, 0

    ; repeat while counter is less or equal to number
addnumber:
    add rax, rcx
    loop addnumber
    
    ; display the string
    mov rdi, format
    mov rsi, [number]
    mov rdx, rax
    mov rax, 0
    call printf
    
    mov rsp, rbp
    pop rbp
    ret
