        Include  'VICMAIN_FOR'
c
        Subroutine  Main44
c
C  THIS IS A TEST PROGRAM FOR SUBROUTINES FOMCLV AND FOMCAV.
C  FOMCAV COMPUTES THE OMMATRIX, THE PLANET TO CAMERA TRANSFORMATION
C  MATRIX, AND THE RSVECTOR, THE PLANET TO CAMERA POSITION VECTOR
C  EXPRESSED IN THE PLANET COORDINATE SYSTEM.  FOMCAV IS ACCESSED
C  THROUGH FOMCLV, WHICH MERELY SETS UP THE RETICLE DESCRIPTIVE
C  ARRAY FROM THE INPUT ARRAYS AA AND B, AND THEN CALLS FOMCAV.
C  THE CONSTANTS FOR THE PLANET AND SPACECRAFT DESCRIPTIVE ARRAY,
C  B, REFER TO THE JUPITER MOON, IO.  
c
        Real*4     AA(4,20)
c   , A(5,20), 
        Real*4     B(6), CL, CS
        Real*8     OM(3,3), RS(3)
        Integer*4  IND, NPOINT
c 
C  PLANET AND SPACECRAFT DESCRIPTIVE ARRAY
c
        B(1) = 1500.19 * 84.821
        B(2) = 0.
	B(3) = 806061.
	B(4) = -.02
	B(5) = 155.07
	B(6) = 1815. 
c 
C  LINE/SAMPLE OF CAMERA AXIS
c      	
	CL = 500.
	CS = 500.
c
C  IMAGE POINTS (LINE, SAMPLE, LATITUTE, LONGITUDE)
c
	AA(1,1) = 381.86
        AA(2,1) = 382.64
	AA(3,1) = 19.35
	AA(4,1) = 229.21 
c
	AA(1,2) = 382.17
	AA(2,2) = 498.94
	AA(3,2) = 25.83
	AA(4,2) = 190.00
c 
	AA(1,3) = 381.98
	AA(2,3) = 615.31
	AA(3,3) = 32.86
	AA(4,3) = 163.58
c 
        NPOINT = 3
c  
        CALL QPRINT(' TEST USING THREE IMAGE POINTS',30)
	CALL QPRINT('   SETS OF LINE, SAMPLE, LAT, LONG (ARRAY AA):',46)
        CALL PRNT(7, 12, AA, '.')
        CALL QPRINT('  ',2)
c
	CALL FOMCLV(IND,NPOINT,AA,B,OM,RS,CL,CS)
	CALL PRNT(8,9,OM,' OMMATRIX = .')
	CALL PRNT(8,3,RS,' RSVECTOR = .')
        CALL PRNT(4,1,IND,' IND =.')
        CALL QPRINT('  ',2)
	CALL QPRINT(' ********************',21)
c
        CALL QPRINT('  ',2)
        AA(1,4) = 498.40
  	AA(2,4) = 498.49
	AA(3,4) = 2.539
	AA(4,4) = 179.32
c
        AA(1,5) = 498.53
        AA(2,5) = 615.11
        AA(3,5) = 8.65
        AA(4,5) = 156.13
c
        AA(1,6) = 497.52
      	AA(2,6) = 732.24
    	AA(3,6) = 15.14
	AA(4,6) = 132.25
c
  	NPOINT = 6
c   
        CALL QPRINT('  ',2)
        CALL QPRINT(' TEST USING SIX IMAGE POINTS',28)
	CALL QPRINT('   SETS OF LINE, SAMPLE, LAT, LONG (ARRAY AA):',46)
        CALL PRNT(7, 24, AA, '.')
        CALL QPRINT('  ',2)
c
	CALL FOMCLV(IND,NPOINT,AA,B,OM,RS,CL,CS)
	CALL PRNT(8,9,OM,' OMMATRIX = .')
	CALL PRNT(8,3,RS,' RSVECTOR = .')
        CALL PRNT(4,1,IND,' IND =.')
        CALL QPRINT('  ',2)
c  
  	AA(1,7) = 613.50
    	AA(2,7) = 380.84
	AA(3,7) = -26.74
	AA(4,7) = 206.78
c
 	AA(1,8) = 613.95
	AA(2,8) = 497.92
	AA(3,8) = -20.18
	AA(4,8) = 174.26
c
	AA(1,9) = 614.02
	AA(2,9) = 614.04
	AA(3,9) = -13.80
	AA(4,9) = 150.12
c
	AA(1,10) = 613.13
	AA(2,10) = 731.88
	AA(3,10) = -7.33
	AA(4,10) = 126.19
c	
	AA(1,11) = 729.89
	AA(2,11) = 496.11
	AA(3,11) = -47.37
	AA(4,11) = 172.84
c	
	AA(1,12) = 729.79
	AA(2,12) = 613.04
	AA(3,12) = -38.93
	AA(4,12) = 141.21
c
	AA(1,13) = 728.78
	AA(2,13) = 730.46
	AA(3,13) = -31.16
	AA(4,13) = 112.36
c
  	NPOINT = 13
c   
	CALL QPRINT(' ********************',21)
        CALL QPRINT('  ',2)
        CALL QPRINT(' TEST USING THIRTEEN IMAGE POINTS',33)
	CALL QPRINT('   SETS OF LINE, SAMPLE, LAT, LONG (ARRAY AA):',46)
        CALL PRNT(7, 52, AA, '.')
        CALL QPRINT('  ',2)
c
	CALL FOMCLV(IND,NPOINT,AA,B,OM,RS,CL,CS)
	CALL PRNT(8,9,OM,' OMMATRIX = .')
	CALL PRNT(8,3,RS,' RSVECTOR = .')
        CALL PRNT(4,1,IND,' IND = .')
        CALL QPRINT('  ',2)
	CALL QPRINT(' ********************',21)
        CALL QPRINT('  ',2)
c
	CALL QPRINT(' TEST ERROR RETURN (IND = 3):',29)
        CALL QPRINT('  ',2)
c
	AA(1,1) = 346
	AA(2,1) = 432
	AA(3,1) = 45
	AA(4,1) = 63
c
	AA(1,2) = 479
	AA(2,2) = 316
	AA(3,2) = 120
	AA(4,2) = 90
c	
	AA(1,3) = 723
	AA(2,3) = 529
	AA(3,3) = 80
	AA(4,3) = 62
c 
	CALL QPRINT('   SETS OF LINE, SAMPLE, LAT, LONG (ARRAY AA):',46)
        CALL PRNT(7, 12, AA, '.')
        CALL QPRINT('  ',2)
c
	NPOINT = 3
c
	CALL FOMCLV(IND,NPOINT,AA,B,OM,RS,CL,CS)
	CALL PRNT(8,9,OM,' OMMATRIX =.')
	CALL PRNT(8,3,RS,' RSVECTOR =.')
	CALL PRNT(4,1,IND,' IND = .')
c
	CALL QPRINT(' ********************',21)
        CALL QPRINT('  ',2)
        CALL ZIA(AA, 80)
	CALL QPRINT('   SETS OF LINE, SAMPLE, LAT, LONG (ARRAY AA):',46)
        CALL PRNT(7,12,AA, '.')
        CALL QPRINT('  ',2)
	CALL FOMCLV(IND,NPOINT,AA,B,OM,RS,CL,CS)
	CALL PRNT(8,9,OM,' OMMATRIX = .')
	CALL PRNT(8,3,RS,' RSVECTOR = .')
	CALL PRNT(4,1,IND,' IND = .')
c 
        Return
	End