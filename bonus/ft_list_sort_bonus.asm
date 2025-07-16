section .text
global ft_list_sort

ft_list_sort:
	mov r10, rsi		; r10 = (*cmp)()
	mov r11, [rdi]		; r11 = *list
loop_start:
	cmp r11, 0			; if *list == NULL
	je return			; goto return
	mov rcx, [r11 + 8]	; rcx = list->next
loop_next:
	cmp rcx, 0			; if *list->next == NULL
	je return			; goto return
	mov rdi, [r11]		; rdi = list->data
	mov rsi, [rcx]		; rsi = list->next->data
	push rcx			; pushing rcx
	push r10			; pushing r10
	push r11			; pushing r11
	call r10			; cmp(rdi, rsi)
	pop r11				; poping r11
	pop r10				; poping r10
	pop rcx				; poping rcx
	cmp eax, 0			; if eax > 0
	jg swap				; goto swap
	jmp next			; goto next
swap:
	mov r8, [r11]		; r8 = list->data
	mov r9, [rcx]		; r9 = list->next->data
	mov [r11], r9		; list->data = list->next->data
	mov [rcx], r8		; list->next->data = list->data
next:
	mov rcx, [rcx + 8]	; list->next = list->next->next
	cmp rcx, 0			; if list->next->next != NULL
	jne loop_next		; goto loop_next
	mov r11, [r11 + 8]	; else list = list->next
	jmp loop_start		; goto loop_start
return:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits
