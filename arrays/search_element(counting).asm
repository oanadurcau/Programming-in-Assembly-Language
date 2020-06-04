.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
sir dd 10,12,56, 10,42, 32, 43, 54, 0
lung dd  ($-sir)/4
nr dd 10
mesaj db "Numarul %d apare de %d ori", 0

cont dd 0


.code
start:
	;aici se scrie codul
	mov esi, 0
	mov eax, nr
	
	loop1:
	cmp eax, sir[esi*4]
	jne next
	
	inc cont
	
	next:
	inc esi 
	cmp esi, lung 
	jl loop1
	
	
	push cont
	push nr
	push offset mesaj 
	call printf 
	add esp, 12
	
	;terminarea programului
	final:
	push 0
	call exit
end start
