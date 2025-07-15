section .text
global ft_strcpy

ft_strcpy:
    push rbp
    mov rbp, rsp

    mov rdx, rdi        ; sauvegarde le pointeur dest (retour)

.copy_loop:
    mov al, [rsi]       ; lit un byte depuis src
    mov byte [rdi], al
    
    test al, al
    jz .copy_end
           ; écrit dans dest
    inc rsi
    inc rdi
    jmp .copy_loop

.copy_end:
    mov rax, rdx        ; retourne l’adresse de dest
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
