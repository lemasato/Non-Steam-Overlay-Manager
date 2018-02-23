/*	
    Download the attached file.
    (Do NOT rename it in any way! It HAS to be named ApplicationFrameHost.exe)

    Run NSO Manager and set up a profile that uses this file as "Client location".

    Make sure that you have both "Use NSO Overlay" and "NSO Overlay shortcut" enabled and set.
    Also make sure that the "Launcher location" checkbox is unticked.

    Add NSO Manager to Steam as you would normally and run it.

    A dialog will appear. It allows to choose if this side-tool should be closing on game closure.
    "Do nothing" means it will run in the background and will have to be closed manually.
	
	; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	Changelogs:
		v0.1:	Initial release
*/

#SingleInstance, Force
#Persistent
#NoEnv
SetWorkingDir, A_ScriptDir
DetectHiddenWindows, On

Start_Script()
Return

Start_Script() {
	global PROGRAM := {}
	global PARAM_GAME = ""
	global CompatibleGamesList := ""

	; Program values
	PROGRAM.NAME 					:= "NSO Manager - WinStore Apps workaround"
	PROGRAM.VERSION 				:= "0.1"

	SplitPath, A_ScriptName, , , , ScriptFileName
	PROGRAM.INI_FILE 				:= A_ScriptDir "\" ScriptFileName ".ini"
	PROGRAM.INI_FILE_NAME 			:= ScriptFileName ".ini"

	; Tray menu
	Menu,Tray,Tip,% PROGRAM.NAME " (" PROGRAM.VERSION ")"
	Menu,Tray,NoStandard
	Menu,Tray,Add,Close,Exit

	; Creating the game arr
	PROGRAM.GAME_EXECUTABLES := {Forza_Horizon_3:"forza_x64_release_final.exe"
		,Sea_of_Thieves:"SoTGame.exe"
		,Zoo_Tycoon_Ultimate_Animal_Collection:"MSTycoon.final.exe"}
	
	; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	; Get RT params
	cmdLineParameters := Get_CmdLineParameters()
	for nothing, parameter in cmdLineParameters {
		if RegExMatch(parameter, "/Game=(.*)", match) {
			
			PARAM_GAME := match1
			match1 := ""
		}
	}

	Set_GameIniSettings() ; Set default settings

	if (!PARAM_GAME) { ; If no game param, ask the user to choose
		PARAM_GAME := Gui_SelectGame()
	}

	Menu,Tray,Tip,NSO Manager - WinStore Apps workaround (v0.1)`n%PARAM_GAME%

	if (PARAM_GAME != "Manual") { ; Run game and wait til it exits to close script automatically
		gameShortcut := Get_GameShortcut(PARAM_GAME)
		gameExecutable := Get_GameExecutable(PARAM_GAME)
		existingInstances := GetExistingInstances(gameExecutable)
		Run,% gameShortcut
		Loop {
			gamePID := WaitNewInstance(gameExecutable, existingInstances)
			if (gamePID) {
				Break
			}
			Sleep 500
		}
		WinWaitClose, ahk_pid %gamePID%
		ExitApp
	}
}

Gui_SelectGame() {
	static
	global PROGRAM

	gameList := "Do nothing, close manually"
	for gameName, gameExe in PROGRAM.GAME_EXECUTABLES {
		gameList .= "|" gameName " (" gameExe ")"
	}

	Gui, SelectGame:Destroy
	Gui, SelectGame:New, +AlwaysOnTop  +SysMenu -MinimizeBox -MaximizeBox +LabelGui_SelectGame_ +hwndhGuiSelectGame,% PROGRAM.NAME
	Gui, SelectGame:Font, S10, Segoe UI

	Gui, SelectGame:Add, Text,x5 y5 w500 Center,% "No /Game=""game name"" parameter detected."
	. "`n`nYou can choose to leave this app running in the background"
	. "`nor make it close automatically on game closure."
	Gui, SelectGame:Add, DropDownList, x5 y+10 w415 R10 vDDL_GameList Choose1,% gameList
	Gui, SelectGame:Add, Button, x+5 yp w80 hp gGui_SelectGame_Validate,Validate
	Gui, SelectGame:Show
	WinWait, ahk_id %hGuiSelectGame%
	WinWaitClose, ahk_id %hGuiSelectGame%
	Return choice

	Gui_SelectGame_Validate:
		Gui, SelectGame:+OwnDialogs
		Gui, SelectGame:Submit, NoHide
		if (DDL_GameList = "Do nothing, close manually")
			choice := "Manual"
		if RegExMatch(DDL_GameList, "O)(.*) \(", subPat)
			choice := subPat.1

		choice = %choice%

		Gui, SelectGame:Destroy
	Return
}

Get_GameExecutable(gameName) {
	global PROGRAM
	iniFile := PROGRAM.INI_FILE

	gameNameUnderscore := StrReplace(gameName, " ", "_")

	IniRead, gameExecutable,% iniFile, EXECUTABLES,% gameNameUnderscore
	SplitPath, gameExecutable, , , gameExecutableExt
	if (gameExecutable = " " || gameExecutable = "ERROR" || !gameExecutable || gameExecutableExt != "exe") {
		MsgBox, 4096,% PROGRAM.NAME,% "You haven't set the executable for this game yet."
		. "`nPlease select the executable as it appears in the task manager."
		Get_GameExecutable_Prompt:
		FileSelectFile, selectedFile,% 1+2+32, C:\, Select the executable for this game, Executables (*.exe)
		if (!ErrorLevel) {
			gameExecutable := selectedFile
			IniWrite,% selectedFile,% iniFile, SHORTCUTS,% gameNameUnderscore
		}
		else {
			Goto, Get_GameExecutable_Prompt
			Return
		}
		/*
		MsgBox, 4096,% PROGRAM.NAME,% "The following game: """ gameName """ does not have a game executable. Please make sure to set the game executable and try again."
		. "`n`nYou can set the game executable for this game in the " PROGRAM.INI_FILE_NAME " file, in the same folder as this script:"
		. "`nUnder the [EXECUTABLES] section, set the executable for the key """ gameNameUnderscore """.`n`nThe application will be closing..." 
		ExitApp
		*/
	}
	return gameExecutable
}

