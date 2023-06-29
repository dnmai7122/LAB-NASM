;Tinh tong tu 1 den n
%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap n: ",0
    tb2 db "Tong tu 1 den n la %d",0
    fmt db "%d",0
section .bss
    n resd 1
    s resd 1
section .text
global CMAIN
CMAIN:
    ;Xuat tb1
    push tb1
    call _printf
    add esp,4
    
    ;Nhap n
    push n
    push fmt ;Lay fmt truoc roi den n
    call _scanf
    add esp,8
    
    ;Khoi tao
    mov eax,0 ;s=0;kq la thanh ghi
    mov esi,1 ;i=1
Lap:
    add eax,esi ;s=s+i
    inc esi ;i++
    ;kiem tra i<=n thi Lap
    cmp esi,[n]
    jle Lap
    
    ;Luu eax vao s
    mov [s],eax
    ;Xuat tb2
    push dword[s]
    push dword[n]
    push tb2
    call _printf
    add esp,12
    
    call _getch
    
    
    
    
    ;write your code here
    xor eax, eax
    ret