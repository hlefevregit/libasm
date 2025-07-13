section .text
global ft_strcpy

ft_strcpy:
    push rbp
    pop rbp, rsp

    mov rdx, rdi


.copy_loop:
    mov al, [rsi]
    mov [rdi], al
    inc rsi
    inc rdi
    test al, al
    jne .copy_loop

    mov rax, rdx
    pop rbp
    ret