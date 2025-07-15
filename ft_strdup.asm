section .text
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

ft_strdup:
    ; push rbp
    ; mov rbp, rsp

    push rdi

    call ft_strlen wrt ..plt
    add rax, 1

    mov rdi, rax
    call malloc wrt ..plt
    test rax, rax
    je fail

    pop rsi             ; src
    mov rdi, rax             ; dest
    call ft_strcpy wrt ..plt

    ; pop rbp
    ret

fail:
    neg rax    ; get absolute value of syscall return (-13 -> 13)
	push rax; stock 13 dans la stack
	call __errno_location wrt ..plt ;push dans rax l'address de errno 
	pop qword [rax] ; set errno avec la valeur 13(le push avant)
    mov rax, -1
    ; pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
