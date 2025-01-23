.model small

.stack 100h

.code
start:
  mov ax, @data
  mov ds, ax

  mov ax, 6969
  mov bx, 10
  mov cx, 0
  
  inputnum:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne inputnum
  
  outputnum:
    xor dx, dx
    pop dx
    add dx, 30h
    mov ah, 02h
    int 21h
    loop outputnum
    
  mov ax, 4c00h
  int 21h

end start