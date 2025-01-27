.model small

.stack 100h

.data
	Response struc
		status dw 200
		message db 20 dup(?)
	Response ends

	Err404 Response <404, "Not found$">
	Err502 Response <502, "Bad gateway$">
	Ok200 Response < , "OK$">

	newline db 0ah, 0dh, '$'

.code
start:
	mov ax, @data
	mov ds, ax

	lea dx, Ok200.message
	mov ah, 09h
	int 21h
	
	lea dx, newline
	mov ah, 09h
	int 21h

	lea dx, Err502.message
	mov ah, 09h
	int 21h
	
	lea dx, newline
	mov ah, 09h
	int 21h

	lea dx, Err404.message
	mov ah, 09h
	int 21h
	
	mov ax, 4c00h
	int 21h

end start