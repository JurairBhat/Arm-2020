AREA     appcode, CODE, READONLY
    EXPORT __main
  ENTRY
__main  FUNCTION
   ; Program to implement log(1+x) using taylor series expansion .
   ;It is assumed that the code converges after 200 iterations .
   ;So we get the result after 200 iterations which is stored in s5
   ;///////////////
   ; These are variables which are used to execute it
    VMOV.F32 s0,#1;
    VMOV.F32 s1,#1;
    VMOV.F32 s2,#1;
    VMOV.F32 s3,#-1;
    VMOV.F32 s6,#1;
    VMOV.F32 s7,#-0.2; S7 holds the value of parameter x
    MOV r0,#1;
    MOV r1,#200; this is the no. of iterations

loop  CMP  r0,r1;
    VDIV.F32 s4,s0,s1; -1^(n+1)*1/n
    VMUL.F32 s6,s6,s7; x^(n-1)*x
    VFMA.F32 s5,s4,s6; S5 stores the result
    VADD.F32 s1,s1,s2; n = n+1
    VMUL.F32 s0,s0,s3; alternate sign change
    ADDLT r0,#1;
    BNE   loop

stop	 B stop
    ENDFUNC
    END
