#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv
#SingleInstance, Force
#InstallKeybdHook
#MaxHotkeysPerInterval, 5000
#UseHook, On
global pclipboard :=
f2::reload
^y::
TakePictures:
gui, destroy
InputBox, Cnum, About How many Characters do you have by multiple of 10?20,30,..110? Its ok if you guess to high but not to low...
Cnum := Cnum/10
Loop, %Cnum%
{
a := 130
Loop, 11
{
mousemove, %a%,655
click down
sleep, 20
click up
mousemove, %a%,655
click down
sleep, 20
click up
mousemove, %a%,655
click down
sleep, 20
click up
sleep, 50
pclipboard := clipboard
clipboard :=
run, cmd.exe /c %a_scriptdir%\Capture2Text\Capture2Text_CLI.exe --scale-factor "5" --screen-rect "116 101 331 139"  --clipboard,, hide
clipwait, 5
if(pclipboard == clipboard){
;throwerror
}else{
	
	FileRead, content, %A_ScriptDir%\Character List.txt
	if(NOT InStr(content, Clipboard)){
    	FileAppend, %clipboard%, %A_ScriptDir%\Character List.txt
    }
	;FileAppend, Account: %accountNum% - %clipboard%, %A_ScriptDir%\Main Database.txt
	;FileAppend, %clipboard%, %A_ScriptDir%\Accounts\Account %accountNum%.txt
}
a+= 78
}
mousemove, 143,649
send, {wheelup 32}
}
run, %A_ScriptDir%\Character List.txt
Return