section .text
global ft_list_size

ft_list_size:
    ; rdi = head of the list
    ; return the size of the list in rax

    xor rax, rax          ; size = 0

.loop:
    test rdi, rdi         ; check if head is NULL
    je .done
    inc eax
    mov rdi, [rdi + 8]        ; move to the next element
    jmp .loop

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits