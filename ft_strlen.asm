section .text
global ft_strlen

ft_strlen:
    push rbp
    mov rbp, rsp
    
    xor rcx, rcx
    
.loop:
    mov al, [rdi + rcx]
    test al, al
    je .done
    inc rcx
    jmp .loop
    
.done:
    mov rax, rcx
    pop rbp
    ret