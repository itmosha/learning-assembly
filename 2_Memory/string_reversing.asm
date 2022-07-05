extern printf

section .data
    string db "vim <3", 0
    string_length equ $-string-1
    
    format1 db "The original string: %s", 10, 0
    format2 db "The reversed string: %s", 10, 0

section .bss
section .text
    global main
    
main:
    push rbp
    mov rbp, rsp
    
    mov rdi, format1
    mov rsi, string
    mov rax, 0
    call printf

    xor rax, rax
    mov rbx, string
    mov rcx, string_length
    mov r12, 0
    
    ; pushing the string onto the stack
push_string:
    mov al, byte[rbx+r12]
    push rax
    inc r12
    loop push_string
          
    mov rbx, string
    mov rcx, string_length
    mov r12, 0
    
    ; popping the string off the stack and getting a reversed version
pop_string:
    pop rax
    mov byte[rbx+r12], al
    inc r12
    loop pop_string
    
    ; adding \0 to the reversed string
    mov byte[rbx+r12], 0
    
    mov rdi, format2
    mov rsi, string
    mov rax, 0
    call printf
    
    mov rsp, rbp
    pop rbp
    ret
    