;Sa se scrie un program in limbaj de asamblare care genereaza un intreg reprezentabil
;pe cuvant si il pune in locatia de memorie rez dupa formula:
;rez = AX*num1 + num2*(AX + BX)
;rez, num1 s, i num2 sunt valori reprezentate pe cuvˆant, aflate ˆın memorie.

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

num1 DW 3
num2 DW 7
rez DW 0

.code
start:
    ; rez = ax * num1 + num2 * ( ax + bx )
	mov eax, 0
	mov ebx, 0	
	mov ecx, 0
	
	mov ax, 5    ;eax = 5
	mov bx, 2    ;ebx = 2
		
	push eax     
	
	add ax, bx
	
	mov cx, num2
	mul cx      ; ax = num2*(ax+bx)
	
	add rez, ax   ; rez = num2*(ax+bx)
	
	pop eax    ; eax = 5, ax = 5

	mov cx, num1
	mul cx    ;ax = num1*ax
	
	add rez, ax
	
	;apel functie exit
	push 0
	call exit
end start
