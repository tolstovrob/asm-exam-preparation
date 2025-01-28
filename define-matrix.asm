.model small

.stack 100h

.data
	matrix_1 db 5 dup(2 dup(?))
	matrix_2 db 5*2 dup(?)

.code
start:
	mov ax, @data
	mov ds, ax
	
	mov ax, 4c00h
	int 21h
end start