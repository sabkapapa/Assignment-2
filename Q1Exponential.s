 	
	
	AREA appcode, CODE, READONLY

	EXPORT __main
	ENTRY

__main FUNCTION
 
	    MOV R0,#11;         We take the no. of terms n to be in Register R0.
        MOV R1,#1;          R1 register holds the counting variable say i.         
		
		VLDR.F32 S7,=3;     Keeping 'x' Value in S7.
        VLDR.F32 S8,=1;     Loading the sum of series elements s in 32 bit floating point register S8 with VLDR instruction.
        VLDR.F32 S6,=1;     Temp. Variable t to hold the intermediate values of elements in 32 bit floating point register.
        
OURLOOP CMP R1,R0;            Comparing our current count i and n. 
        BLE IfLOOP;           If i is less than n run the IfLOOP.
        B stop;               Else proceed to stop.

IfLOOP  VMUL.F32 S6,S6,S7;       Multiplying our current element with x.
        VMOV.F32 S5,R1;          Moving the value in R1 i.e. i to S5.
        VCVT.F32.U32 S5, S5;     Converting the value to floating point value.
        VDIV.F32 S6,S6,S5;       Dividing temp. variable t by i & storing it back in itself.
        VADD.F32 S8,S8,S6;       Finally adding that temp. variable to our sum and storing it in S8 only. Result is in S8.
        ADD R1,R1,#1;            Increasing the count till the desired value n.
        B OURLOOP;               Moving back to the compare step. 

stop    B stop;                  Therefore our output should be in S8.
        ENDFUNC
        END
	
	
	
	
	
	