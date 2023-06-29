;Viet chuong trinh nhap xuat mang 1 chieu n so nguyen

%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap n: ",0
    tb2 db "a[%d]: ",0
    tb3 db "Mang vua nhap la: ",0
    fmt1 db "%d",0
    fmt2 db "%d ",0 
section .bss
    arr resd 100
    n resd 1
section .text
global CMAIN
CMAIN:
    ;write your code here
    ;xuat tb1
    push tb1
    call _printf
    add esp, 4
    
    push n
    push fmt1
    call _scanf
    add esp, 8
    
    ;khoi tao
    mov ebx, arr   ;ebx chua dia chi arr, phai dung EBX
    mov esi,0  ;i=0
LapNhap:
    ;xuat tb2
    push esi
    push tb2
    call _printf
    add esp, 8
    ;Nhap a[i]
    push ebx
    push fmt1
    call _scanf
    add esp, 8
    ;tang dia chi mang
    add ebx,4
    ;tang i
    inc esi
    ;kt i<n thi lap
    cmp esi,[n]
    jl LapNhap
    
    ;xuat tb3
    push tb3
    call _printf
    add esp,4
    ;khoi tao
    mov ebx,arr
    mov esi,0
LapXuat:
    ;xuat a[i]
    push dword[ebx]
    push fmt2
    call _printf
    add esp,8
    ;tang dia chi mang len 4
    add ebx,4 
    ;tang i
    inc esi
    ;kt i<n thi lap
    cmp esi,[n]
    jl LapXuat
    
    
    call _getch
    xor eax, eax
    ret
Vi?t cho Gia Ðình 7Up
