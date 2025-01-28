.model small

.stack 100h
.386

.data
	num equ 69

.code
start:
	mov ax, @data
	mov ds, ax

	mov ax, num
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