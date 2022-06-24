extern printf

section .data
    radius dq 16.7
    
section .bss
section .text 

circle_area:
    section .data
        .pi dq 3.141592
        
    section .text
        push rbp
        mov rbp, rsp
        
        movsd xmm0, [radius]
        mulsd xmm0, [radius]
        mulsd xmm0, [.pi]
        
        leave
        ret
        
circumference:
    section .data
        .pi dq 3.141592
        
    section .text
        push rbp
        mov rbp, rsp
        
        movsd xmm0, [radius]
        addsd xmm0, [radius]
        mulsd xmm0, [.pi]
        
        leave
        ret
        
circle:
    section .data
        .format_area db "The area is %.2f", 10, 0
        .format_circumference db "The circumference is %.2f", 10, 0
    
    section .text
        push rbp
        mov rbp, rsp
        
        call circle_area
        mov rdi, .format_area
        mov rax, 1
        call printf
        
        call circumference
        mov rdi, .format_circumference
        mov rax, 1
        call printf
        
        leave
        ret
        
    global main
main:
    push rbp
    mov rbp, rsp
    
    call circle
    
    leave
    ret