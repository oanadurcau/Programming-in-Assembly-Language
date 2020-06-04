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
sir dd 10,12,0,1
lung dd  ($-sir)/4
mesaj db "Suma numerelor este %d", 0



.code
start:
	;aici se scrie codul
	mov eax, 0
	mov esi, 0
	
	loop1:
	add eax, sir[esi*4]
	inc esi 
	cmp esi, lung 
	jl loop1
	
	

	push eax
	push offset mesaj 
	call printf 
	add esp, 8
	
	;terminarea programului
	final:
	push 0
	call exit
end start
