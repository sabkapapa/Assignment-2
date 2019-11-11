 	
	
	AREA appcode, CODE, READONLY

	EXPORT __main
	ENTRY

__main FUNCTION
 
 ;Sin series :
	    
		VMOV.F32 s0,#5;      This is our angle in radians
		MOV R0,#10;          This will be our max no. of terms 
		VMOV.F32 s7,#1.0;    For our count i we take help of S7
		VMOV.F32 s1,s0;      Intermediate element value t and moved in S1
		VMOV.F32 s2,s0;      S2 will have our sum of these elements
		VMOV.F32 s6,#-1.0;   constant value used in Sin
		VMOV.F32 s8,#2.0;    constant value
		VMOV.F32 s9,#1.0;    constant value to help calculate further
		
	

ourloop	VMUL.F32 s3,s1,s6;  Multiplying t with -1
		VMUL.F32 s3,s3,s0;  Further multiplying with our x and storing in S3
		VMUL.F32 s3,s3,s0;  Basically squaring the same(t*(-1)*x*x) 
		VMUL.F32 s4,s7,s8;  For sin expansion we do i*2 and storing in S4
		VADD.F32 s5,s4,s9;  Adding 1 i.e. 2*i+1 and storing in S5
		VMUL.F32 s4,s4,s5;  Multiplying S4&S5 i.e. (2*i*(2*i+1) and storing in S4
		VDIV.F32 s1,s3,s4;  Dividing our S3 with S4 to get another intermediate value    
		VADD.F32 s2,s2,s1;  Adding our next intermediate element to sum
		VADD.F32 s7,s7,s9;  Incrementing our count by 1
		SUB R0,R0,#1;
		CMP R0,#0;
		BNE ourloop
       
	   
   ;Cos Expansion:	   Similar steps just our expression changes
		
		VMOV.F32 s0,#5;   Our angle x in radians 
		MOV R0,#10;        No of terms  
		VMOV.F32 s7,#1.0;  Count i in S2
		VMOV.F32 s1,#1.0;   Intermediate element t in S1
		VMOV.F32 s10,#1.0;  sum in S10
		
ourloop2	VMUL.F32 s3,s1,s6;    Mult. t with -1
		    VMUL.F32 s3,s3,s0;    Mult with angle x
		    VMUL.F32 s3,s3,s0;    once again i.e. squaring (t*(-1)*x*x)
		    VMUL.F32 s4,s7,s8;     To get the denominator 2*i
		    VSUB.F32 s5,s4,s9;     decreasing by 1 i.e. 2*i-1
		    VMUL.F32 s4,s4,s5;     Final denominator (2*i*(2*i-1)
		    VDIV.F32 s1,s3,s4;    We keep our intermediate element expression into t
		    VADD.F32 s10,s10,s1;  Adding to our sum 
		    VADD.F32 s7,s7,s9;    Count i is incremented 
		
		SUB R0,R0,#1;
		CMP R0,#0;               Looping again by checking if zero or not
		BNE ourloop2
		
		VDIV.F32 s11,s2,s10;      In this step we divide our Sin series by Cos series to get Tan series

stop    B stop;                  Therefore our output should be in S11.
        ENDFUNC
        END
	
	
	
	
	
	