/*	Dynamically returns FileInstall commands so you can write them in an external ahk file.
	Flag=2 allows to only replace if the sizes are different

	Since FileInstall commands #Include'ed from an external file will not be considered, I would advise to create a function containing those commands.
	
	(Supposing the external file is FileInstall_Cmds.ahk)
	Don't forget that, when using an ahk source script, the FileInstall_Cmds file will not have all the updated path since they are written on run-time.
	For this reason, you cannot #Include FileInstall_Cmds when running a source. You must run the FileInstall_Cmds file manually.

	Though, for compiled scripts, you can simply add:
		if (A_IsCompiled) {
			#Include FileInstall_Cmds.ahk
		}
	At the end of your script.
*/

FileInstall(source, dest, flag=0) {

	sourceNoQuotes := StrReplace(source, """", "")
	destWithPercent := "% " dest

	SplitPath, dest, , destFolder

	appendToFile .= "if !InStr(FileExist(" destFolder """" "), ""D"")"
	. "`n"			"	FileCreateDir,% " destFolder """"
	. "`n`n"

	if (flag=2) {
		appendToFile .= "FileGetSize, sourceFileSize, " sourceNoQuotes
		. "`n"			"if (A_IsCompiled)"
		. "`n"			"	destFileSize := Get_ResourceSize(" source ", " dest ")"
		. "`n"			"else FileGetSize, destFileSize, " destWithPercent
		. "`n"
		. "`n"			"if (sourceFileSize != destFileSize)"
		. "`n"			"	FileInstall, " sourceNoQuotes ", " destWithPercent ", 1"
	}
	else {
		appendToFile .= "FileInstall, " sourceNoQuotes ", " destWithPercent ", " flag
	}

	appendToFile .= "`nif (ErrorLevel)"
	. "`n"			"	Msgbox % ""Failed to extract file!"""
	. "`n"			"	. ""``nSource: " sourceNoQuotes """"
	. "`n"			"	. ""``nDest: "" " dest 
	. "`n"			"	. ""``nFlag: " flag """"

	appendToFile .= "`n`n; ----------------------------`n"
	Return appendToFile
}

