;Viet ham tinh tong tu 1 den n
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
     
    ;Goi ham
    push dword [n]
    call _TinhTong
    add esp,4
    
    ;Lay kq tra ve
    mov[s],eax
    
    ;Xuat tb2
    push dword[s]
    push dword[n]
    push tb2
    call _printf
    add esp,12
    
    call _getch
    xor eax,eax
    ret
    
global _TinhTong
_TinhTong:
    push ebp;backup ebp
    mov ebp,esp
    sub esp,64
    
    ;backup thanh ghi
    ;push eax, khong can backup vi day la kq tra ve
    push esi
    
    ;Khoi tao
    mov eax,0
    mov esi,1
_TinhTong.Lap:
    add eax,esi ;s=s+i
    inc esi;i++
    
    ;kt i<=n
    cmp esi,[ebp+8];
    jle _TinhTong.Lap
    
    ;restore
    pop esi
    pop eax
    ;Xoat stack
    add esp,64
    ;Khoi phuc ebp
    mov esp,ebp
    pop ebp
    ret