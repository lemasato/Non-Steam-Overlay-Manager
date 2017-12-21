/*
	Version: 2.0.1

	v2.0.1 (27 Nov 2017)
		Fix: Only use FileDelete on .exe files.
		Fix: The FileName key from the ini file only stores the file name.
				Since the updater file is not always located in the same folder as the script,
				we retrieve the script path from the /File_Name* parameter then add this path to the variable retrieved from the FileName ini key.
*/
#NoEnv
#Persistent
#SingleInstance Force
#Warn LocalSameAsGlobal
OnExit("Exit_Func")

DetectHiddenWindows, Off
FileEncoding, UTF-8
ListLines, Off
SetWorkingDir, %A_ScriptDir%

Menu,Tray,Tip,Updater
Menu,Tray,NoStandard
Menu,Tray,Add,Close,Exit_Func

Start_Script()
ExitApp
Return

Start_Script() {
/*
*/
	EnvGet, userprofile, userprofile
	global ProgramValues := {}

	Handle_CommandLine_Parameters()
	Close_Program_Instancies()
;	Downloading the new version.
	Download_New_Version()
}


Handle_CommandLine_Parameters() {
	global 0
	global ProgramValues

	Loop, %0% {
		param := %A_Index%
		if RegExMatch(param, "/Name=(.*)", found) {
			ProgramValues.Name := found1, found1 := ""
		}
		else if RegExMatch(param, "/File_Name=(.*)", found) {
			ProgramValues.File_Name := found1, found1 := ""
		}
		else if RegExMatch(param, "/Local_Folder=(.*)", found) {
			ProgramValues.Local_Folder := found1, found1 := ""
		}
		else if RegExMatch(param, "/Ini_File=(.*)", found) {
			ProgramValues.Ini_File := found1, found1 := ""
		}
		else if RegExMatch(param, "/NewVersion_Link=(.*)", found) {
			ProgramValues.NewVersion_Link := found1, found1 := ""
		}
	}
}


Close_Program_Instancies() {
/*		Close running instances of the program.
		Delete the file, unless it's .ahk.
 */
 	global ProgramValues

	IniRead, programPID,% ProgramValues.Ini_File,PROGRAM,PID
	IniRead, fileName,% ProgramValues.Ini_File,PROGRAM,FileName

	fileNameAndPath := ProgramValues.File_Name
	SplitPath, fileNameAndPath, , fileNameAndPath
	fileNameAndPath := fileNameAndPath "\" fileName

	if (programPID && programPID != "ERROR") {
		Process, Close,% programPID
		Process, WaitClose,% programPID
		Sleep 1
	}

	if (fileName && fileName != "ERROR") {
		SplitPath, fileName, , , fileNameExt
		if (fileNameExt = "exe")
			FileDelete,% fileNameAndPath
		Sleep 1
	}
	Sleep 1
}

Download_New_Version() {
/*		Download the new version. Rename. Run.
*/
	global ProgramValues
	UrlDownloadToFile,% ProgramValues.NewVersion_Link,% ProgramValues.File_Name

	if ( ErrorLevel ) {
		funcParams := { Border_Color:"White"
						,Background_Color:"Blue"
						,Title:"Download timed out"
						,Title_Color:"White"
						,Text:"Please make sure your network is working correctly"
						. "`nor try downloading the new version manually"
						,Text_Color:"White"}
		GUI_Beautiful_Warning(funcParams)
		ExitApp
	}
	Sleep 10
	FileSetAttrib, -H,% ProgramValues.File_Name
	IniWrite, 1,% ProgramValues.Ini_File,PROGRAM,Show_Changelogs
	Sleep 10
	Run, % ProgramValues.File_Name
}

