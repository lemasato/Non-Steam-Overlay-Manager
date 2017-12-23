Create_Local_File() {
	global ProgramValues
	iniFile := ProgramValues.Ini_File

	if !FileExist(iniFile)
		FileAppend, ,% iniFile

	sect := "PROGRAM"
	keysAndValues := {	Last_Update_Check:"1994042612310000"
						,FileName:A_ScriptName
						,PID:ProgramValues.PID}

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

	if InStr(FileExist(ProgramValues.Resources_Folder "\ExternalOverlay"), "D") 
		FileRemoveDir,% ProgramValues.Resources_Folder "\ExternalOverlay", 1
}