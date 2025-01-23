.model small

.stack 100h

.data
  credentials db "Robert Tolstov, 251", 0ah, 0dh, '$'
  
.code
start:
  mov ax, @data
  mov ds, ax
  
  mov al, 6
  mov bl, 9
  
  add al, 30h
  add bl, 30h

  lea dx, credentials
  call displaystring
  
  mov dl, al
  call displaychar

  mov dl, ' '
  call displaychar

  mov dl, bl
  call displaychar
  
  mov ax, 4c00h
  int 21h

  proc displaystring
    push ax
    mov ah, 09h
    int 21h
    pop ax
    ret
  displaystring endp
  
  proc displaychar
    push ax
    mov ah, 02h
    int 21h
    pop ax
    ret
  displaychar endp

end start