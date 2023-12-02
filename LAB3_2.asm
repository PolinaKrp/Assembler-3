%include "io64.inc"
%include "/Users/79276/Desktop/asm3/io64_float.inc"

section .data
    T1: dq 0.5
    T2: dq -4
    T3: dq 4
    T4: dq 12

section .text
global main
CEXTERN access1

main:
    push rbp
    movss xmm6, dword [T1] 
    mov r8, [T2] 
    mov r9d, [T3] 
    mov rdx, [T4]
    call    access1
    pop rbp
    ret