Get_GameShortcut(gameName) {
	global PROGRAM
	iniFile := PROGRAM.INI_FILE

	gameNameUnderscore := StrReplace(gameName, " ", "_")

	IniRead, gameShortcut,% iniFile, SHORTCUTS,% gameNameUnderscore
	if !FileExist(gameShortcut) {
		MsgBox, 4096,% PROGRAM.NAME,% "You haven't set the shortcut for this file yet."
		. "`nPlease select the shortcut used to run this game."
		Get_GameShortcut_Prompt:
		FileSelectFile, selectedFile,% 1+2+32, C:\, Select the shortcut file for this game, Shortcuts (*.lnk)
		if (!ErrorLevel) {
			gameShortcut := selectedFile
			IniWrite,% selectedFile,% iniFile, SHORTCUTS,% gameNameUnderscore
		}
		else {
			Goto, Get_GameShortcut_Prompt
			Return
		}
		/*
		MsgBox, 4096,% PROGRAM.NAME,% "The following game: """ gameName """ does not have a valid shortcut."
		. "`nShortcut: """ gameShortcut """"
		. "`nPlease make sure the shortcut location is correct and try again."
		. "`n`nYou can set the shortcut location for this game in the " PROGRAM.INI_FILE_NAME " file, in the same folder as this script:"
		. "`nUnder the [SHORTCUTS] section, set the location for the key """ gameNameUnderscore """.`n`nThe application will be closing..." 
		ExitApp
		*/
	}
	Return gameShortcut
}

Get_CmdLineParameters() {
	global 0

	params := []
	Loop, %0% {
		param := %A_Index%
		params.Push(param)
	}
	return params
}


Set_GameIniSettings() {
	global PROGRAM
	iniFile := PROGRAM.INI_FILE

	gameNames := ["Forza_Horizon_3", "Sea_of_Thieves", "Zoo_Tycoon_Ultimate_Animal_Collection"]
	gameExecutables := ["forza_x64_release_final.exe", "SoTGame.exe", "MSTycoon.final.exe"]
	for index, gameName in gameNames {
		IniRead, val,% iniFile, SHORTCUTS,% gameName,% ""
		if (!val || val = "ERROR")
			IniWrite,% "",% iniFile, SHORTCUTS,% gameName

		IniRead, val,% iniFile, EXECUTABLES,% gameName,% ""
		if (!val || val = "ERROR")
			IniWrite,% gameExecutables[index],% iniFile, EXECUTABLES,% gameName
	}
}

GetExistingInstances(fileName) {
	pidList := Get_Windows_PID(fileName, "ahk_exe", ",")
	return pidList
}

WaitNewInstance(fileName, existingInstances) {
	newPidList := ""
	newPidList := Get_Windows_PID(fileName, "ahk_exe", ",")

	if (pidList) {
		Loop, Parse, newPidList,% ","
		{
			if A_LoopField not in %pidList%
			{
				gamePID := A_LoopField
				Break
			}
		}
	}
	else {
		gamePID := newPidList
	}
	Return gamePID
}

IsIn(_string, _list) {
	if _string in %_list%
		return True
}

Get_Windows_PID(_filter="", _filterType="", _delimiter=",") {
	returnList := Get_Windows_List(_filter, _filterType, _delimiter, "PID")
	return returnList
}

Get_Windows_List(_filter, _filterType, _delimiter, _what) {

	_whatAllowed := "ID,PID,ProcessID,Exe,ProcessName,Title"
	if !IsIn(_what, _whatAllowed) {
		Msgbox %A_ThisFunc%(): "%_what%" is not allowed`nAllowed: %_whatAllowed%
		return
	}
	_filterTypeAllowed := "ahk_exe,ahk_id,ahk_pid,Title"
	if !IsIn(_filterType, _filterTypeAllowed) {
		Msgbox %A_ThisFunc%(): "%_filterType%" is not allowed`nAllowed: %_filterTypeAllowed%
		return
	}

	; Assign Cmd
	Cmd := (IsIn(_what, "PID,ProcessID"))?("PID")
			:(IsIn(_what, "Exe,ProcessName"))?("ProcessName")
			:(_what)

	; Assign filter
	filter := (IsIn(_filterType, "ahk_exe,ahk_id,ahk_pid"))?(_filterType " " _filter):(_filter)

	; Assign return
	valuesList := ""
	if IsIn(_delimiter, "Array,[]")
		returnList := []
	else
		returnList := ""

	; Loop through pseudo array
	WinGet, winHwnds, List
	Loop, %winHwnds% {
		loopField := winHwnds%A_Index%
		if (_what = "Title")
			WinGetTitle, value, %filter% ahk_id %loopField%
		else 
			WinGet, value, %Cmd%, %filter% ahk_id %loopField%

		if (value) && !IsIn(value, valuesList) {
			valuesList := (valuesList)?(valuesList "," value):(value)

			if IsIn(_delimiter, "Array,[]")
				returnList.Push(value)
			else
				returnList := (returnList)?(returnList . _delimiter . value):(value)
		}
	}

	Return returnList
}

Exit(ExitReason, ExitCode) {
	if ExitReason not in Reload
	{
		ExitApp
	}
}