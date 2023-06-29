;Tinh x^n
%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap n: ",0
    tb2 db "Nhap x: ",0
    tb3 db "Ket qua %d^%d = %d",0
    fmt db "%d"
section .bss
    x resd 1
    n resd 1
    T resd 1
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
    
    ;Xuat tb2
    push tb2
    call _printf
    add esp, 4
    
    ;Nhap x
    push x
    push fmt
    call _scanf
    add esp, 8
    
    ;Khoi tao 
    mov eax,1  ; eax = x
    mov ecx,[n]  ; ecx=so lan lap=n
Lap:
    mul dword[x] ;eax=eax*x
    Loop Lap
    
    mov [T],eax
   
    
   
    push dword [T]
    push dword [n]
    push dword [x]
   
    push tb3
    call _printf
    add esp,16
    
    call _getch
    xor eax, eax
    ret