#SingleInstance Force
#NoTrayIcon

if (!A_IsCompiled && A_ScriptName = "FileInstall_Cmds.ahk") {
	#Include %A_ScriptDir%/lib/Get_ResourceSize.ahk
}

tempParams := {}
Loop, %0% {
	param := %A_Index%
	if RegExMatch(param, "/Resources_Folder=(.*)", found)
		tempParams.Resources_Folder := found1
	ProgramValues := tempParams
}

; --------------------------------
FileInstall_Cmds() {
global ProgramValues

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
	. "Source: resources\icon.ico"
	. "Dest: " ProgramValues.Resources_Folder "\icon.ico"
	. "Flag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\ExternalOverlay"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\ExternalOverlay"

FileGetSize, sourceFileSize, resources\ExternalOverlay\ExternalOverlay.exe
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\ExternalOverlay\ExternalOverlay.exe", ProgramValues.Resources_Folder "\ExternalOverlay\ExternalOverlay.exe")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\ExternalOverlay\ExternalOverlay.exe"

if (sourceFileSize != destFileSize)
	FileInstall, resources\ExternalOverlay\ExternalOverlay.exe, % ProgramValues.Resources_Folder "\ExternalOverlay\ExternalOverlay.exe", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "Source: resources\ExternalOverlay\ExternalOverlay.exe"
	. "Dest: " ProgramValues.Resources_Folder "\ExternalOverlay\ExternalOverlay.exe"
	. "Flag: 2"

; ----------------------------

}
