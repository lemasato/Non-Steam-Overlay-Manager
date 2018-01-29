/*
*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*
*					Non-Steam Overlay Manager																													*
*					Use the Steam Overlay in any game																											*
*																																								*
*					https://github.com/lemasato/Non-Steam-Overlay-Manager/																					*
*																																								*	
*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*
*/

; #Warn LocalSameAsGlobal
OnExit("Exit")
#SingleInstance, Force
#Persistent
#NoEnv
SetWorkingDir, %A_ScriptDir%
FileEncoding, UTF-8
#KeyHistory 0
SetWinDelay, 0
DetectHiddenWindows, Off
ListLines, Off

if ( !A_IsCompiled && FileExist(A_ScriptDir "\resources\icon.ico") )
	Menu, Tray, Icon,% A_ScriptDir "\resources\icon.ico"

Menu,Tray,Tip,NSO Manager
Menu,Tray,NoStandard
Menu,Tray,Add,Settings,GUI_Main.Create
Menu,Tray,Add,Reload,Reload
Menu,Tray,Add,Close,Exit
Menu,Tray,Icon

GroupAdd, ScriptPID,% "ahk_pid " DllCall("GetCurrentProcessId")

Hotkey, f1, NSO_Overlay_Toggle

Start_Script()
Return

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#IfWinActive, ahk_group ScriptPID

~Space:: ; Close the SplashTextOn() window
	global SPACEBAR_WAIT

	if (SPACEBAR_WAIT) {
		SplashTextOff()
	}
Return


#IfWinActive

NSO_Overlay_Toggle:
	WinGet, activeProcess, ProcessName, A
	if activeProcess in %AllowedProcessForOverlay%
	{
		NSO_Overlay_Toggle()
		Sleep 100
	}
	else {
		Hotkey, $%A_ThisHotkey%, %A_ThisLabel%, Off
		Sleep 10
		SendInput, %A_ThisHotkey%
		Sleep 10
		ShowToolTip("This process is not allowed to toggle the NSO Overlay.`nAllowed: " AllowedProcessForOverlay)
		Hotkey, $%A_ThisHotkey%, %A_ThisLabel%, On
	}
