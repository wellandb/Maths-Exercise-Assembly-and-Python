; Age History

	B  main

born	DEFB "you were born in \0"
were	DEFB "you were \0"
in	DEFB " in \0"
are	DEFB "you are \0"
this	DEFB " this year\n\0"
	

    ALIGN

present DEFW 2005   ; present = 2005 // Change this code
birth   DEFW 1959 ; birth = 1959   // Change this code
year    DEFW 0	; year = 0       // Change this code
age     DEFW 1	; age = 1        // Change this code


main
	; this code does print "you were born in " + str(birth) // DO NOT change the instructions below (except for part 5)
	ADR R0, born
	SVC 3
	LDR R0, birth ; make sure this will work!
	SVC 4
	MOV R0, #10
	SVC 0

    LDR R0, birth
    ADD R0, R0, #1	; year = birth + 1 // Change this code
    STR R0, year

loop	; this code does print "you were " + str(age) + " in " + str(year) // DO NOT change the instructions below (except for part 5)
	ADR R0, were
	SVC 3
	LDR R0, age ; make sure this will work!
	SVC 4
	ADR R0, in
	SVC 3
	LDR R0, year ; make sure this will work!
	SVC 4
	MOV R0, #10
	SVC 0

    LDR R0, year	;   year = year + 1 //Change this code
    ADD R0, R0, #1
    STR R0, year
    
    LDR R0, age
	ADD R0, R0, #1;   age = age + 1   //Change this code
	STR R0, age; } //              //Change this code

    LDR R0, year
    LDR R1, present
    CMP R0, R1	; while year != present //{ Change this code
    BNE loop


	; this code does print "you are " + str(age) + "this year" // DO NOT change the instructions below (except for part 5)
	ADR R0, are
	SVC 3
	LDR R0, age ; make sure this will work!
	SVC 4
	ADR R0, this
	SVC 3

	SVC 2 ; stop



