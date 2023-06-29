;Nhap x, n. Tinh x^n
%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap n: ",0
    tb2 db "Ket qua la: %d ",0
    fmt db "%d",0
    tb3 db "Nhap x: ",0
  
    
section .bss
    n resd 1
    s resd 1  ;bien tong
    x resd 1 
section .text
global CMAIN
CMAIN:
    ;write your code here
    ; Xuat tb1
    push tb1
    call _printf
    add esp, 4
    
    ;Nhap n
    push n
    push fmt
    call _scanf
    add esp, 8
    
    push tb3
    call _printf
    add esp, 4
    
    ;Nhapx
    push x
    push fmt
    call _scanf
    add esp, 8
    
    ;Khoi tao 
    mov eax, 1  ; eax+x
    mov ecx, [n]

Lap:
    mul dword[x]  ;eax=eax*x 
    Loop Lap ;
    
    ; luu eax vao s
    mov [s], eax
    ;Xuat tb2
    push dword [s]
    push tb2
    call _printf
    add esp, 8
    
     
    
    call _getch
    xor eax, eax
    ret
