#SingleInstance Force
#NoTrayIcon

if (!A_IsCompiled && A_ScriptName = "FileInstall_Cmds.ahk") {
	#Include %A_ScriptDir%/lib/Get_ResourceSize.ahk

	tempParams := {}
	Loop, %0% {
		param := %A_Index%
		if RegExMatch(param, "/Resources_Folder=(.*)", found)
			tempParams.Resources_Folder := found1
		ProgramValues := tempParams
	}

	FileInstall_Cmds()
}
; --------------------------------

FileInstall_Cmds() {
global ProgramValues

if !InStr(FileExist(ProgramValues.Resources_Folder ""), "D")
	FileCreateDir,% ProgramValues.Resources_Folder ""

FileGetSize, sourceFileSize, resources\changelog.txt
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\changelog.txt", ProgramValues.Resources_Folder "\changelog.txt")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\changelog.txt"

if (sourceFileSize != destFileSize)
	FileInstall, resources\changelog.txt, % ProgramValues.Resources_Folder "\changelog.txt", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\changelog.txt"
	. "`nDest: " ProgramValues.Resources_Folder "\changelog.txt"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder ""), "D")
	FileCreateDir,% ProgramValues.Resources_Folder ""

FileGetSize, sourceFileSize, resources\icon.ico
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\icon.ico", ProgramValues.Resources_Folder "\icon.ico")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\icon.ico"

if (sourceFileSize != destFileSize)
	FileInstall, resources\icon.ico, % ProgramValues.Resources_Folder "\icon.ico", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\icon.ico"
	. "`nDest: " ProgramValues.Resources_Folder "\icon.ico"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder ""), "D")
	FileCreateDir,% ProgramValues.Resources_Folder ""

FileGetSize, sourceFileSize, resources\version.txt
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\version.txt", ProgramValues.Resources_Folder "\version.txt")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\version.txt"

if (sourceFileSize != destFileSize)
	FileInstall, resources\version.txt, % ProgramValues.Resources_Folder "\version.txt", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\version.txt"
	. "`nDest: " ProgramValues.Resources_Folder "\version.txt"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay.exe
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay.exe", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay.exe")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay.exe"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay.exe, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay.exe", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay.exe"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay.exe"
	. "`nFlag: 2"

; ----------------------------

}
