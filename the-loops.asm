.model small

.stack 100h

.data
	message db "aboba$"
	newline db 0ah, 0dh, "$"
	times_display equ 100

.code
start:
	mov ax, @data
	mov ds, ax
	
	mov cx, times_display
	mov ah, 09h
	
	display_loop:
		lea dx, message
		int 21h
		lea dx, newline
		int 21h
		loop display_loop

	mov ax, 4c00h
	int 21h

end start