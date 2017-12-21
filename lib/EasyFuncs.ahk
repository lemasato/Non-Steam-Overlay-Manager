Get_Windows_List(mode, filterType="", filter="") {

	WinGet, winHwnd, List
	returnArr := []
	valuesList := "0"

	if mode in Exe,ProcessName
		cmd := "ProcessName"
	else if mode in PID
		cmd := "PID"
	else if mode in ID
		cmd := ID

	if (filterType = "Title")
		filterCmd := filter
	else if filterType in exe,id,pid
		filterCmd := "ahk_" filterType " " filter
	else
		filterCmd := ""

	Loop, %winHwnd% 
	{
		WinGet, value, %cmd%,% filterCmd " ahk_id " winHwnd%A_Index%
		if (value) {
			if value not in %valuesList%
			{
				valuesList .= "," value
				returnArr.Push(value)
			}
		}
	}
	return returnArr
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

Get_Control_Coords(guiName, ctrlHandler) {
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

Get_Text_Control_Size(txt, fontName, fontSize, maxWidth="") {
/*		Create a control with the specified text to retrieve
 *		the space (width/height) it would normally take
*/
	Gui, GetTextSize:Destroy
	Gui, GetTextSize:Font, S%fontSize%,% fontName
	if (maxWidth) 
		Gui, GetTextSize:Add, Text,x0 y0 +Wrap w%maxWidth% hwndTxtHandler,% txt
	else 
		Gui, GetTextSize:Add, Text,x0 y0 hwndTxtHandler,% txt
	coords := Get_Control_Coords("GetTextSize", TxtHandler)
	; Gui, GetTextSize:Show, w500
	Gui, GetTextSize:Destroy

	return coords

/*	Alternative version, with auto sizing

	Gui, GetTextSize:Font, S%fontSize%,% fontName
	Gui, GetTextsize:Add, Text,x0 y0 hwndTxtHandlerAutoSize,% txt
	coordsAuto := Get_Control_Coords("GetTextSize", TxtHandlerAutoSize)
	if (maxWidth) {
		Gui, GetTextSize:Add, Text,x0 y0 +Wrap w%maxWidth% hwndTxtHandlerFixedSize,% txt
		coordsFixed := Get_Control_Coords("GetTextSize", TxtHandlerFixedSize)
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
