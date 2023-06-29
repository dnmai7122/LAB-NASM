;Nhap n. Tinh tong tu 1 den N
%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap n: ",0
    tb2 db "Tong 1 den %d la: %d ",0
    fmt db "%d",0
section .bss
    n resd 1
    s resd 1  ;bien tong
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
    
    ;Khoi tao 
    mov eax, 0  ; s = 0
    mov ecx, [n]  ; ecx=so lan lap
; Cach 1: dung nhay 
Lap:
    add eax, ecx  ;s=s+i
    Loop Lap; ecx--;neu ecx !=0 thi lap
    
    ; luu eax vao s
    mov [s], eax
    ;Xuat tb2
    push dword [s]
    push dword [n]
    push tb2
    call _printf
    add esp, 12
     
    
    
    
    
    
    
    
    call _getch
    xor eax, eax
    ret