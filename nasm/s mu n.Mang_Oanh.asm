%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap n: ",0
    tb2 db "Nhap x: ",0
    tb3 db "%d ^ %d = %d",0
    fmt db "%d",0
section .bss
    n resb 1
    s resb 1
    x resb 1
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    
    ;xuat tb1
    push tb1
    call _printf
    add esp, 4
    
    ;Nhap n
    push n
    push fmt
    call _scanf
    add esp, 8
    
     ;xuat tb2
    push tb2
    call _printf
    add esp, 4
    
    ;Nhap x
    push x
    push fmt
    call _scanf
    add esp, 8
    ;goi ham tinh x^n
    push dword [n] ;push n truoc roi toi x, thu tu tu tren xuong
    push dword [x]
    call _TinhTong
    add esp, 8
    
    ;lay kq tra ve vao s
    mov [s], eax
    ;Xuat tb3
    push dword[s]
    push dword[n]
    push dword[x]
    push tb3
    call _printf
    add esp,16
    
    call _getch
    xor eax, eax
    ret
global _TinhTong
_TinhTong:
    push ebp ;backup ebp
    mov esp,ebp
    ;khai bao stack
    sub esp, 64
    ;su dung thanh ghi nao thi backup no
    
    push ecx;backup ecx
    
    ;khoi tao
    mov eax,1
    mov ecx, [ebp + 12];vi tri cua n
_TinhTong.lap:
    mul dword[ebp+8]
    Loop _TinhTong.lap
    
    ;restore thanh ghi
   
    pop ecx
    ;xoa stack
    add esp, 64
    ;khoi phuc ebp
    mov esp,ebp
    pop ebp
    ret