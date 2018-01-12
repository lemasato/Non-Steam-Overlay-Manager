Set_Format(_NumberType="", _Format="") {
	static prevNumberType, prevFormat
	prevNumberType := _NumberType
	prevFormat := A_FormatFloat

	if (_NumberType = "") && (_Format = "")
		SetFormat, %prevNumberType%, %prevFormat%
	else if (_NumberType) && (_Format = "")
		SetFormat, %_NumberType%, %prevFormat%
	else
		SetFormat, %_NumberType%, %_Format%
}

Set_TitleMatchMode(_MatchMode="") {
	static prevMode
	prevMode := A_TitleMatchMode

	if !(_MatchMode)
		SetTitleMatchMode, %prevMode%
	else
		SetTitleMatchMode, %_MatchMode%
}

MsgBox(_opts="", _title="", _text="", _timeout="") {
	global PROGRAM

	if (_title = "")
		_title := PROGRAM.NAME

	MsgBox,% _opts,% _title,% _text,% _timeout
}

Detect_HiddenWindows(state="") {
	static previousState
	if (state = "" && previousState) {
		DetectHiddenWindows, %previousState%
		Return
	}

	previousState := A_DetectHiddenWindows


	state := (state=True || state="On")?("On"):(state=False || state="Off")?("Off"):("ERROR")
	if (state = "ERROR")
		MsgBox(,, "Invalid use of " A_ThisFunc)
	DetectHiddenWindows, %state%
}

Get_Windows_Title(_filter="", _filterType="", _delimiter="`n") {
	returnList := Get_Windows_List(_filter, _filterType, _delimiter, "Title")
	return returnList
}

Get_Windows_PID(_filter="", _filterType="", _delimiter=",") {
	returnList := Get_Windows_List(_filter, _filterType, _delimiter, "PID")
	return returnList
}

Get_Windows_ID(_filter="", _filterType="", _delimiter=",") {
	returnList := Get_Windows_List(_filter, _filterType, _delimiter, "ID")
	return returnList
}

Get_Windows_Exe(_filter="", _filterType="", _delimiter=",") {
	returnList := Get_Windows_List(_filter, _filterType, _delimiter, "Exe")
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

IsIn(_string, _list) {
	if _string in %_list%
		return True
}

IsContaining(_string, _keyword) {
	if _string contains %_keyword%
		return True
}

CoordMode(obj="") {
/*	Param1
 *	ToolTip: Affects ToolTip.
 *	Pixel: Affects PixelGetColor, PixelSearch, and ImageSearch.
 *	Mouse: Affects MouseGetPos, Click, and MouseMove/Click/Drag.
 *	Caret: Affects the built-in variables A_CaretX and A_CaretY.
 *	Menu: Affects the Menu Show command when coordinates are specified for it.

 *	Param2
 *	If Param2 is omitted, it defaults to Screen.
 *	Screen: Coordinates are relative to the desktop (entire screen).
 *	Relative: Coordinates are relative to the active window.
 *	Window [v1.1.05+]: Synonymous with Relative and recommended for clarity.
 *	Client [v1.1.05+]: Coordinates are relative to the active window's client area, which excludes the window's title bar, menu (if it has a standard one) and borders. Client coordinates are less dependent on OS version and theme.
*/
	if !(obj) { ; No param specified. Return current settings
		CoordMode_Settings := {}

		CoordMode_Settings.ToolTip 	:= A_CoordModeToolTip
		CoordMode_Settings.Pixel 	:= A_CoordModePixel
		CoordMode_Settings.Mouse 	:= A_CoordModeMouse
		CoordMode_Settings.Caret 	:= A_CoordModeCaret
		CoordMode_Settings.Menu 	:= A_CoordModeMenu

		return CoordMode_Settings
	}

	for param1, param2 in obj { ; Apply specified settings.
		if param1 not in ToolTip,Pixel,Mouse,Caret,Menu
			MsgBox, Wrong Param1 for CoordMode: %param1%
		else if param2 not in Screen,Relative,Window,Client
			Msgbox, Wrong Param2 for CoordMode: %param2%
		else
			CoordMode,%param1%,%param2%
	}
}

IsBetween(value, first, last) {
   if value between %first% and %last%
      return true
   else
      return false
}

Convert_TrueFalse_String_To_Value(ByRef value) {
	value := (value="True")?(True):(value="False")?(False):(value)
}

IsInteger(str) {
	str2 := Round(str)
	str := (str=str2)?(str2):(str) ; Fix trailing zeroes
	
	if str is integer
		return true
	return false
}

IsNum(str) {
	if str is number
		return true
	return false
}

Get_ControlCoords(guiName, ctrlHandler) {
/*		Retrieve a control's position and return them in an array.
		The reason of this function is because the variable content would be blank
			unless its sub-variables (coordsX, coordsY, ...) were set to global.
			(Weird AHK bug)
*/
	GuiControlGet, coords, %guiName%:Pos,% ctrlHandler
	return {X:coordsX,Y:coordsY,W:coordsW,H:coordsH}
}

StringIn(string, _list) {
	if string in %_list%
		return true
}

StringContains(string, match) {
	if string contains %match%
		return true
}

Get_TextCtrlSize(txt, fontName, fontSize, maxWidth="") {
/*		Create a control with the specified text to retrieve
 *		the space (width/height) it would normally take
*/
	Gui, GetTextSize:Destroy
	Gui, GetTextSize:Font, S%fontSize%,% fontName
	if (maxWidth) 
		Gui, GetTextSize:Add, Text,x0 y0 +Wrap w%maxWidth% hwndTxtHandler,% txt
	else 
		Gui, GetTextSize:Add, Text,x0 y0 hwndTxtHandler,% txt
	coords := Get_ControlCoords("GetTextSize", TxtHandler)
	Gui, GetTextSize:Destroy

	return coords

/*	Alternative version, with auto sizing

	Gui, GetTextSize:Font, S%fontSize%,% fontName
	Gui, GetTextsize:Add, Text,x0 y0 hwndTxtHandlerAutoSize,% txt
	coordsAuto := Get_ControlCoords("GetTextSize", TxtHandlerAutoSize)
	if (maxWidth) {
		Gui, GetTextSize:Add, Text,x0 y0 +Wrap w%maxWidth% hwndTxtHandlerFixedSize,% txt
		coordsFixed := Get_ControlCoords("GetTextSize", TxtHandlerFixedSize)
	}
	Gui, GetTextSize:Destroy

	if (maxWidth > coords.Auto)
		coords := coordsAuto
	else
		coords := coordsFixed

	return coords
*/
}

FileDownload(url, dest) {
	UrlDownloadToFile,% url,% dest
	if (ErrorLevel) {
		MsgBox Failed to download file!`nURL: %url%`nDest: %dest%
		return 0
	}
	return 1
}
