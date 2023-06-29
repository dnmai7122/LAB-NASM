;Nhap vao ki tu cuat ra lien truoc lien sau
%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap vao ki tu: ",0
    tb2 db "Ki tu lien truoc: %c",0
    tb3 db 10,"Ki tu lien sau: %c",0
    fmt db "%c",0
section .bss
    c resb 1
section .text
global CMAIN
CMAIN:
    ;write your code here
    ;Xuat tb1
    push tb1
    call _printf
    add esp,4
    
    ;Nhap ki tu
    push c
    push fmt
    call _scanf
    add esp,8
    
    ;Ki tu lien truoc
    mov eax,[c]
    dec eax ;eax=eax-1
    
    ;xuat tb2
    push eax
    push tb2
    call _printf
    add esp,8
    
    
    ;Ki tu lien sau
    mov eax,[c]
    add eax,2
        
    ;xuat tb2
    push eax
    push tb3
    call _printf
    add esp,8
    call _getch
    
    xor eax, eax
    ret