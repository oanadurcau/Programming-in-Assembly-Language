.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
nr1 dd 0
nr2 dd 0 
rez dd 0
n1 db "nr1 = ",0
n2 db "nr2 = ",0
format db "%d",0
msg_sum DB "Suma numerelor este %d ",13,10,0

.code
start:
	;aici se scrie codul
	push offset n1
	call printf
	add esp, 4
	
	push offset nr1
	push offset format
	call scanf 
	add esp, 8
	
	push offset n2
	call printf
	add esp, 4
	
	push offset nr2
	push offset format
	call scanf 
	add esp, 8
	
	
	mov eax, nr1
	add eax, nr2
	mov rez, eax
	
	push rez
	push offset msg_sum
	call printf
	add esp, 8

	;terminarea programului
	push 0
	call exit
end start
