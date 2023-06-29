%include "io.inc"

extern _getch

section .data
    tb1 db 10,"===== MENU =====",10,"1. Nhap mang",10,"2. Xuat mang",10,"3. Liet ke cac so nguyen to",10,"4. Liet ke cac so hoan thien",10,"5. Dem so luong so chinh phuong",10,"6. Tinh tong cac so doi xung",10,"7. Tim gia tri lon nhat",10,"8. Sap xep mang tang dan",10,"9. Thoat",10,"========>Vui long nhap lua chon: ",0
    tb2 db "Nhap so phan tu mang n: ",0
    tb3 db "a[%d]: ",0
    tb4 db "Mang vua nhap la: ",0
    tb5 db "Cac so nguyen to la: ",0
    tb6 db "Cac so hoan thien la: ",0
    tb7 db "Dem so luong so chinh phuong: ",0
    tb8 db "Tong cac so doi xung la: ",0
    tb9 db "Gia tri lon nhat la: ",0
    tb10 db "Sap xep tang dan: ",0
    fmt1 db "%d",0
    fmt2 db "%d ",0
    fmt3 db "%d",0
section .bss
    n resd 1
    lc resd 1
    arr resd 100 
section .text
global CMAIN
CMAIN:
   
    ;write your code here
    push n
    push arr
    call _NhapMang
    add esp, 8
Menu:
    ;Xuat tb1
    push tb1
    call _printf
    add esp, 4
    
    ;Nhap lua chon
    push lc
    push fmt3
    call _scanf
    add esp, 8
    
    mov eax, [lc]
    cmp eax, 1
    je LC1
    cmp eax, 2
    je LC2
    cmp eax, 3
    je LC3
    cmp eax, 4
    je LC4
    cmp eax, 5
    je LC5
    cmp eax, 6
    je LC6
    cmp eax, 7
    je LC7
    cmp eax, 8
    je LC8
    cmp eax, 9
    je KetThuc
    
    jmp KetThuc
LC1: 
    push n
    push arr
    call _NhapMang
    add esp, 8
    
    jmp Menu
LC2:
    ;Xuat tb4
    push tb4
    call _printf
    add esp, 4
    
    ;Goi ham xuat mang
    push dword[n]
    push arr
    call _XuatMang
    add esp, 8
    
    jmp Menu
LC3:
    ;Xuat tb5
    push tb5
    call _printf
    add esp, 4
    
    ;Goi ham xuat SNT
    push n
    push arr
    call _XuatSNT
    add esp, 8
    
    jmp Menu
LC4:
    ;Xuat tb6
    push tb6
    call _printf
    add esp, 4
    
    push n
    push arr
    call _XuatSHT
    add esp, 8
    
    jmp Menu
LC5:
    push tb7
    call _printf
    add esp, 4
    
    push n
    push arr
    call _DemSCP
    add esp, 8
    
    jmp Menu
LC6:
    push tb8
    call _printf
    add esp, 4 
    
    push n
    push arr
    call _TongDX
    add esp, 8
    
    jmp Menu
LC7:
    push tb9
    call _printf
    add esp, 4 
    
    push n
    push arr
    call _TimMax
    add esp, 8
    
    jmp Menu
LC8:
    push tb10
    call _printf
    add esp, 4
    
    push n
    push arr
    call _SXTangDan
    add esp, 8
    
    jmp Menu
    
global _NhapMang
_NhapMang:
    ;Dau thu tuc
    push ebp
    mov ebp, esp
    sub esp, 64
    
    ;Tham so arr [ebp+8]
    ;Tham so n [ebp+12]
    mov eax, [ebp + 12];eax=dia chi n
    
    ;Than thu tuc
    ;backup eax
    push eax
    push tb2
    call _printf
    add esp, 4
    ;restore eax
    pop eax
    
    ;Nhap n
    push eax
    push eax
    push fmt1
    call _scanf
    add esp, 8
    pop eax
    
    mov ebx, [ebp + 8];Khoi tao arr
    mov esi, 0;i=0
