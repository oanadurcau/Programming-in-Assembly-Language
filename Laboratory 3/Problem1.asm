;EAX = 7*EAX - 2*EBX - EBX/8

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

	mov eax, 10  ; eax = 10
	mov ebx, 8   ; ebx = 8
	
	mov ecx, 7   ; ecx = 7	
	
	mul ecx      ; eax = eax * ecx = 70
	
	mov ecx, eax    ; ecx = 70
	
	mov eax, ebx    ; eax = ebx => eax = 8
	
	mov edx, 2     ; edx = 2
	
	mul edx        ; eax = eax * 2   => eax = 16;
	
	sub ecx, eax        ; ecx = ecx - eax   => ecx = 70 - 16 = 54;
	
	mov eax,ebx        ; eax = ebx  => eax = 8; 

	mov edx, 0
	
	mov ebx, 8       ; ebx = 8 
      
	div ebx	        ; eax = eax/8 => eax = 1; 

	sub ecx, eax      ;ecx = ecx - eax  => ecx = 53;
	
	;apel functie exit
	push 0
	call exit
end start
