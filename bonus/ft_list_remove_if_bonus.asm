section .text
global ft_list_remove_if
extern c_free

ft_list_remove_if:
	push rdi				; [rsp + 24]	= **begin_list
	push rsi				; [rsp + 16]	= *data_ref
	push rdx				; [rsp + 8]		= (*cmp)()
	push rcx				; [rsp]			= (*free_fct)(void *)
	cmp [rsp + 24], word 0	; if **begin_list == NULL
	je .return				; goto return
	cmp [rsp + 8], word 0	; if (*cmp)() == NULL
	je .return				; goto return
	cmp [rsp], word 0		; if (*free_fct) (void *) == NULL
	je .return				; goto return
	mov r8, [rdi]			; r8 = *begin_list
	mov r9, 0				; r9 = NULL (prev)
.loop:
	cmp r8, 0				; if *list == NULL
	je .return				; goto return	
	mov rdi, [r8]			; rdi = list->data
	mov rsi, [rsp + 16]		; rsi = data_ref
	push r8					; pushin r8
	push r9					; pushin r9
	sub rsp, 8				; aligning stack
	call [rsp + 32]			; cmp(list->data, data_ref)
	add rsp, 8				; .remove alignment
	pop r9					; poping r9
	pop r8					; poping r8
	cmp rax, 0				; if list->data == data_ref
	je .remove				; goto .remove
	mov r9, r8				; r9 = prev
	mov r8, [r8 + 8]		; list = list->next
	jmp .loop				; goto .loop

.remove:
	cmp r9, 0				; if prev == NULL
	je .no_prev				; goto .no_prev
	mov r10, [r8 + 8]		; r10 = list->next
	mov [r9 + 8], r10		; prev->next = list->next
	jmp .free_data		    ; free list item

.no_prev:
	mov r10, [r8 + 8]		; r10 = list->next
	mov r11, [rsp + 24]		; r11 = **begin_list
	mov [r11], r10			; *begin_list = list->next
	jmp .free_data		    ; free list item

.free_data:
	mov rdi, [r8]			; rdi = list->data
	push r8					; pushin r8
	push r9					; pushin r9
	sub rsp, 8				; aligning stack
	call [rsp + 24]			; free_fct(list->data);
	add rsp, 8				; .remove alignment
	pop r9					; poping r9
	pop r8					; poping r8
	mov rdi, r8				; rdi = list
	mov r8, [r8 + 8]		; r8 = list->next
	push r8					; pushin r8
	push r9					; pushin r9
	sub rsp, 8				; aligning stack
	call c_free				; free(list);
	add rsp, 8				; .remove alignment
	pop r9					; poping r9
	pop r8					; poping r8
	jmp .loop				; goto .loop

.return:
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	ret

section .note.GNU-stack noalloc noexec nowrite progbits