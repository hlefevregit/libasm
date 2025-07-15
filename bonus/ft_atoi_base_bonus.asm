section .text
global ft_atoi_base
extern ft_value

ft_atoi_base:
    xor rax, rax
    xor rbx, rbx
    xor rdx, rdx         ; ✅ résultat = 0
    mov r8, 1

.skip_whitespaces:
    movzx rcx, byte [rdi + rbx]  ; ✅ respect de l'index
    cmp rcx, 32
    je .inc_i
    cmp rcx, 9
    jb .check_sign
    cmp rcx, 13
    jbe .inc_i
    jmp .check_sign

.inc_i:
    inc rbx
    jmp .skip_whitespaces

.check_sign:
    movzx rcx, byte [rdi + rbx]
    cmp rcx, '-'
    jne .check_plus
    mov r8, -1
    inc rbx
    jmp .loop_start

.check_plus:
    cmp rcx, '+'
    jne .loop_start
    inc rbx


.loop_start:
    movzx rcx, byte [rdi + rbx]
    cmp rcx, 0
    je .done

    mov r10b, cl          ; caractère courant
    push rdi              ; ✅ sauver pointeur `str`
    mov rdi, r10          ; → argument pour ft_value
    call ft_value
    pop rdi               ; ✅ restaurer le pointeur

    cmp eax, -1
    je .done
    cmp eax, esi
    jge .done

    mov r9d, eax
    imul rdx, rsi
    add rdx, r9
    inc rbx
    jmp .loop_start


.done:
    mov rax, rdx          ; ✅ résultat → rax
    imul rax, r8          ; ✅ application du signe
    ret

section .note.GNU-stack noalloc noexec nowrite progbits