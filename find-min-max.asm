.model small

.stack 100h
.386

.data
	arr db 3, 14, 15, 92, 6, 5, 35, 89, 79
	arr_size equ $ - arr
	element_prompt_1 db "arr[$"
	element_prompt_2 db "]: $"
	min_prompt db "min(arr): $"
	max_prompt db "max(arr): $"
	newline db 0ah, 0dh, "$"

.code
start:
	mov ax, @data
	mov ds, ax
	
	mov cx, arr_size
	xor si, si
	
	xor ax, ax
	xor dx, dx
	mov ah, arr[si] ; max element
	mov al, arr[si] ; min element

	arr_loop:
		mov bl, arr[si]
		
		lea dx, element_prompt_1
		call output_string_dx

		mov dx, si
		call output_number_dx	

		lea dx, element_prompt_2
		call output_string_dx

		xor dx, dx
		mov dl, arr[si]
		call output_number_dx
		
		lea dx, newline
		call output_string_dx

		check_max:
			cmp ah, bl
			jae check_min

		update_max:
			mov ah, bl
			
		check_min:
			cmp al, bl
			jle next_iter
		
		update_min:
			mov al, bl

		next_iter:		
			inc si
			loop arr_loop

	lea dx, max_prompt
	call output_string_dx

	xor dx, dx
	mov dl, ah
	call output_number_dx
	
	lea dx, newline
	call output_string_dx
	
	lea dx, min_prompt
	call output_string_dx

	xor dx, dx
	mov dl, al
	call output_number_dx
	
	lea dx, newline
	call output_string_dx

	mov ax, 4c00h
	int 21h
	
	proc output_string_dx
		push ax

		xor ax, ax
		mov ah, 09h
		int 21h

		pop ax
		ret
	output_string_dx endp

	proc output_number_dx
    pusha
    mov cx, 0

		mov ax, dx
		xor dx, dx
    mov bx, 10

		push_digits:
			div bx
			push dx
			inc cx
			xor dx, dx
			test ax, ax
			jnz push_digits

		mov ah, 02h
		pop_digits:
			pop dx
			add dl, '0'
			int 21h
			loop pop_digits

		popa
		ret
	output_number_dx endp

end start