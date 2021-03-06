      SUBROUTINE INTRPA(ICODE,NS,BUF,I1,I2)
C SUBROUTINE USED TO FILL IN MISSING VALUES IN AN ARRAY 
C USING A LINEAR INTERPOLATION SCHEME.
C ICODE      DATA FORMAT
C   1        BYTE
C   2        INTEGER*2
C   4        INTEGER*4
C NS      IS THE NUMBER OF SAMPLES TO BE FILLED IN
C BUF     IS THE ARRAY
C I1,I2   ARE THE SAMPLE VALUES BETWEEN WHICH THE INTER-
C POLATION IS TO BE PERFORMED.
C UPON RETURN, THE ARRAY BUF WILL CONTAIN NS ELEMENTS 
C SUCH THAT BUF(1)=I1, BUF(NS)=I2, AND ALL INTERMEDIATE
C ELEMENTS ARE GENERATED BY INTERPOLATING BETWEEN I1
C AND I2.
      IMPLICIT INTEGER(A-Z)
           INTEGER*4 BUF(1)
      IF (ICODE .EQ. 1) CALL S1(ICODE,NS,BUF,I1,I2)
      IF (ICODE .EQ. 2) CALL S2(ICODE,NS,BUF,I1,I2)
      IF (ICODE .EQ. 4) CALL S4(ICODE,NS,BUF,I1,I2)
      IF (ICODE .LT. 1 .OR. ICODE .GT. 4 .OR. ICODE .EQ. 3) THEN
          CALL PRNT(4,1,ICODE,' ICODE OUT OF RANGE,ICODE=.')
      ENDIF
      RETURN
      END
      SUBROUTINE S1(ICODE,NS,BUF,I1,I2)
C     BYTE IN,BYTE OUT
      IMPLICIT INTEGER(A-Z)
      REAL*4 DY,F1,F2
      BYTE BUF(*)
      F1=I1
      F2=I2
      DY=(F2-F1)/(NS-1)
      F1=F1+0.5
      DO I=1,NS
          DN=F1                       !CONVERT NUMBER TO INTEGER
          IF (F1 .GT. 255.) DN=255
          IF (F1 .LT.  0.0) DN=0
          CALL MVE(-5,1,DN,BUF(I),1,1)!STUFF THE FULLWORD VALUE INTO A BYTE ARRAY
	                              !THE VALUES OF BUF RANGE FROM 0 TO 255
          F1=F1+DY
      ENDDO
      RETURN
      END
      SUBROUTINE S2 (ICODE,NS,BUF,I1,I2)
C     HALFWORD IN, HALFWORD OUT
      IMPLICIT INTEGER(A-Z)
      REAL*4 DY,F1,F2,MAX,MIN
      INTEGER *2 BUF(1)
      F1=I1
      F2=I2
      DY=(F2-F1)/(NS-1)
      F1=F1+0.5
      MIN=-32768.0
      MAX=32767.0
      DO I=1,NS
      IF (F1 .GT. MAX) THEN
          BUF(I)=MAX
      ELSE IF (F1 .LT. MIN) THEN
          BUF(I)=MIN
      ELSE
          BUF(I)=F1
      ENDIF
      F1=F1+DY
      ENDDO
      RETURN
      END
      SUBROUTINE S4(ICODE,NS,BUF,I1,I2)
C     FULLWORD IN, FULLWORD  OUT
      IMPLICIT INTEGER(A-Z)
      REAL*4 DY,F1,F2
      INTEGER*4 BUF(1)
      F1=I1
      F2=I2
      DY=(F2-F1)/(NS-1)
      F1=F1+0.5
      DO I=1,NS
      BUF(I)=F1
      F1=F1+DY
      ENDDO
      RETURN
      END
