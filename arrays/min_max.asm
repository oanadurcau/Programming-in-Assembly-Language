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
sir dd 10,12,0,1, -1, 23
lung dd  ($-sir)/4
mesaj db "Minimul este %d si maximul este %d", 0
min dd 0
max dd 0 



.code
start:
	;aici se scrie codul
	mov esi, 0
	mov eax, sir[esi]
	mov min, eax
	mov max, eax 
	mov eax, 0
	inc esi
	
	
	loop1:
	mov eax, max
	cmp eax, sir[esi*4]
	jge next1   ;daca max >= sir[esi*4] sarim peste pasii de inlocuire
	mov eax, sir[esi*4]
	mov max, eax
	
	next1:
	mov eax ,min
	cmp eax, sir[esi*4]
	jle next2	  ;daca min <= sir[esi*4] sarim peste pasii de inloc
	mov eax, sir[esi*4]
	mov min, eax
	
    next2:
	inc esi 
	cmp esi, lung 
	jl loop1
	

	push max
	push min
	push offset mesaj 
	call printf 
	add esp, 8
	
	;terminarea programului
	final:
	push 0
	call exit
end start
