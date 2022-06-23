extern printf
section .data
    number1 dq 158
    number2 dq 15
    number3 dq -26
    
    format db "The numbers are %d and %d", 10, 0
    format_int db "%s %d", 10, 0
    
    sum_format db "The sum is", 0
    difference_format db "The difference is", 0
    incremented_format db "Number incremented is", 0
    decremented_format db "Number decremented is", 0
    shift_left_format db "Number shifted left by 3 is", 0
    shift_right_format db "Number shifted right by 2 is", 0
    shift_right2_format db "Number shifted right by 2 with sign extension is", 0
    multiplication_format db "The product is", 0
    division_format db "The quotient is", 0
    modulo_format db "The modulo is", 0
    
section .bss
    result resq 1
    modulo resq 1
    
section .text
    global main
    
main:
    mov rbp, rsp; for correct debugging
   push rbp
   mov rbp, rsp
   mov rdi, format
   mov rsi, [number1]
   mov rdx, [number2]
   mov rax, 0
   
   ; adding numbers
   mov rax, [number1]
   add rax, [number2]
   mov [result], rax
   
   mov rdi, format_int
   mov rsi, sum_format
   mov rdx, [result]
   mov rax, 0
   call printf
   
   ; substracting numbers
   mov rax, [number1]
   sub rax, [number2]
   mov [result], rax
   
   mov rdi, format_int
   mov rsi, difference_format
   mov rdx, [result]
   mov rax, 0
   call printf
   
   ; incrementing a number
   mov rax, [number1]
   inc rax
   mov [result], rax
   
   mov rdi, format_int
   mov rsi, incremented_format
   mov rdx, [result]
   mov rax, 0
   call printf
   
   ; decrementing a number
   mov rax, [number1]
   dec rax
   mov [result], rax
   
   mov rdi, format_int
   mov rsi, decremented_format
   mov rdx, [result]
   mov rax, 0
   call printf
   
   ; left shifting a number
   mov rax, [number1]
   sal rax, 3
   mov [result], rax
   
   mov rdi, format_int
   mov rsi, shift_left_format
   mov rdx, [result]
   mov rax, 0
   call printf
   
   ; right shifting a number
   mov rax, [number1]
   sar rax, 2
   mov [result], rax
   
   mov rdi, format_int
   mov rsi, shift_right_format
   mov rdx, [result]
   mov rax, 0
   call printf
   
   ; right shifting a number with sign extension
   mov rax, [number3]
   sar rax, 2
   mov [result], rax
   
   mov rdi, format_int
   mov rsi, shift_right2_format
   mov rdx, [result]
   mov rax, 0
   call printf
   
   ; multiplying numbers
   mov rax, [number1]
   imul qword [number2]
   mov [result], rax
   
   mov rdi, format_int
   mov rsi, multiplication_format
   mov rdx, [result]
   mov rax, 0
   call printf
   
   ; dividing numbers
   mov rax, [number1]
   mov rdx, 0
   idiv qword [number2]
   mov [result], rax
   mov [modulo], rdx
   
   mov rdi, format_int
   mov rsi, division_format
   mov rdx, [result]
   mov rax, 0
   call printf
   mov rdi, format_int
   mov rsi, modulo_format
   mov rdx, [modulo]
   mov rax, 0
   call printf
   
   mov rsp, rbp
   pop rbp
   ret
 
   
 