%include "io64.inc"

section .data
    string db 256 dup(0)
    surname db 256 dup(0)
    string2 db "%s", 10, 0
    number db "%d", 10, 0 

section .text
    global main 
    extern printf 
    extern scanf

main:
    ; считываем строку
    push rbp 
    mov rbp, rsp 
    sub rsp, 32
    mov rcx, string2
    lea rdx, [string]
    call scanf
    add rsp, 32 
    pop rbp
 

    ; считываем вторую строку
    push rbp 
    mov rbp, rsp 
    sub rsp, 32 
    mov rcx, string2 
    lea rdx, [surname]
    call scanf
    add rsp, 32
    pop rbp
    
    ; сохраняем первый символ второй строки в r8
    movzx r8, byte [surname] 
    mov r8, 'K' 
    jb done 
    add r8, 32 
    done:
    
    mov r9, 0 
    mov r10, 0
    
    ; начинаем цикл
loop:
    movzx rax, byte [string + r10]
    cmp rax, r8
    je equal
    jmp next
    
equal:
    inc r9
    jmp next 

next:
    inc r10 
    cmp byte [string + r10], 0 
    jne loop 

    push rbp 
    mov rbp, rsp 
    sub rsp, 32 
    mov rcx, number 
    mov rdx, r9 
    call printf 
    add rsp, 32 
    pop rbp 
    
    mov rax, 0 
    ret 
