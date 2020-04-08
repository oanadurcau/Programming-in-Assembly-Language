;Instructiunea bswap (Byte Swap) inverseaza octet, ii unui registru. Daca ın EAX avem
;valoarea 12345678h, prin apelul bswap EAX, registrul va contine 78563412h.
;Implementati aceasta operatie folosind instructiuni de rotatie (rol, ror) si interschimbare (xchg).

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

.code
start:
   
   mov eax, 12345678h   ;ax = 5678h
   ror ax, 8   ;ax = 7856h
   ror eax, 16   ; eax = 78561234h
   xchg AH, AL ; eax = 78563412h
	
   
   
	;apel functie exit
	push 0
	call exit
end start
