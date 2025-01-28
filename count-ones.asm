.model small

.stack 100h
.386

.data
	arr dw 0, 1, 0, 1, 0, 1, 0, 1
	arr_size equ 8
	prompt db "Count of '1': $"

.code
start:
	mov ax, @data
	mov ds, ax
	
	lea dx, prompt
	mov ah, 09h
	int 21h

	mov cx, arr_size
	xor si, si
	xor ax, ax

	find_ones:
		mov bx, arr[si]
		add si, 2
		cmp bx, 1
		jne next_iter
		inc ax
		next_iter:
			loop find_ones
	
	call output_num

	mov ax, 4c00h
	int 21h

	proc output_num
		pusha

		mov cx, 0
		mov bx, 10

		push_digits:
			xor dx, dx
			inc cx
			div bx
			push dx
			cmp ax, 0
			jne push_digits
		
		xor ax, ax
		mov ah, 02h
		pop_digits:
			pop dx
			add dx, '0'
			int 21h
			loop pop_digits

		popa
		ret
	output_num endp

end start