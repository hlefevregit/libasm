section .text
global ft_list_push_front

ft_list_push_front:

    test rdi, rdi
    je .end
    test rsi, rsi
    je .end

    mov rax, [rdi]     ; head = *head
    mov [rsi + 8], rax     ; rsi->next = head
    mov [rdi], rsi        ; head = new element  

.end:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits