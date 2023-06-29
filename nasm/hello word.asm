;Viet chuong trinh Hello world
%include "io.inc"
extern _getch
section .data
    strg db "Hello world.",0 ;Neu nhap the nay thi phia sau do khong co ki tu ket thuc nen ct se xuat ki tu rac, nen gan 0 vao de kt
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    ;printf(strg);
    push strg
    call _printf ;Vao satack lay tham so de truyen vao lenh
    add esp,4 ;moi dia chi vung nho la 4byte, tang 4 byte de xoa
    call _getch
    
    xor eax, eax
    ret