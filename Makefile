#CC="/cygdrive/c/Program Files (x86)/AutoHotkey/Compiler/Ahk2Exe.exe"
CC="/cygdrive/c/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe"
PROG=bug.n

${PROG}.exe : source/Main.ahk source/images/kfm.ico
	${CC} /in source/Main.ahk /icon source/images/kfm.ico /out ${PROG}.exe

