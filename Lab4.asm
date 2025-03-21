; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;------------------------------------------------------------------------------------------------------------------------------------------------------------
;initialize variables/arrays
;------------------------------------------------------------------------------------------------------------------------------------------------------------

.data
array DWORD 40, 30, 100, 95, 90, 75, 82, 84, 86, 88		;array of scores

n1 BYTE "Caroline", 0  ;name variables
n2 BYTE "Constant", 0
n3 BYTE "Wyatt   ", 0
n4 BYTE "Liz     ", 0
n5 BYTE "Meg     ", 0
n6 BYTE "Sahi    ", 0
n7 BYTE "Chris   ", 0
n8 BYTE "Sarah   ", 0
n9 BYTE "Noel    ", 0
n10 BYTE "Jonothan", 0

arraynames DWORD OFFSET n1, OFFSET n2, OFFSET n3, OFFSET n4, OFFSET n5, OFFSET n6, OFFSET n7, OFFSET n8, OFFSET n9, OFFSET n10  ;set array with names in it
sum DWORD ?

.code
main proc
	mov	ecx, LENGTHOF arraynames	;setting our ecx register to our names array	
	mov eax, 0						;setting eax to a default of 0
	mov esi, 0						;setting esi to a default of 0

;------------------------------------------------------------------------------------------------------------------------------------------------------------
;print the unsorted names and their scores to the screen
;------------------------------------------------------------------------------------------------------------------------------------------------------------

PrintNamesAndScore:	
	mov edx, DWORD PTR [arraynames + esi]	  ;memoryaddress + spot in register with name (esi), (0,1,2 etc)
	call WriteString						  ;print string
	mov eax, ' '							  ;add space between name and score
	call WriteChar							  ;print space
	mov eax, array[esi]						  ;moved our scores into the eax register with esi index
	call WriteDec							  ;print scores
	call Crlf								  ;nextline
	add esi, TYPE arraynames				  ;move to next name/score
	loop PrintNamesAndScore					  ;loop back

	call WriteString
	

	mov ecx, LENGTHOF array
	mov eax, 0
	mov esi, 0
	mov ebx, 0

call Crlf

;------------------------------------------------------------------------------------------------------------------------------------------------------------
;selection sort inner/outer loop
;------------------------------------------------------------------------------------------------------------------------------------------------------------

OuterLoop:
	mov edx, esi								  ;start inner loop index at outer loop index + 1
	inc edx										  ;increase the value of edx everytime
	
InnerLoop:
	;eax -> Hold relatively bigger values
	;ebx -> Hold relatively bigger values
	;ecx -> tracking/inc index
	;edx -> Hold relatively bigger values
	;esi -> tracking index

	mov eax, array[edx * 4]						;you can also do * TYPE array, * 4 helps move us to the next index instead of pointing to partial value  -> second value into the eax
	cmp eax, array[esi * 4]						;ex: comp 30 and 40		
	jnae NotSmaller								;returns true/false depending on if they need to be switched -> jump not greater/equal to
	call SwapValues

;------------------------------------------------------------------------------------------------------------------------------------------------------------
;If value being compared is not smaller 
;------------------------------------------------------------------------------------------------------------------------------------------------------------

NotSmaller:
	inc edx						;moves up an index
	cmp edx, LENGTHOF array
	jl InnerLoop

	inc esi
	cmp esi, LENGTHOF array
	jle OuterLoop

	mov ecx, LENGTHOF array
	mov eax, 0
	mov esi, 0
	mov ebx, 0
	mov edx, 0

;------------------------------------------------------------------------------------------------------------------------------------------------------------
;print sorted list of names/scores
;------------------------------------------------------------------------------------------------------------------------------------------------------------

PrintNamesAndScores2:
	mov edx, DWORD PTR [arraynames + esi]	  ;memoryaddress + spot in register with name (esi), (0,1,2 etc)
	call WriteString						  ;print string
	mov eax, ' '							  ;add space between name and score
	call WriteChar							  ;print space
	mov eax, array[esi]						  ;moved our scores into the eax register with esi index
	call WriteDec							  ;print scores
	call Crlf								  ;nextline
	add esi, TYPE arraynames				  ;move to next name/score
	loop PrintNamesAndScores2				  ;loop back

	mov ecx, LENGTHOF array
	mov eax, 0
	mov esi, 0
	mov ebx, 0
	call Crlf

;------------------------------------------------------------------------------------------------------------------------------------------------------------
;if value being compared is smaller/needs to be swaped
;------------------------------------------------------------------------------------------------------------------------------------------------------------

SwapValues PROC		;procedure
	mov eax, array[esi * 4]
	mov ecx, array[edx * 4]
	mov array[esi * 4], ecx
	mov array[edx * 4], eax
	mov eax, 0
	mov ecx, 0

	mov eax, arraynames[esi * 4]
	mov ecx, arraynames[edx * 4]
	mov arraynames[esi * 4], ecx
	mov arraynames[edx * 4], eax
	mov eax, 0
	mov ecx, 0
		
	ret										;return
	SwapValues ENDP							;end procedure
	
	cmp esi, LENGTHOF array					;if inner loop index reaches the end of the array, exit inner loop
	mov ecx, esi							;move ecx
											;mov ecx, edx
	mov eax, array[esi]						;mov eax, array[esi]
	mov edx, array[ecx]						;mov ebx, array[ecx]
	cmp eax, edx							;compare array[esi] with array[ecx]
	mov esi, ecx							;update minimum index to current index ?

;------------------------------------------------------------------------------------------------------------------------------------------------------------
;sort the grades based off of how many As, Bs, Cs, etc. print 34210
;------------------------------------------------------------------------------------------------------------------------------------------------------------

SelectionGradeSort: cmp esi, LENGTHOF array * 4			;keeps track of the number of each letter grade
je EndLoop

mov ebx, array[esi]
	add esi, TYPE array
	cmp ebx, 90
	jae IfScoreGreaterEqual90
	cmp ebx, 80
	jae IfScoreGreaterEqual80
	cmp ebx, 70
	jae IfScoreGreaterEqual70
	cmp ebx, 60
	jae IfScoreGreaterEqual60
	jb IfScoreLess60
	

IfScoreGreaterEqual90: add eax, 10000
	cmp esi, LENGTHOF array * 4
	jl SelectionGradeSort

IfScoreGreaterEqual80: add eax, 1000
	cmp esi, LENGTHOF array * 4
	jl SelectionGradeSort

IfScoreGreaterEqual70: add eax, 100
	cmp esi, LENGTHOF array * 4
	jl SelectionGradeSort

IfScoreGreaterEqual60: add eax, 10
	cmp esi, LENGTHOF array * 4
	jl SelectionGradeSort

IfScoreLess60: add eax, 1
	cmp esi, LENGTHOF array * 4
	jl SelectionGradeSort

EndLoop:
	sub eax, 11111
	call WriteDec 
	call Crlf
	call Crlf

	mov ecx, LENGTHOF array
	mov eax, 0
	mov ebx, 0
	mov esi, 0
	
invoke ExitProcess,0
main endp
end main