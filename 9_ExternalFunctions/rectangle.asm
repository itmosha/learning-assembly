section .data
section .bss
section .text
    
    global rectangle_area
rectangle_area:
    section .text
        push rbp
        mov rbp, rsp
       
        mov rax, rsi
        imul rax, rdi
        
        mov rsp, rbp
        pop rbp
        ret
        
    global rectangle_perimeter
rectangle_perimeter:
    section .text
        push rbp
        mov rbp, rsp
        
        mov rax, rsi
        add rax, rdi
        add rax, rax
        
        mov rsp, rbp
        pop rbp
        ret