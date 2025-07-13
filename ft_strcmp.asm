section .text
global ft_strcmp

ft_strcmp:
    push rbp
    mov rbp, rsp

.loop:
    mov al, byte [rdi]
    mov bl, byte [rsi]
    cmp al, bl
    jne .diff
    test al, al
    je .equal
    inc rdi
    inc rsi
    jmp .loop

.diff:
    movzx eax, al
    movzx ebx, bl
    sub eax, ebx
    pop rbp
    ret

.equal:
    xor eax, eax
    pop rbp
    ret


section .note.GNU-stack noalloc noexec nowrite progbits
