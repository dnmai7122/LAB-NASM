;Nhap a,b. Tong, hieu, tich, thuong theo menu
;Bo sung
; 1.Hoan thien 4 chuc nang cong tru nhan chia
; 2. Sau moi chuc nang quay ve menu
; 3. Thong bao nhap sai chuc nang neu nhap ngoai [1,5]


%include "io.inc"
extern _getch
section .data
    tb1 db "Nhap a: ",0
    tb2 db "Nhap b: ",0
    tb3 db "%d %c %d = %d",0
    tb4 db "Xin nhap lai.",0
    menu db 10,"===MENU===",10,"0.Thoat",10,"1.Tong",10,"2.Hieu",10,"3.Thuong",10,"4.Tich",10,"Nhap lua chon: ",0
    fmt db "%d",0
section .bss
    num1 resd 1
    num2 resd 1
    chon resd 1
    num3 resd 1
section .text
global CMAIN
CMAIN:
    ;write your code here
    push tb1
    call _printf
    add esp, 4
    
    ;Nhap a
    push num1
    push fmt
    call _scanf
    add esp, 8
    
    ;Xuat tb2
    push tb2
    call _printf
    add esp, 4
    
    ;Nhap b
    push num2
    push fmt
    call _scanf
    add esp, 8
Menu:    
    ;xuat menu
    push menu
    call _printf
    add esp,4
Chon:   
    ;Nhap chon
    push chon
    push fmt
    call _scanf
    add esp, 8
    
    ;Kiem tra chon
    cmp dword[chon], 1 ;lay 4 byte tai dia chi chon, [] lay gia tri 
    je Tong
    cmp dword[chon], 2
    je Hieu
    cmp dword[chon], 3
    je Thuong
    cmp dword[chon], 4
    je Tich
    cmp dword[chon],0
    je Thoat
    push tb4
    call _printf
    add esp,4
    jne Chon
    
Tong:
    mov eax, [num1]  ;eax mac dinh la lay 4byte
    add eax,[num2]    ;eax = eax + num2
    ;Xuat ket tb3
    push eax
    push dword[num2]
    push '+'
    push dword[num1]
    push tb3
    call _printf
    add esp, 20
    jne Menu
   
Hieu:
    mov eax, [num1]  ;eax mac dinh la lay 4byte
    sub eax,[num2]    
   
    push eax
    push dword[num2]
    push '-'
    push dword[num1]
    push tb3
    call _printf
    add esp, 20  
    jne Menu
 
Tich:
    mov eax, [num1]  ;eax mac dinh la lay 4byte
    imul dword[num2]
    mov [num3],eax    
   
    push dword[num3]
    push dword[num2]
    push '*'
    push dword[num1]
    push tb3
    call _printf
    add esp, 20   
    jne Menu   
Thuong:
    mov eax, [num1]  ;eax mac dinh la lay 4byte
    mov edx,0 ;xor edx,edx
    idiv dword[num2]    
    
   
    push eax
    push dword[num2]
    push '/'
    push dword[num1]
    push tb3
    call _printf
    add esp, 20     
    jne Menu   
Thoat:    
    call _getch
    xor eax, eax
    ret