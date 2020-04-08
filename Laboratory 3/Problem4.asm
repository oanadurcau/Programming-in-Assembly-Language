;Dandu-se o variabila x de tip DWORD aflata in memorie, sa se scrie un program care
;pune in registrul EAX valoarea 0 daca sii numai daca x este o putere intreaga a lui 2.
;Indiciu: 78 20 26 20 28 78 20 2D 20 31 29

.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
var DD 6

.code
start:

   mov eax, [var]
   mov ebx, eax
   dec ebx 
   and eax, ebx
   
   
	;apel functie exit
	push 0
	call exit
end start
