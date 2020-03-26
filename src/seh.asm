[bits 32]

global _main
extern _MessageBoxA@16

section .data

a db "HEY",0
b db "HEHEY",0

section .text

_main:
push exception_code ; adding SEH record
push dword [fs:0]
mov [fs:0], esp
xor edx, edx
div edx

exception_code:
nop
mov esp, [esp+8] ; cleaning up
mov eax, [fs:0]
mov eax, [eax] ; traversing the list
mov eax, [eax]
mov [fs:0], eax
add esp,8 
push 0x40
push a
push b
push 0
call _MessageBoxA@16
ret
