;Nhap vao ho ten, xuat xin chao ho ten tren man hinh
%include "io.inc"
extern _getch
extern _gets

section .data
    tb1 db "Nhap ho ten: ",0
    tb2 db "Xin chao %s",0
    fmt db "%s",0
section .bss
    hoten resb 30 
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    push tb1
    call _printf
    
    ;Nhap ho ten
    ;scanf("%s",&hoten);
    ;push hoten
    ;push fmt
    ;call _scanf
    ;add esp,8 ;push 2 lan
    
    ;gets hoten
    push hoten
    call _gets
    add esp,4
    
    ;xuat tb2
    ;prinf("xin chao %s",hoten);
    push hoten
    push tb2
    call _printf
    add esp,8
    call _getch
    
    xor eax, eax
    ret