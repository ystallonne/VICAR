C
C***************Beginning of include file***************************************
C
C		These are the default file names for the modtran inputs and
C		outputs.  Modtran will use these inputs and write the output
C		to these files, unless the user specifies otherwise. The
C		value 'null', prevents that particular output from being
C		written.
C
	CHARACTER*80 SUNDEF,REFLDEF,DIRACDEF,UFTAPXDEF
	CHARACTER*80 FULLDEF,TABDEF,PLTABDEF
C
	PARAMETER (SUNDEF='/usr/export/modtran/version3.5/sun3')
	PARAMETER (REFLDEF=
     +                  '/usr/export/modtran/version3.5/refbkg')
	PARAMETER (DIRACDEF=
     +            '/usr/export/modtran/version3.5/MOLBMP96.BIN')
	PARAMETER (UFTAPXDEF=
     +            '/usr/export/modtran/version3.5/CFCBMP96.ASC')
	PARAMETER (FULLDEF='full')
	PARAMETER (TABDEF='tab')
	PARAMETER (PLTABDEF='null')
C
C**************End of include file**********************************************
C
