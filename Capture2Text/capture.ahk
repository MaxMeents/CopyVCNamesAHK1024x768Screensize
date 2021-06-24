clipboard :=
Run, cmd.exe /c Capture2Text_CLI.exe --screen-rect "289 255 336 291" --clipboard,, hide
clipwait, 10
msgbox, ,%clipboard%