_NhapMang.LapNhap:
    push eax
    push esi
    push tb3
    call _printf
    add esp, 8
    pop eax
    
    push eax
    push ebx
    push fmt1
    call _scanf
    add esp, 8
    pop eax
    
    ;Tang dia chi mang
    add ebx, 4
    ;i++
    inc esi
    ;Neu i<n thi lap nhap mang
    cmp esi, [eax]
    jl _NhapMang.LapNhap
    
    ;Cuoi thu tuc
    add esp, 64
    mov esp, ebp
    pop ebp
    
    xor eax, eax
    ret
    
global _XuatMang
_XuatMang:
    ;Dau thu tuc
    push ebp
    mov ebp, esp
    sub esp, 64
    
    mov eax, [ebp + 12]
    
    mov ebx, [ebp + 8]
    mov esi, 0 ;i=0
_XuatMang.Lap:
    push eax
    push dword[ebx]
    push fmt2
    call _printf
    add esp, 8
    pop eax
    
    add ebx, 4
    
    inc esi
    
    cmp esi, eax
    jl _XuatMang.Lap
    
    ;Cuoi thu tuc
    add esp, 64
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
global _XuatSNT
_XuatSNT:
    push ebp
    mov ebp, esp
    sub esp, 64
    
    mov eax, [ebp + 12]
    
    
    mov ebx, [ebp + 8]
    mov esi, 0
_XuatSNT.Lap:
    mov edi, 1 ; i=1
    mov ecx, 0 ; biem dem=0
SNT:
    xor edx, edx
    mov eax, [ebx]
    idiv edi
    
    cmp edx, 0 
    je SNT1
    jmp SNT.Tangi
SNT1:
    inc ecx
SNT.Tangi:
    inc edi 
    cmp edi, [ebx]
    jle SNT
    
    cmp ecx, 2
    jne KiemTraSNT
    
    push eax
    push dword[ebx]
    push fmt2
    call _printf
    add esp, 8
    pop eax
KiemTraSNT:
    ;Tang dia chi mang
    add ebx, 4
    ;Tang dia chi i
    inc esi
    
    mov eax, [ebp + 12]
    cmp esi, [eax]
    jl _XuatSNT.Lap
    
    ;Cuoi thu tuc
    add esp, 64
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
;Ham so hoan thien
global _XuatSHT
_XuatSHT:
    push ebp
    mov ebp, esp
    sub esp, 64
    
    mov eax,[ebp + 12]
    
    mov ebx, [ebp + 8]
    mov esi, 0
_XuatSHT.Lap:
    mov edi,1
    mov ecx,0
SHT:
    mov eax,[ebx]
    cmp eax,1
    je KiemTraSHT
    xor edx, edx
    idiv edi
    
    cmp edx, 0
    
    je SHT.Tong
    jmp SHT.Tangi
SHT.Tong:
    add ecx, edi
SHT.Tangi:
    inc edi
    cmp edi, [ebx]
    jl SHT
    
    cmp ecx, [ebx]
    jne KiemTraSHT;TH khong la SHT
    
    ;TH:La SHT
    push eax
    push dword[ebx]
    push fmt2
    call _printf
    add esp, 8
    pop eax
KiemTraSHT:
    add ebx, 4
    inc esi
    
    mov eax, [ebp + 12]
    cmp esi, [eax]
    jl _XuatSHT.Lap
    
    add esp, 64
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
    
;Ham dem so chinh phuong
global _DemSCP
_DemSCP:
    push ebp
    mov ebp, esp
    sub esp, 64
    
    mov eax, [ebp + 12]
    
    
    mov ebx, [ebp+8]
    mov esi, 0 ;i=0
    mov ecx, 0 ;dem=0
_DemSCP.Lap:
    mov edi, 1;i=1
SCP:
    xor edx, edx
    mov eax, [ebx];eax=n
    idiv edi
    imul eax ;eax=eax*eax
    cmp eax, [ebx] ;so sanh eax voi n
    jne SCP.Tangi
    
    inc ecx ;dem++
    jmp KiemTraSCP
