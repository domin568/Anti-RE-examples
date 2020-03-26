[bits 32]

global _main
extern _MessageBoxA@16

section .text

_main:

; simple

db 0xeb
db 0xff
db 0xc0
db 0x48
db 0x90
db 0x90

;complex

times 3 dd 0x48c0ffeb ; COMPLEX NOP

mov eax, 0
mov cx, 0x2eb
call l2
mov ax, 0x4eb
inc eax
jne $-3
db 0xe8
db 0xc3
db 0x00
db 0x00
db 0x00
jne l2 
inc eax
add ecx, 0xc0de
and ecx, 0x0000ff00
xor eax, ecx
pop ebp
ret
times 0xae db 0x90

l2:
add cx, 0x167
ret