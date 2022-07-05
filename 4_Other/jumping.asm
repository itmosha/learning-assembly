extern printf
section .data
    number1 dq 20
    number2 dq 30
    
    format1 db "number1 = number2", 10, 0
    format2 db "number1 > number2", 10, 0
    format3 db "number1 < number2", 10, 0
section .bss
section .text
    global main
main:
    mov rbp, rsp; for correct debugging
    push rbp
    mov rbp, rsp
   
    ; put numbers into the registers   
    mov rax, [number1]
    mov rbx, [number2]
    cmp rax, rbx
    
    ; if number1 = number2 go to equal
    je equal
    
    ; if number1 > number2 go to greater
    jg greater
    
    ; else number1 < number2
    mov rdi, format3
    mov rax, 0
    call printf
    jmp exit
    
equal:
    mov rdi, format1
    mov rax, 0
    call printf
    jmp exit
    
greater:
    mov rdi, format2
    mov rax, 0
    call printf
    jmp exit
    
exit:
    mov rsp, rbp
    pop rbp
    ret
    
    