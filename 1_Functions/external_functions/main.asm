extern printf
extern circle_area
extern circumference
extern rectangle_area
extern rectangle_perimeter

global pi

section .data
    pi dq 3.141592
    radius dq 12.0
    side1 dq 4
    side2 dq 7
    
    format_float db "%s %f", 10, 0
    format_int db "%s %d", 10, 0
    
    format_circle_area db "The circle area is", 0
    format_circumference db "The circumference is", 0
    format_rectangle_area db "The rectangle area is", 0
    format_rectangle_perimeter db "The rectangle perimeter is", 0
    
section .bss

section .text
    global main
main:
    push rbp
    mov rbp, rsp
    
    ; circle area
    movsd xmm0, qword [radius]
    call circle_area
    
    mov rdi, format_float
    mov rsi, format_circle_area
    mov rax, 1
    call printf
    
    ; circumference
    movsd xmm0, qword [radius]
    call circumference
    
    mov rdi, format_float
    mov rsi, format_circumference
    mov rax, 1
    call printf
    
    ; rectangle area
    mov rdi, [side1]
    mov rsi, [side2]
    call rectangle_area
    
    mov rdi, format_int
    mov rsi, format_rectangle_area
    mov rdx, rax
    mov rax, 0
    call printf
    
    ; rectangle perimeter
    mov rdi, [side1]
    mov rsi, [side2]
    call rectangle_perimeter
    
    mov rdi, format_int
    mov rsi, format_rectangle_perimeter
    mov rdx, rax
    mov rax, 0
    call printf
    
    mov rsp, rbp
    pop rbp
    ret