Return

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Start_Script() {
	global ProgramValues := {}
	global ProgramSettings := {}
	global AllowedProcessForOverlay
	global OVERLAY_PID

	ProgramValues.Name 					:= "NSO Manager"
	ProgramValues.Version 				:= "0.2.1"
	ProgramValues.Branch 				:= "master" 
	ProgramValues.Github_User 			:= "lemasato"
	ProgramValues.GitHub_Repo 			:= "Non-Steam-Overlay-Manager"

	ProgramValues.GitHub 				:= "https://github.com/" ProgramValues.Github_User "/" ProgramValues.GitHub_Repo
	ProgramValues.Discord 				:= "https://discord.gg/UMxqtfC"

	ProgramValues.Local_Folder 			:= A_MyDocuments "\AutoHotkey\" ProgramValues.Name
	ProgramValues.Resources_Folder 		:= ProgramValues.Local_Folder "\resources"

	ProgramValues.NSO_Overlay 			:= ProgramValues.Resources_Folder "\NSO Overlay\NSO Overlay.exe"
	ProgramValues.Ini_File 				:= ProgramValues.Local_Folder "\Preferences.ini"
	ProgramValues.Profiles_File 		:= ProgramValues.Local_Folder "\Profiles.ini"

	ProgramValues.Updater_File 			:= ProgramValues.Local_Folder "\Updater.exe"
	ProgramValues.Temporary_Name		:= ProgramValues.Local_Folder "\Latest.exe"

	ProgramValues.Updater_Link 			:= "https://raw.githubusercontent.com/" ProgramValues.Github_User "/" ProgramValues.GitHub_Repo "/" ProgramValues.Branch "/Updater_v2.exe"

	ProgramValues.PID 					:= DllCall("GetCurrentProcessId")

	AllowedProcessForOverlay 			:= A_ScriptName ",NSO Overlay.exe"

	SetWorkingDir,% ProgramValues.Local_Folder
;	- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;	Directories Creation
	localDirs := ProgramValues.Local_Folder
	.			 "`n" ProgramValues.Resources_Folder
	Loop, Parse, localDirs,% "`n"
	{
		if (!InStr(FileExist(A_LoopField), "D")) {
			FileCreateDir, % A_LoopField
		}
	}
;	- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	FileDelete,% ProgramValues.Updater_File
;	Startup
	Tray_Refresh()
	Create_Local_File()
	Update_Local_Config()

	AssetsExtract()
	ShellMessage_Enable()

	ProgramSettings.Steam_Overlay := {}
	ProgramSettings.Steam_Overlay.Hotkey_String := Ini.Get(ProgramValues.INI_File, "Steam_Overlay", "Hotkey_String")

	UpdateCheck(0, 1)

	Menu,Tray,Icon

	;__ Get local config profiles
	params := Get_CmdLineParameters()
	for nothing, parameter in params {
		if RegExMatch(parameter, "/Profile=(.*)", match) {
			global PARAM_PROFILE
			PARAM_PROFILE := match1
			match1 := ""
		}
	}

	if (PARAM_PROFILE) { ; Running with profile param
		launcher := INI.Get(ProgramValues.Profiles_File, PARAM_PROFILE, "Launcher")
		client := INI.Get(ProgramValues.Profiles_File, PARAM_PROFILE, "Client")
		enableLauncher := INI.Get(ProgramValues.Profiles_File, PARAM_PROFILE, "Enable_Launcher")
		useNSOOverlay := INI.Get(ProgramValues.Profiles_File, PARAM_PROFILE, "Use_NSO_Overlay")
		launchParams := INI.Get(ProgramValues.Profiles_File, PARAM_PROFILE, "Launch_Parameters")

		global NSO_OVERLAY_ENABLED := useNSOOverlay

		clientExists := FileExist(client)
		launcherExists := FileExist(launcher)

		if (client && launcher && enableLauncher && clientExists && launcherExists) || (client && !enableLauncher && clientExists) { ; Profile exists and is valid
			Menu,Tray,Tip,% ProgramValues.Name "`nProfile: " PARAM_PROFILE

			if (useNSOOverlay) {
				NSO_Overlay_Run()
				overlayHotkey := INI.Get(ProgramValues.INI_File, "NSO_Overlay", "Hotkey")
				Hotkey, %overlayHotkey%, NSO_Overlay_Toggle, On
			}
			if (enableLauncher)
				NonSteam_Run(launcher, client, launchParams)
			else
				NonSteam_Run("", client, launchParams)

			ExitApp ; Exit app upon game closure
		}
		else { ; Either not a profile or locations invalid
			MsgBox, 4096,% ProgramValues.Name,% "Unable to launch the profile: " PARAM_PROFILE
			.									"`nLauncher location: " launcher
			.									"`nClient location: " client
			.									"`n`nPlease make sure locations are correct and try again."
			GUI_Main.Create()
		}
	} 
	else { ; No profile param
		GUI_Main.Create()
	}
	ExitApp ; Close upon game or GUI closure
}

; ================================================

GitHub_Link:
	Run,% ProgramValues.GitHub
Return

#Include %A_ScriptDir%/lib/
#Include CmdLineParameters.ahk
#Include Class_GUI_Main.ahk
#Include Class_INI.ahk
#Include EasyFuncs.ahk
#Include Exit.ahk
#Include FileInstall.ahk
#Include GitHubReleasesAPI.ahk
#Include Local_File.ahk
#Include NonSteam_Run.ahk
#Include NSO_Overlay.ahk
#Include Reload.ahk
#Include ShellMessage.ahk
#Include ShowToolTip.ahk
#Include SplashText.ahk
#Include TrayRefresh.ahk
#Include UpdateCheck.ahk

#Include %A_ScriptDir%/lib/third-party
#Include AddToolTip.ahk
#Include Download.ahk
#Include Get_ProcessInfos.ahk
#Include JSON.ahk

if (A_IsCompiled) {
	#Include %A_ScriptDir%/FileInstall_Cmds.ahk
	Return
}