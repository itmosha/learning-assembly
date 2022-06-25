extern pi

section .data
section .bss
section .text

    global circle_area
circle_area:
    section .text
        push rbp
        mov rbp, rsp
        
        movsd xmm1, qword [pi]
        mulsd xmm0, xmm0
        mulsd xmm0, xmm1
        
        mov rsp, rbp
        pop rbp
        ret
        
    global circumference
circumference:
    section .text
        push rbp
        mov rbp, rsp
        
        movsd xmm1, qword [pi]
        addsd xmm0, xmm0
        mulsd xmm0, xmm1
        
        mov rsp, rbp
        pop rbp
        ret