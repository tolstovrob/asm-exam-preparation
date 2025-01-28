.model small

.stack 100h
.386

.data
	sum_prompt db "Sum of numbers: $"
	arr dw 3, 14, 15, 92, 6, 5, 35, 89, 79, 32, 38
	arr_size equ 11

.code
start:
	mov ax, @data
	mov ds, ax
	
	lea dx, sum_prompt
	mov ah, 09h
	int 21h

	mov ax, 0
	mov cx, arr_size	
	xor si, si

	sum_arr:
		add ax, arr[si]
		add si, 2
		loop sum_arr

	call output_sum

	mov ax, 4c00h
	int 21h
	
	proc output_sum
		pusha

		mov bx, 10
		mov cx, 0

		output_sum_push_numbers:
			inc cx
			xor dx, dx
			div bx
			push dx
			cmp ax, 0
			jne output_sum_push_numbers
		
		mov ah, 02h
		output_sum_pop_numbers:
			pop dx
			add dx, '0'
			int 21h
			loop output_sum_pop_numbers

		popa
		ret
	output_sum endp

end start