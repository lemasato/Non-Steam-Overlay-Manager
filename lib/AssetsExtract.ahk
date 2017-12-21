AssetsExtract() {
	global ProgramValues
	static 0 ; Bypass warning "local same as global" for var 0

	if (A_IsCompiled) {
		FileInstall_Cmds()
		Return
	}

;	File location
	installFile := A_ScriptDir "\FileInstall_Cmds.ahk"
	FileDelete,% installFile

;	File_Install.ahk
	appendToFile := "#SingleInstance Force`n"
				 .	"#NoTrayIcon`n`n"

	appendToFile .= "if (!A_IsCompiled && A_ScriptName = ""FileInstall_Cmds.ahk"") {"
	. "`n"			"	#Include %A_ScriptDir%/lib/Get_ResourceSize.ahk"
	. "`n" 			"}"
	. "`n`n"

;	Pass ProgramValues to file
	appendToFile .= "tempParams := {}"
	. "`n"			"Loop, %0% {"
	. "`n"			"	param := `%A_Index`%"
	. "`n"			"	if RegExMatch(param, ""/Resources_Folder=(.*)"", found)"
	. "`n"			"		tempParams.Resources_Folder := found1"
	. "`n"			"	ProgramValues := tempParams"
	. "`n"			"}"
	. "`n"
	. "`n; --------------------------------"
	. "`n"			"FileInstall_Cmds() {"
	. "`n"			"global ProgramValues"
	. "`n`n"

;	\resources\
	resFolder := A_ScriptDir "\resources"
	allowedExt := "png,ico,txt"

	Loop, Files,% resFolder "\*"
	{
		RegExMatch(A_LoopFileFullPath, "\\resources\\(.*)", path)
		filePath := "resources\" path1

		if A_LoopFileExt in %allowedExt%
			appendToFile .= FileInstall("""" filePath """", "ProgramValues.Resources_Folder """ "\" A_LoopFileName """", 2)
	} 

;	\resources\ExternalOverlay\
	resFolder := A_ScriptDir "\resources\ExternalOverlay"
	allowedFile := "ExternalOverlay.exe"

	Loop, Files,% resFolder "\*"
	{
		RegExMatch(A_LoopFileFullPath, "\\resources\\ExternalOverlay\\(.*)", path)
		filePath := "resources\ExternalOverlay\" path1

		if A_LoopFileName in %allowedFile%
			appendToFile .= FileInstall("""" filePath """", "ProgramValues.Resources_Folder """ "\ExternalOverlay\" A_LoopFileName """", 2)
	}

	appendToFile .= "`n}"

;	ADD TO FILE
	FileAppend,% appendToFile "`n",% installFile
	Sleep 10
	RunWait,% installFile
	.		" /Resources_Folder=" 	"""" ProgramValues.Resources_Folder """",% A_ScriptDir
}