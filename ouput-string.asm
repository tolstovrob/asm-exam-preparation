.model small

.stack 100h

.data
	msg db "Hello, flipping asm$"

.code
start:
	mov ax, @data
	mov ds, ax
	
	lea dx, msg
	mov ah, 09h
	int 21h
	
	mov ax, 4c00h
	int 21h
	
end start