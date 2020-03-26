[bits 32]

global _main
extern _MessageBoxA@16

section .text

_main:

call $+5
add dword [esp], 5
ret
push ebp
mov ebp, esp
mov eax, 0xbeefc0de
pop ebp
ret