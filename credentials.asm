.model small

.stack 100h

.data
  firstname db "Robert", 0dh, 0ah, '$'
  lastname db "Tolstov", 0dh, 0ah, '$'
  group db "251$"
  
.code
start:
  mov ax, @data
  mov ds, ax
  
  mov ah, 09h
  
  lea dx, firstname
  int 21h
  
  lea dx, lastname
  int 21h
  
  lea dx, group
  int 21h
  
  mov ax, 4c00h
  int 21h

end start
