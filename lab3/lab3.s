	B part3 ; part1 or part2 or part3

buffer	DEFS 100,0

s1	DEFB "one\0"
	ALIGN
s2	DEFB "two\0"
	ALIGN
s3	DEFB "three\0"
	ALIGN
s4	DEFB "four\0"
	ALIGN
s5	DEFB "five\0"
	ALIGN
s6	DEFB "six\0"
	ALIGN
s7	DEFB "seven\0"
	ALIGN
s8	DEFB "twentytwo\0"
	ALIGN
s9	DEFB "twenty\0"
	ALIGN

;************************** part 1 **************************
printstring
    LDR R0, [R1], #1
    LDR R3, 0
    CMP R0, R3
    BEQ end
    SVC 0
    B printstring
end ; your code goes here, replacing the previous 2 lines
	MOV  R0, #10	; given - output end-of-line
	SVC  0		; given
	MOV  PC, LR	; given

;************************** part 2 ***************************
strcat
; your code goes here
    LDR R0, [R1], #1
    LDR R3, 0
    CMP R0, R3
    BNE strcat
second
    LDR R1, [R2], #1
    LDR R3, 0
    CMP R1, R3
    BNE second
	MOV  PC, LR

strcpy
; your code goes here
    LDR R0, [R2], #1
    STR R0, [R1]
    LDR R3, 0
    CMP R0, R3
    BNE strcpy
	MOV  PC, LR

;************************** part 3 **************************
sorted	STR LR, return2	; given
; your code goes here
    LDR R4, [R2], #1
    LDR R6, 0
    CMP R4, R6
    BEQ return2
    LDR R5, [R3], #1
    CMP R5, R6
    BEQ exit3
    CMP R4, R5
    BNE exit3
    B sorted
exit3
    CMP R4, R5
	LDR  PC, return2 ; given
return2 DEFW 0		; given

;*********************** the various parts ********************
part1	ADR R1, s1
	BL  printstring
	ADR R1, s2
	BL  printstring
	ADR R1, s3
	BL  printstring
	ADR R1, s4
	BL  printstring
	ADR R1, s5
	BL  printstring
	ADR R1, s6
	BL  printstring
	ADR R1, s7
	BL  printstring
	ADR R1, s8
	BL  printstring
	ADR R1, s9
	BL  printstring
	SVC 2

part2	ADR R2, s1
	ADR R1, buffer
	BL  strcpy
	ADR R1, buffer
	BL  printstring
	ADR R2, s2
	ADR R1, buffer
	BL  strcat
	ADR R1, buffer
	BL  printstring
	ADR R2, s3
	ADR R1, buffer
	BL  strcat
	ADR R1, buffer
	BL  printstring
	SVC 2

; used by part3
return4 DEFW 0,0
test2	STR LR, return4		; This mechanism will be improved later
	STR R3, return4+4	; Assembler will evaluate addition	
	MOV R0, R2
	SVC 3
	BL  sorted
	MOVLT R0, #'<'		; Three-way IF using conditions
	MOVEQ R0, #'='
	MOVGT R0, #'>'
	SVC 0
	LDR R0, return4+4
	SVC 3
	MOV R0, #10
	SVC 0
	LDR PC, return4

part3	ADR R2, s1
	ADR R3, s2
	BL  test2
	ADR R2, s2
	ADR R3, s3
	BL  test2
	ADR R2, s3
	ADR R3, s4
	BL  test2
	ADR R2, s4
	ADR R3, s5
	BL  test2
	ADR R2, s5
	ADR R3, s6
	BL  test2
	ADR R2, s6
	ADR R3, s7
	BL  test2
	ADR R2, s7
	ADR R3, s8
	BL  test2
	ADR R2, s8
	ADR R3, s9
	BL  test2
	ADR R2, s8
	ADR R3, s8
	BL  test2
	SVC 2