SCP.Tangi:
    inc edi ;i++
    cmp edi, [ebx]
    jle SCP
KiemTraSCP:
    add ebx, 4
    inc esi
    
    mov eax, [ebp + 12]
    cmp esi, [eax]
    jl _DemSCP.Lap    
    
    ;Xuat
    push ecx
    push fmt3
    call _printf
    add esp, 8
    
    ;Cuoi thu tuc
    add esp, 64
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
;Ham Tong cac so doi xung
global _TongDX
_TongDX:
    ;Dau thu tuc
    push ebp
    mov ebp, esp
    sub esp, 64
    
    mov eax, [ebp + 12]
    
    mov ebx, [ebp + 8]
    mov esi, 0
    mov [ebp + 16], esi
    mov ecx, 0
    mov [ebp + 20], ecx
    mov ebp,0
_TongDX.Lap:
    ;nguoc chuoi
    mov esp, 0 ;gan chuoi dao nguoc bang 0
    mov ecx, [ebx]
    mov esi, 0
    mov edi, 0 ;dem=0
SDX: 
    xor edx, edx
    mov eax, ecx
    
    idiv esi ;eax=eax/esi
    
    imul esp, esi ;ebx=ebx*10
    add esp, edx
    
    mov ecx, eax
    inc edi ;i++
    cmp ecx, 0
    jne SDX
    
    cmp esp, [ebx]
    jne KiemTraSDX
    
    cmp edi, 3
    jl KiemTraSDX
    
    mov ecx, [ebp + 20]
    add ecx, [ebx]
    mov [ebp + 20], ecx
    
SDX.Tangi:
    inc ebx ; ebx++
    cmp esp, [ebx]
    jle SDX
    
KiemTraSDX:
    add ebx, 4
    mov esi, [ebp + 16]
    inc esi
    mov [ebp + 16], esi
    
    mov eax, [ebp + 12]; gan n=eax
    cmp esi, [eax]
    jl _TongDX.Lap
    
    mov ecx, [ebp + 20]
    push ecx
    push fmt3
    call _printf
    add esp, 8
    
    ;Cuoi thu tuc
    add esp, 64
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
;Ham Tim Max
global _TimMax
_TimMax:
    ;Dau thu tuc
    push ebp
    mov ebp, esp
    sub esp, 64
    
    mov eax, [ebp + 12]
    
    mov ebx, [ebp + 8];ebx=dia chi mang
    mov esi, 0 ;i=0
    mov ecx, [ebx]
_TimMax.Lap:
    mov edi, [ebx + 4]
    cmp edi, ecx
    jg Max
    jmp Max.Tangi
    
Max:
    mov ecx, edi
Max.Tangi:
    add ebx, 4 ;Tang dia chi mang
    
    inc esi;Tang i
    
    ;Neu i<n thi lap
    mov eax, [ebp + 12]
    cmp esi, [eax]
    jl _TimMax.Lap
    
    push ecx
    push fmt3
    call _printf
    add esp, 8
    
    ;Cuoi thu tuc
    add esp, 64
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
    
;Ham sap xep tang dan
;Ham sap xep tang dan
global _SXTangDan
_SXTangDan:
    ;Dau thu tuc
    push ebp
    mov ebp, esp
    sub esp, 64
    
    mov eax, [ebp + 12]
    
    ;khoi tao vong lap
    mov ebx, [ebp + 8]
    mov edi, [ebp + 8]
    mov esi, 0;i=0
_SXTangDan.Lap1:
    mov eax, esi
    inc eax
    mov esp, eax
_SXTangDan.Lap2:

HoanVi:
    push ecx
    push fmt3
    call _printf
    add esp, 8
    
    ;Cuoi thu tuc
    add esp, 64
    mov esp, ebp
    pop ebp
    xor eax, eax
    ret
KetThuc:
    call _getch
    xor eax,eax
    ret


    