GUI_Beautiful_Warning(params) {
	global ProgramValues

	guiWidthBase := 350, guiHeightBase := 50, guiHeightNoUnderline := 30
	guiFontName := "Consolas", guiFontSize := "10 Bold"

	borderSize := 2, borderColor := params.Border_Color
	backgroundCol := params.Background_Color
	warnTitle := params.Title, warnTitleColor := params.Title_Color
	warnText := params.Text,warnTextColor := params.Text_Color

	condition := params.Condition, count := params.Condition_Count

	underlineExists := (warnTitle)?(true):(false)
	xOffset := 10, yOffset := (underlineExists)?(5):(20)

	txtSize := Get_Text_Control_Size(warnText, guiFontName, guiFontSize, guiWidthBase+xOffset)
	guiWidth := (txtSize.W > guiWidthBase)?(txtSize.W+xOffset):(guiWidthBase)
	guiHeight := (underlineExists)?(guiHeightBase + txtSize.H):(guiHeightNoUnderline + txtSize.H)

	defaultGui := A_DefaultGUI

	static WarnTextHandler

	Gui, BeautifulWarn:Destroy
	Gui, BeautifulWarn:New, +AlwaysOnTop +ToolWindow -Caption -Border +LabelGui_Beautiful_Warning_ hwndGuiBeautifulWarningHandler,% ProgramValues.Name
	Gui, BeautifulWarn:Default
	Gui, Margin, 0, 0
	Gui, Color,% backgroundCol
	Gui, Font,% "S" guiFontSize,% guiFontName
	Gui, Add, Progress,% "x0" . " y0" . " h" borderSize . " w" guiWidth . " Background" borderColor ; Top
	Gui, Add, Text,% "x" xOffset " ym+5 w" guiWidth-(xOffset*2) " c" warnTitleColor " Center BackgroundTrans Section",% ProgramValues.Name
	if (warnTitle) {
		Gui, Add, Text,% "x" xOffset " w" guiWidth-(xOffset*2) " c" warnTitleColor "  Center BackgroundTrans Section",% warnTitle
		Gui, Add, Progress,% "x" xOffset . " y+5 h" borderSize . " w" guiWidth-(xOffset*2) . " Background" borderColor " Section" ; Underline
	}
	Gui, Add, Progress,% "x" guiWidth-borderSize . " y0" . " h" guiHeight . " w" borderSize . " Background" borderColor ; Right
	Gui, Add, Progress,% "x0" . " y" guiHeight-borderSize . " h" borderSize . " w" guiWidth . " Background" borderColor ; Bot
	Gui, Add, Progress,% "x0" . " y0" . " h" guiHeight . " w" borderSize . " Background" borderColor ; Left
	Gui, Add, Text,% "x" xOffset " ys+" yOffset " w" guiWidth-(xOffset*2) " hwndWarnTextHandler c" warnTextColor " Center BackgroundTrans",% warnText

	Gui, Show, w%guiWidth% h%guiHeight%
	Gui, %defaultGUI%:Default

	WinWait,% "ahk_id " GuiBeautifulWarningHandler
	WinWaitClose,% "ahk_id " GuiBeautifulWarningHandler
	Return

	GUI_Beautiful_Warning_Close:
		Gui, BeautifulWarn:Destroy
	Return
	GUI_Beautiful_Warning_Escape:
		GoSub GUI_Beautiful_Warning_Close
	Return
}

Get_Text_Control_Size(txt, fontName, fontSize, maxWidth="") {
/*		Create a control with the specified text to retrieve
 *		the space (width/height) it would normally take
*/
	Gui, GetTextSize:Font, S%fontSize%,% fontName
	if (maxWidth)
		Gui, GetTextSize:Add, Text,x0 y0 +Wrap w%maxWidth% hwndTxtHandler,% txt
	else 
		Gui, GetTextSize:Add, Text,x0 y0 hwndTxtHandler,% txt
	coords := Get_Control_Coords("GetTextSize", TxtHandler)
	Gui, GetTextSize:Destroy

	return coords
}

Get_Control_Coords(guiName, ctrlHandler) {
/*		Retrieve a control's position and return them in an array.
		The reason of this function is because the variable content would be blank
			unless its sub-variables (coordsX, coordsY, ...) were set to global.
			(Weird AHK bug)
*/
	GuiControlGet, coords, %guiName%:Pos,% ctrlHandler
	return {X:coordsX,Y:coordsY,W:coordsW,H:coordsH}
}


Exit_Func(ExitReason, ExitCode) {
	if ExitReason not in Reload
		ExitApp
}
