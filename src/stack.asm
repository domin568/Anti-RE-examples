[bits 32]

global _main
extern _MessageBoxA@16

section .text

_main:

sub esp, 8
sub esp, 4
cmp esp, 0x1000
jb l1
add esp, 4
jmp l2

l1:
sub esp, 0x100

l2:
mov dword [esp], 0xbeefc0de
mov dword [esp+4], 0xc0dec0de
pop eax
pop ecx 
ret