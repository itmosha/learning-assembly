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
    
    format db "The string is %s", 10, 0

section .bss
    string resb 11
section .text
    global main
main:

    push rbp
    mov rbp, rsp
     
    ; moving first 6 values into the registers
    mov rdi, string
    mov rsi, arg1
    mov rdx, arg2
    mov rcx, arg3
    mov r8, arg4
    mov r9, arg5
    
    ; pushing the remaining values onto the stack
    push arg10
    push arg9
    push arg8
    push arg7
    push arg6
    
    call func
    
    mov rdi, format
    mov rsi, string
    mov rax, 0
    call printf
    
    leave
    ret
    
func:
    push rbp
    mov rbp, rsp
    
    ; clear rax
    xor rax, rax
    
    ; store first 5 letters in memory
    mov al, byte[rsi]
    mov [rdi], al
    mov al, byte[rdx]
    mov [rdi+1], al
    mov al, byte[rcx]
    mov [rdi+2], al
    mov al, byte[r8]
    mov [rdi+3], al
    mov al, byte[r9]
    mov [rdi+4], al
    
    ; get arguments from the stack
    push rbx
    xor rbx, rbx
    mov rax, qword [rbp+16]
    mov bl, byte[rax]
    mov [rdi+5], bl
    mov rax, qword [rbp+24]
    mov bl, byte[rax]
    mov [rdi+6], bl
    mov rax, qword [rbp+32]
    mov bl, byte[rax]
    mov [rdi+7], bl
    mov rax, qword [rbp+40]
    mov bl, byte[rax]
    mov [rdi+8], bl
    mov rax, qword [rbp+48]
    mov bl, byte[rax]
    mov[rdi+9], bl
    mov bl, 0
    mov [rdi+10], bl
    
    pop rbx
    mov rsp, rbp
    pop rbp
    ret
    