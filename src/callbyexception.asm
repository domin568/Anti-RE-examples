[bits 32]

global _main
extern _MessageBoxA@16
section .data

paramTextDEBUG   DB  "Execution redirected !", 0
paramTitleDEBUG  DB  "call info", 0
paramText   DB  "Execution not redirected", 0
paramTitle  DB  "call info", 0
debug DB "SeDebugPrivilege", 0

section .text

_main:

push exception_handler
push dword [fs:0]
mov [fs:0], esp

xor eax, eax
div eax

normal_execution:
pop dword [fs:0]
add esp, 4
push 0x40
push paramTitle
push paramText
push 0
call _MessageBoxA@16
ret

exception_handler:
mov ecx, [esp + 0x0c] ; CONTEXT struct ?
lea edx, [ecx + 0xb8]
mov dword [edx], redirected_execution ; change execution by exception
ret

redirected_execution:
pop dword [fs:0]
add esp, 4
push 0x40
push paramTitleDEBUG
push paramTextDEBUG
push 0
call _MessageBoxA@16
ret

