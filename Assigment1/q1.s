AREA    fibonacci,CODE,READONLY
    EXPORT __main
    ENTRY
__main    FUNCTION
		MOV R0, #0	;first number
		MOV R1, #1	;second number
		MOV R2, #7	;COUNT It will count upto first 7 no. of fibonacci sequence
		MOV R3, #0	;initializing the register where the next value will be stored
		MOV R4, #0x20000000
				
loop1	CMP R2, #0	;checking whether the count is zero.
		BNE loop2	;branching to loop2
		BEQ stop	;branching to stop
		
loop2	SUB R2, R2, #1	;decrementing the count register
		ADD R3, R0, R1	;calculating the next value
		MOV R0, R1		;moving the second number to the first register
		MOV R1, R3		;moving the next number to the second register
		B loop1			;branching to loop1
	
stop    B stop			;loop to stop the execution
		ENDFUNC
		END

;This code will give the fibonacci series(0,1,1,2,3,5,8,13)
;The fibonacci series will be saved in the register, R3.
;I have wrote this code to give the first 10 numbers of the series