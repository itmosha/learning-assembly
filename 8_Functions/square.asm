extern printf

section .data
    side dd 14
section .bss
section .text

square_area:
    section .text
        push rbp
        mov rbp, rsp
        
        mov rax, [side]
        imul qword [side]
        mov rdx, rax
        
        leave
        ret

square_perimeter:
    section .text
        push rbp
        mov rbp, rsp
        
        mov rax, [side]
        mov rcx, 4
        mul rcx
        mov rdx, rax
         
        leave
        ret

square:
    section .data
        .format_area dq "The area of the square is %d", 10, 0
        .format_perimeter dq "The perimeter of the square is %d", 10, 0
        
    section .text
        push rbp
        mov rbp, rsp
        
        call square_area
        mov rax, 0
        mov rdi, .format_area
        mov rsi, rdx
        call printf
        
        call square_perimeter
        mov rax, 0
        mov rdi, .format_perimeter
        mov rsi, rdx
        call printf
        
        leave
        ret
        
    global main
main:
    mov rbp, rsp; for correct debugging
    push rbp
    mov rbp, rsp
    
    call square
    
    leave
    ret
    
