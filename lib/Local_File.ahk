Create_Local_File() {
	global ProgramValues
	iniFile := ProgramValues.Ini_File

	if !FileExist(iniFile)
		FileAppend, ,% iniFile

	sect := "PROGRAM"
	keysAndValues := {	Last_Update_Check:"1994042612310000"
						,FileName:A_ScriptName
						,PID:ProgramValues.PID
						,Version:ProgramValues.Version}

	for iniKey, iniValue in keysAndValues {
		currentValue := INI.Get(iniFile, sect, iniKey)

		if (iniKey = "Last_Update_Check") { ; Make sure value is time format
			EnvAdd, currentValue, 1, Seconds
			if !(currentValue) || (currentValue = 1)
				currentValue := "ERROR"
		}
		if iniKey in FileName,PID ; These values are instance specific
		{
			currentValue := "ERROR"
		}
		if (currentValue = "ERROR") {
			INI.Set(iniFile, sect, iniKey, iniValue)
		}
	}

	sect := "SETTINGS"
	keysAndValues := {	Auto_Update:0}
						; ,Transparency:200
						; ,Timer_Logs:600
						; ,Timer_Keywords:30000}

	for iniKey, iniValue in keysAndValues {
		currentValue := INI.Get(iniFile, sect, iniKey)
		if (currentValue = "ERROR") {
			INI.Set(iniFile, sect, iniKey, iniValue)
		}
	}

}

Update_Local_Config() {
	global ProgramValues
	iniFile := ProgramValues.Ini_File
	profilesFile := ProgramValues.Profiles_File

	; Handle changes inbetween versions
	priorVer := Ini.Get(iniFile, "PROGRAM", "Version", "UNKNOWN")
	priorVerNum := (priorVer="UNKNOWN")?(ProgramValues.Version):(priorVer)
	subVersions := StrSplit(priorVerNum, ".")
	mainVer := subVersions[1], releaseVer := subVersions[2], patchVer := subVersions[3]

	if (mainVer = 0 && releaseVer = "2") {
		sects := INI.Get(profilesFile)
		Loop, Parse,% sects,`n,`r
		{
			value := Ini.Get(profilesFile, A_LoopField, "Launch_Parameters")
			if (value = "ERROR")
				Ini.Set(profilesFile, A_LoopField, "Launch_Parameters", A_Space)
		}

		; Add the SimpleString values
		NSOSimpleStr := INI.Get(iniFile, "NSO_Overlay", "Hotkey_SimpleString")
		NSOHotkey := INI.Get(iniFile, "NSO_Overlay", "Hotkey")
		if (hotkeySimpleStr = "ERROR" || hotkeySimpleStr = "" || !hotkeySimpleStr) && (NSOHotkey && NSOHotkey != "ERROR")
			INI.Set(iniFile, "NSO_Overlay", "Hotkey_SimpleString", Get_HotkeyString(NSOHotkey, True))
		steamSimpleStr := INI.Get(iniFile, "Steam_Overlay", "Hotkey_SimpleString")
		steamHotkey := INI.Get(iniFile, "Steam_Overlay", "Hotkey")
		if (hotkeySimpleStr = "ERROR" || hotkeySimpleStr = "" || !hotkeySimpleStr) && (steamHotkey && steamHotkey != "ERROR")
			INI.Set(iniFile, "Steam_Overlay", "Hotkey_SimpleString", Get_HotkeyString(steamHotkey, True))
			
	}

	; Bug from 0.2: Remove the "0" section that was created when it shouldn't have been
	Ini.Remove(profilesFile, "0")

	; Delete ExternalOverlay folder from 0.1 version. Is is now called NSO Overlay
	if InStr(FileExist(ProgramValues.Resources_Folder "\ExternalOverlay"), "D") 
		FileRemoveDir,% ProgramValues.Resources_Folder "\ExternalOverlay", 1

	; Rename External_Overlay ini entries to NSO_Overlay
	INI.Rename(iniFile, "External_Overlay", , "NSO_Overlay")
	sects := INI.Get(profilesFile)

	Loop, Parse,% sects,`n,`r
	{
		nsoValue := INI.Get(profilesFile, A_LoopField, "Use_NSO_Overlay")
		if (nsoValue=1 || nsoValue=0)
			INI.Remove(iniFile, A_LoopField, "Use_External_Overlay")
		else
			INI.Rename(iniFile, A_LoopField, "Use_External_Overlay", A_LoopField, "Use_NSO_Overlay")
	}


}