@echo off
setlocal enabledelayedexpansion
set cwd=%~dp0

:TOC
set toc_interface=90207
set toc_author=Vladinator ^(Vladinator-TarrenMill^), Aspyr ^(Aspyrox-Skullcrusher^) and Isak ^(Isak-Sargeras^)
set toc_addon=RaiderIO

:DB
for %%r in (

	"EU	Europe"
	"KR	Korea"
	"TW	Taiwan"
	"US	Americas"

) do (

	set r=%%r
	set r1=!r:~1,2!
	set r2=!r:~4,-1!

	set lr=!r1!
	call :LoCase lr
	call :UnScor lr

	for %%t in (

		"M	Mythic Plus"
		"R	Raiding"
		"F	Recruitment"

	) do (

		set t=%%t
		set t1=!t:~1,1!
		set t2=!t:~3,-1!

		set lt=!t2!
		call :LoCase lt
		call :UnScor lt

		set db1=db_!lt!_!lr!_characters.lua
		set db2=db_!lt!_!lr!_lookup.lua

		if exist "!cwd!\!db1!" (

			set d=RaiderIO_DB_!r1!_!t1!
			set f=!d!\!d!.toc

			set ad="!cwd!\!d!"
			set af="!cwd!\!f!"

			rmdir /s /q !ad!
			mkdir !ad!

			echo ## Interface: !toc_interface!>!af!
			echo ## Title: Raider.IO ^|cffFFFFFF!t2!^|r ^(!r2!^)>>!af!
			echo ## Author: !toc_author!>>!af!
			echo ## Dependencies: !toc_addon!>>!af!
			echo ## DefaultState: enabled>>!af!
			echo ## X-Type: !t2!>>!af!
			echo ## X-Region: !r2!>>!af!
			echo ## X-Faction: Both>>!af!
			echo ## X-Website: https:^/^/raider.io>>!af!
			echo ../!toc_addon!/db/!db1!>>!af!
			echo ../!toc_addon!/db/!db2!>>!af!

		)

	)

)

:GoToEnd
GOTO:End

REM http://www.robvanderwoude.com/battech_convertcase.php
:LoCase
:: Subroutine to convert a variable VALUE to all lower case.
:: The argument for this subroutine is the variable NAME.
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") DO CALL SET "%1=%%%1:%%~i%%"
GOTO:EOF

:UnScor
:: Subroutine to convert spaces into empty strings.
:: The argument for this subroutine is the variable NAME.
FOR %%i IN (" =") DO CALL SET "%1=%%%1:%%~i%%"
GOTO:EOF

:End
REM pause
