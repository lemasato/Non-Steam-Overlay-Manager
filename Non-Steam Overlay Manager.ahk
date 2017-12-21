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

Menu,Tray,Tip,Non-Steam Overlay Manager
Menu,Tray,NoStandard
Menu,Tray,Add,Reload,Reload
Menu,Tray,Add,Close,Exit
Menu,Tray,Icon

GroupAdd, ScriptPID,% "ahk_pid " DllCall("GetCurrentProcessId")
GroupAdd, GameGroup, ahk_exe Overlay.exe

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


#IfWinActive, ahk_group GameGroup

ExternalOverlay_Toggle:
	ExternalOverlay_Toggle()
Return


; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Start_Script() {
	global ProgramValues := {}
	global ProgramSettings := {}
	global OVERLAY_PID

	ProgramValues.Name 					:= "Non-Steam Overlay Manager"
	ProgramValues.Version 				:= "0.1"
	ProgramValues.Branch 				:= "NSO"
	ProgramValues.Github_User 			:= "lemasato"
	ProgramValues.GitHub_Repo 			:= "Non-Steam-Overlay-Manager"

	ProgramValues.GitHub 				:= "https://github.com/" ProgramValues.Github_User "/" ProgramValues.GitHub_Repo

	ProgramValues.Local_Folder 			:= A_MyDocuments "\AutoHotkey\" ProgramValues.Name
	ProgramValues.Resources_Folder 		:= ProgramValues.Local_Folder "\resources"

	ProgramValues.External_Overlay 		:= ProgramValues.Resources_Folder "\ExternalOverlay\ExternalOverlay.exe"
	ProgramValues.Ini_File 				:= ProgramValues.Local_Folder "\Preferences.ini"
	ProgramValues.Profiles_File 		:= ProgramValues.Local_Folder "\Profiles.ini"

	ProgramValues.Updater_File 			:= ProgramValues.Local_Folder "\Updater.exe"
	ProgramValues.Temporary_Name		:= ProgramValues.Local_Folder "\Latest.exe"

	ProgramValues.Updater_Link 			:= "https://raw.githubusercontent.com/" ProgramValues.Github_User "/" ProgramValues.GitHub_Repo "/" ProgramValues.Branch "/Updater_v2.exe"

	ProgramValues.PID 					:= DllCall("GetCurrentProcessId")

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
	UpdateCheck(1, 1, 1)

	AssetsExtract()
	ShellMessage_Enable()

	ProgramSettings.Steam_Overlay := {}
	ProgramSettings.Steam_Overlay.Hotkey_String := Ini.Get(ProgramValues.INI_File, "Steam_Overlay", "Hotkey_String")

	;__ Get local config profiles
	params := Get_CmdLineParameters()
	for nothing, parameter in params {
		if RegExMatch(parameter, "/Profile=(.*)", match) {
			param_Profile := match1
			match1 := ""
		}
	}

	if (param_Profile) { ; Running with profile param
		launcher := INI.Get(ProgramValues.Profiles_File, param_Profile, "Launcher")
		client := INI.Get(ProgramValues.Profiles_File, param_Profile, "Client")
		enableLauncher := INI.Get(ProgramValues.Profiles_File, param_Profile, "Enable_Launcher")
		useExternalOverlay := INI.Get(ProgramValues.Profiles_File, param_Profile, "Use_External_Overlay")

		global EXTERNAL_OVERLAY_ENABLED := useExternalOverlay

		SplitPath, client, clientFileName
		GroupAdd, GameGroup, ahk_exe %clientFileName%

		if (client && launcher) && FileExist(client) && FileExist(launcher) { ; Profile exists and is valid
			Menu,Tray,Tip,% ProgramValues.Name "`nProfile: " param_Profile

			if (useExternalOverlay) {
				ExternalOverlay_Run()
				overlayHotkey := INI.Get(ProgramValues.INI_File, "External_Overlay", "Hotkey")
				Hotkey, %overlayHotkey%, ExternalOverlay_Toggle, On
			}
			if (enableLauncher)
				NonSteam_Run(launcher, client)
			else
				NonSteam_Run("", client)

			ExitApp ; Exit app upon game closure
		}
		else { ; Either not a profile or locations invalid
			MsgBox, 4096,% ProgramValues.Name,% "Unable to launch the profile: " param_Profile
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
#Include ExternalOverlay.ahk
#Include Exit.ahk
#Include FileInstall.ahk
#Include GitHubReleasesAPI.ahk
#Include Local_File.ahk
#Include NonSteam_Run.ahk
#Include Reload.ahk
#Include ShellMessage.ahk
#Include SplashText.ahk
#Include TrayRefresh.ahk
#Include UpdateCheck.ahk

#Include %A_ScriptDir%/lib/third-party
#Include AddToolTip.ahk
#Include JSON.ahk

if (A_IsCompiled) {
	#Include %A_ScriptDir%/FileInstall_Cmds.ahk
	Return
}