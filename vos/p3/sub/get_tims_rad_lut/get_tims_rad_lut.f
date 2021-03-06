	SUBROUTINE GET_TIMS_RAD_LUT(IDATE,SHIFT,RAD_LUT)
C
C	Modified for Y2K compliance 10/7/1998
C
	COMMON /RAWFIL/ FILTER,WVLEN,ICALDATE
C
	REAL FILTER(158,6),WVLEN(158)
	INTEGER*2 RAD_LUT(40000,6)
	CHARACTER*100 LUTNAME,P3INC
	CHARACTER*6 CALDATE
C
	CALL GETFIL(IDATE,0)
C
	IF (SHIFT .EQ. 0.0) THEN
C						find and read in the appropriate
C						temp to radiance lookup table
	    CALL XGETENV_VIC('P3INC',P3INC)
	    WRITE (CALDATE,'(I6)') ICALDATE
	    IF (ICALDATE .LT. 10) CALDATE(1:5) = '00000'
	    IF (ICALDATE .LT. 100) CALDATE(1:4) = '0000'
	    IF (ICALDATE .LT. 1000) CALDATE(1:3) = '000'
	    IF (ICALDATE .LT. 10000) CALDATE(1:2) = '00'
	    IF (ICALDATE .LT. 100000) CALDATE(1:1) = '0'
C    
	    LUTNAME = P3INC(1:LNBLNK(P3INC)) // '/tims_rad_lut.'
     +		      // CALDATE
	    CALL XVUNIT(LUTUNIT,'CALIB',1,ISTAT,'U_NAME',LUTNAME,' ')
	    CALL XVOPEN(LUTUNIT,ISTAT,'OPEN_ACT','SA','IO_ACT','SA',' ')
	    DO ICHAN=1,6
		CALL XVREAD(LUTUNIT,RAD_LUT(1,ICHAN),ISTAT,' ')
	    END DO
	ELSE
C						LUT must be built, since a
C						wvlen shift screws everything up
	    DO I=1,158
		WVLEN(I) = WVLEN(I) + SHIFT
	    END DO
C
	    CALL XVMESSAGE('Building new radiance LUT',' ')
	    DO ICHAN=1,6
		FILTER_NORM = 0.0
		DO I=1,158
		    FILTER_NORM = FILTER_NORM + FILTER(I,ICHAN)
		END DO
C								       build LUT
		DO ITEMP=1,40000
		    TEMP = FLOAT(ITEMP)/100.0
C						  compute radiance for this temp
		    RAD = 0.0
		    DO I=1,158
			RAD = RAD+FILTER(I,ICHAN)*PLANCK(WVLEN(I),TEMP)
		    END DO
		    RAD = 1000.0*RAD/FILTER_NORM
		    IRAD = MIN(NINT(RAD),32767)
		    RAD_LUT(ITEMP,ICHAN) = IRAD
		END DO
	    END DO
	END IF
	RETURN
	END
