section .text
global ft_write
extern __errno_location


ft_write:
	push rbp
	mov rbp, rsp

	mov rax, 1
	syscall
	test rax, rax
	js errno
	pop rbp
	ret

errno:
	neg rax
	push rax
	call __errno_location wrt ..plt
	pop qword rax
	mov rax, -1
	pop rbp
	ret

section .note.GNU-stack noalloc noexec nowrite progbits

