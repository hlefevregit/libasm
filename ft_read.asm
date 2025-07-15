section .text
global ft_read
extern __errno_location

ft_read:
    push rbp
    mov rbp, rsp

    mov rax, 0
    syscall
    test rax, rax
    js errno

    pop rbp
    ret

errno:
    neg rax             
    push rax
    call __errno_location wrt ..plt
    pop rbx  
    mov [rax], rbx
    mov rax, -1
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
