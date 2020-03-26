[bits 32]

global _main
extern _MessageBoxA@16

section .text

_main:

je l1 + 1 
jne l1 + 1

l1:
db 0xe8
xor eax, eax
ret
times 2 db 0x90

xor eax,eax
jz l2 + 1

l2:
db 0xe9
pop eax
ret