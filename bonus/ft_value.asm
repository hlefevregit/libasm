section .text
global ft_value

ft_value:
    movzx eax, dil       ; zero-extend char into eax

    cmp al, '0'
    jb .invalid
    cmp al, '9'
    jbe .digit

    cmp al, 'a'
    jb .check_upper
    cmp al, 'f'
    jbe .lower
    jmp .invalid

.check_upper:
    cmp al, 'A'
    jb .invalid
    cmp al, 'F'
    jbe .upper
    jmp .invalid

.digit:
    sub eax, '0'
    ret

.lower:
    sub eax, 'a'
    add eax, 10
    ret

.upper:
    sub eax, 'A'
    add eax, 10
    ret

.invalid:
    mov eax, -1
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
