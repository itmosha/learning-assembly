extern printf

section .data
    arg1 db "A", 0
    arg2 db "B", 0
    arg3 db "C", 0
    arg4 db "D", 0
    arg5 db "E", 0
    arg6 db "F", 0
    arg7 db "G", 0
    arg8 db "H", 0
    arg9 db "I", 0
    arg10 db "J", 0
    
    pi dq 3.141592
    
    format_string db "The string is %s%s%s%s%s%s%s%s%s%s", 10, 0
    format_float db "PI = %f", 10, 0
    
section .bss
section .text
    global main
main:
    
    push rbp
    mov rbp, rsp
    
    ; move first 6 values into the registers
    mov rdi, format_string
    mov rsi, arg1
    mov rdx, arg2
    mov rcx, arg3
    mov r8, arg4
    mov r9, arg5
    
    ; push the remaining values onto the stack
    push arg10
    push arg9
    push arg8
    push arg7
    push arg6
    
    mov rax, 0
    call printf
    and rsp, 0xfffffffffffffff0
    
    movsd xmm0, [pi]
    mov rax, 1
    mov rdi, format_float
    call printf
    
    leave
    ret