.model small

.stack 100h

.386

.code
start:
  mov eax, 65536
  mov ebx, 10
  mov cx, 0
  
  inputnum:
    xor dx, dx
    inc cx
    div ebx
    push dx
    cmp ax, 0
    jne inputnum
  
  mov ah, 02h
  
  outputnum:
    xor dx, dx
    pop dx
    add dx, 30h
    int 21h
    loop outputnum
  
  mov ax, 4c00h
  int 21h

end start