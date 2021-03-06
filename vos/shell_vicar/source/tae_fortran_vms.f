C
C       FORTRAN INTERFACE TO RUNTIME LIBRARY
C
        SUBROUTINE XZSINIT(PARB, DIM, STDLUN, MODE, STATUS)

        INTEGER PARB(1)
        INTEGER DIM
        INTEGER STDLUN
        INTEGER MODE
        INTEGER STATUS

        CHARACTER*1024 COMMAND
        CHARACTER*8192 CMDLINE
	DATA COMMAND /'-----'/

        CALL XZARGINIT(COMMAND,CMDLINE)

        CALL XZPARBINIT(PARB,COMMAND,CMDLINE)

        STATUS = 1
        RETURN
        END
C
C
      SUBROUTINE XZARGINIT(COMMAND,CMDLINE)
      CHARACTER*(*) COMMAND,CMDLINE
      INTEGER MAXLEN
      CHARACTER*1024 NEXTARG
      INTEGER*4 I,PROMPT_FLAG,SLEN,ENDP
      INTEGER*4 LIB$GET_FOREIGN
      INCLUDE '($JPIDEF)'

C--- Get the name of the proc:
      I = LIB$GETJPI(JPI$_IMAGNAME,,,,COMMAND,SLEN)

C--- Concatenate the arguments:
      MAXLEN = LEN(CMDLINE)
      PROMPT_FLAG=0
      I=LIB$GET_FOREIGN(CMDLINE, ,SLEN,PROMPT_FLAG)
      ENDP=SLEN+1

C--- Pad with spaces:
      DO I=ENDP,MAXLEN
         CMDLINE(I:I) = ' '
      ENDDO

      RETURN
      END

