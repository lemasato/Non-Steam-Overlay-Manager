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
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay"

FileGetSize, sourceFileSize, resources\NSO Overlay\UnityPlayer.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\UnityPlayer.dll", ProgramValues.Resources_Folder "\NSO Overlay\UnityPlayer.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\UnityPlayer.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\UnityPlayer.dll, % ProgramValues.Resources_Folder "\NSO Overlay\UnityPlayer.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\UnityPlayer.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\UnityPlayer.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay"

FileGetSize, sourceFileSize, resources\NSO Overlay\_BuildUnityFolder.lnk
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\_BuildUnityFolder.lnk", ProgramValues.Resources_Folder "\NSO Overlay\_BuildUnityFolder.lnk")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\_BuildUnityFolder.lnk"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\_BuildUnityFolder.lnk, % ProgramValues.Resources_Folder "\NSO Overlay\_BuildUnityFolder.lnk", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\_BuildUnityFolder.lnk"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\_BuildUnityFolder.lnk"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\app.info
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\app.info", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\app.info")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\app.info"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\app.info, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\app.info", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\app.info"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\app.info"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\boot.config
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\boot.config", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\boot.config")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\boot.config"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\boot.config, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\boot.config", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\boot.config"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\boot.config"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\data.unity3d
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\data.unity3d", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\data.unity3d")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\data.unity3d"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\data.unity3d, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\data.unity3d", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\data.unity3d"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\data.unity3d"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\Assembly-CSharp.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\Assembly-CSharp.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\Assembly-CSharp.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\Assembly-CSharp.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\Assembly-CSharp.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\Assembly-CSharp.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\Assembly-CSharp.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\Assembly-CSharp.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\Mono.Security.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\Mono.Security.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\Mono.Security.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\Mono.Security.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\Mono.Security.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\Mono.Security.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\Mono.Security.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\Mono.Security.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\mscorlib.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\mscorlib.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\mscorlib.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\mscorlib.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\mscorlib.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\mscorlib.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\mscorlib.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\mscorlib.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\System.Core.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\System.Core.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\System.Core.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\System.Core.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\System.Core.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\System.Core.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\System.Core.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\System.Core.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\System.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\System.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\System.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\System.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\System.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\System.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\System.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\System.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AccessibilityModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AIModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Analytics.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Analytics.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Analytics.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Analytics.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Analytics.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Analytics.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Analytics.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Analytics.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AnimationModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ARModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AssetBundleModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.AudioModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClothModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterInputModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ClusterRendererModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CoreModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.CrashReportingModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.DirectorModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GameCenterModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.GridModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ImageConversionModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.IMGUIModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.InputModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.JSONSerializeModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Networking.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Networking.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Networking.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Networking.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Networking.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Networking.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Networking.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Networking.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticlesLegacyModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ParticleSystemModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PerformanceReportingModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Physics2DModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.PhysicsModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.ScreenCaptureModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SharedInternalsModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpatialTracking.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpatialTracking.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpatialTracking.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpatialTracking.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpatialTracking.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpatialTracking.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpatialTracking.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpatialTracking.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteMaskModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.SpriteShapeModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StandardEvents.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StandardEvents.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StandardEvents.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StandardEvents.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StandardEvents.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StandardEvents.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StandardEvents.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StandardEvents.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.StyleSheetsModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TerrainPhysicsModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TextRenderingModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.TilemapModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Timeline.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Timeline.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Timeline.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Timeline.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Timeline.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Timeline.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Timeline.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.Timeline.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UI.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UI.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UI.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UI.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UI.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UI.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UI.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UI.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIElementsModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UIModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UNETModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityAnalyticsModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityConnectModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestAudioModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestTextureModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.UnityWebRequestWWWModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VehiclesModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VideoModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.VRModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WebModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Managed\UnityEngine.WindModule.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\mono.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\mono.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\mono.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\mono.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\mono.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\mono.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\mono.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\mono.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\MonoPosixHelper.dll
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\MonoPosixHelper.dll", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\MonoPosixHelper.dll")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\MonoPosixHelper.dll"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\MonoPosixHelper.dll, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\MonoPosixHelper.dll", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\MonoPosixHelper.dll"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\EmbedRuntime\MonoPosixHelper.dll"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\browscap.ini
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\browscap.ini", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\browscap.ini")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\browscap.ini"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\browscap.ini, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\browscap.ini", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\browscap.ini"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\browscap.ini"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\config
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\config", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\config")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\config"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\config, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\config", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\config"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\config"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\DefaultWsdlHelpGenerator.aspx
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\DefaultWsdlHelpGenerator.aspx", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\DefaultWsdlHelpGenerator.aspx")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\DefaultWsdlHelpGenerator.aspx"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\DefaultWsdlHelpGenerator.aspx, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\DefaultWsdlHelpGenerator.aspx", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\DefaultWsdlHelpGenerator.aspx"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\DefaultWsdlHelpGenerator.aspx"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\machine.config
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\machine.config", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\machine.config")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\machine.config"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\machine.config, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\machine.config", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\machine.config"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\1.0\machine.config"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\DefaultWsdlHelpGenerator.aspx
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\DefaultWsdlHelpGenerator.aspx", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\DefaultWsdlHelpGenerator.aspx")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\DefaultWsdlHelpGenerator.aspx"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\DefaultWsdlHelpGenerator.aspx, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\DefaultWsdlHelpGenerator.aspx", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\DefaultWsdlHelpGenerator.aspx"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\DefaultWsdlHelpGenerator.aspx"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\machine.config
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\machine.config", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\machine.config")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\machine.config"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\machine.config, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\machine.config", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\machine.config"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\machine.config"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\settings.map
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\settings.map", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\settings.map")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\settings.map"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\settings.map, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\settings.map", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\settings.map"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\settings.map"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\web.config
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\web.config", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\web.config")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\web.config"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\web.config, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\web.config", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\web.config"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\web.config"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers\Compat.browser
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers\Compat.browser", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers\Compat.browser")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers\Compat.browser"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers\Compat.browser, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers\Compat.browser", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers\Compat.browser"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\2.0\Browsers\Compat.browser"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig\config.xml
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig\config.xml", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig\config.xml")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig\config.xml"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig\config.xml, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig\config.xml", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig\config.xml"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Mono\etc\mono\mconfig\config.xml"
	. "`nFlag: 2"

; ----------------------------
if !InStr(FileExist(ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Resources"), "D")
	FileCreateDir,% ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Resources"

FileGetSize, sourceFileSize, resources\NSO Overlay\NSO Overlay_Data\Resources\unity default resources
if (A_IsCompiled)
	destFileSize := Get_ResourceSize("resources\NSO Overlay\NSO Overlay_Data\Resources\unity default resources", ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Resources\unity default resources")
else FileGetSize, destFileSize, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Resources\unity default resources"

if (sourceFileSize != destFileSize)
	FileInstall, resources\NSO Overlay\NSO Overlay_Data\Resources\unity default resources, % ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Resources\unity default resources", 1
if (ErrorLevel)
	Msgbox % "Failed to extract file!"
	. "`nSource: resources\NSO Overlay\NSO Overlay_Data\Resources\unity default resources"
	. "`nDest: " ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay_Data\Resources\unity default resources"
	. "`nFlag: 2"

; ----------------------------

}
