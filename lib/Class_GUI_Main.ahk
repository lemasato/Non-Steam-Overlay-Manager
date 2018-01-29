if (A_ScriptName = "Class_GUI_Main.ahk") {
	#Include *i %A_ScriptDir%\third-party\AddToolTip.ahk

	SplitPath, A_ScriptFullPath, , scriptFolder
	SplitPath, scriptFolder, , parentFolder
	Run, %parentFolder%/NSO Manager.ahk
	Exitapp
}

#MenuMaskKey vk07                 ;Requires AHK_L 38+
#If HK_CTRL := HotkeyCtrlHasFocus()
	*AppsKey::                       ;Add support for these special keys,
	*BackSpace::                     ;  which the hotkey control does not normally allow.
	*Delete::
	*Enter::
	*Escape::
	*Pause::
	*PrintScreen::
	*Space::
	*Tab::
	modifier := ""
	if GetKeyState("Shift","P")
		modifier .= "+"
	if GetKeyState("Ctrl","P")
		modifier .= "^"
	if GetKeyState("Alt","P")
		modifier .= "!"

 
	if (A_ThisHotkey == "*BackSpace" && HK_CTRL[1] && !modifier)   ;if the control has text but no modifiers held,
		GuiControl, Main:,% HK_CTRL[3]                                       ;  allow BackSpace to clear that text.
	else {                                                     ;Otherwise,
		GuiControl, Main:,% HK_CTRL[3],% modifier SubStr(A_ThisHotkey,2)  ;  show the hotkey.

		GUI_Main.OnHotkeyChange(HK_CTRL[1], HK_CTRL[2], modifier SubStr(A_ThisHotkey,2))
	}
	return
#If

HotkeyCtrlHasFocus() {
	static bak, bak2

 	GuiControlGet, ctrlClassNN, Main:Focus       ;ClassNN
 	if !(ctrlClassNN)
 		ctrlClassNN := bak

 	if InStr(ctrlClassNN,"hotkey") {
  		GuiControlGet, ctrlVar, Main:FocusV     ;Associated variable
  		GuiControlGet, ctrlHwnd, Main:Hwnd,% ctrlClassNN

  		if !(ctrlVar)
  			ctrlVar := bak2

  			bak2 := ctrlVar
  		Return, [ctrlVar, ctrlHwnd, ctrlClassNN]
 	}
 	bak := ctrlClassNN
}


Class GUI_Main {

	Create() {
		static
		global ProgramValues
		global GUI_Main_Handles := {}
		global GUI_Main_Submit := {}
		global GUI_Main_Values := {}

		profilesINI := ProgramValues.Profiles_File
		nsoHotkey := INI.Get(ProgramValues.Ini_File, "NSO_Overlay", "Hotkey")
		steamHotkey := INI.Get(ProgramValues.Ini_File, "Steam_Overlay", "Hotkey")

		allProfiles := INI.Get(profilesINI)
		Sort, allProfiles,% "D`n"

		Gui, Main:Destroy
		Gui, Main:New, +LabelGUI_Main_ +HwndhGUI_Main
		Gui, Main:Font, S8, Segoe UI
		Gui, Main:Default ; Neccessary for LV_ functions

		Gui, Main:Add, GroupBox, x5 y0 c000000 w675 h135,Instructions
		Gui, Main:Add, Text, x15 yp+20 BackgroundTrans,% "1) Add this tool as a non-steam game"
		.												 "`n2) Right click on it on your library."
		.												 "`n3) Choose Properties > Set launch options."
		.												 "`n4) Write: /Profile=""Profile Name"""
		.												 "`n`nKeep your mouse above a control for a tooltip."
		.												 "`n`nUntick the box next to ""Launcher"" if you wish to use NSO Manager with a software or a game that doesnt use a launcher."
		Gui, Main:Add, ListView, x5 y+25 w150 h250 hwndhLV_Profiles -HDR -Multi -E0x200 AltSubmit +LV0x10000,Profiles
		__f := GUI_Main.OnProfilesLVClick.bind(GUI_Main)
		GuiControl, Main:+g,% hLV_Profiles, % __f
		;__ Loop through profiles names
		Loop, Parse,% allProfiles,% "`r`n"
		{
			LV_Add("", A_LoopField)
		}
		Gui, Main:Add, GroupBox, x+10 w510 h280 c000000 hwndhGB_ProfileSettings Center,Profile Settings
		Gui, Main:Add, Text, xp+10 yp+22 Center w200 hwndhTEXT_ProfileName,Profile name
		profNameCoords := Control_Coords("Main", hTEXT_ProfileName)
		Gui, Main:Add, Edit, xp y+5 wp-21 hwndhEDIT_ProfileName
		Gui, Main:Add, Button, x+1 yp-1 w80 h23 hwndhBTN_RenameProfileName, Rename
		__f := GUI_Main.ChangeProfileName.bind(GUI_Main)
		GuiControl, Main:+g,% hBTN_RenameProfileName,% __f

		Gui, Main:Add, Text,% "x" profNameCoords.X " y+10 w" profNameCoords.W " Center hwndhTEXT_ProfileLauncher",Launcher location
		profLauncherCoords := Control_Coords("Main", hTEXT_ProfileLauncher)
		Gui, Main:Add, CheckBox, xp y+8 hwndhCB_EnableLauncher,% ""
		__f := GUI_Main.ToggleCheckBox.bind(GUI_Main, "EnableLauncher", hCB_EnableLauncher)
		GuiControl, Main:+g,% hCB_EnableLauncher,% __f
		Gui, Main:Add, Edit,% "xp+20 yp-3 w" profLauncherCoords.W-40 " ReadOnly hwndhEDIT_Launcher"
		profLauncherEditCoords := Control_Coords("Main", hEDIT_Launcher)
		Gui, Main:Add, Button,% "x+1 yp-1 w80 h23 hwndhBTN_BrowseLauncher", Browse
		__f := GUI_Main.BrowseForFile.bind(GUI_Main, "Launcher", hEDIT_Launcher)
		GuiControl, Main:+g,% hBTN_BrowseLauncher,% __f

		Gui, Main:Add, Text,% "x" profNameCoords.X " y+10 w" profNameCoords.W " Center hwndhTEXT_ProfileClient",Client location
		Gui, Main:Add, Edit, xp y+5 wp-20 ReadOnly hwndhEDIT_Client 
		Gui, Main:Add, Button,% "x+1 yp-1 w80 h23 hwndhBTN_BrowseClient", Browse
		__f := GUI_Main.BrowseForFile.bind(GUI_Main, "Client", hEDIT_Client)
		GuiControl, Main:+g,% hBTN_BrowseClient,% __f

		Gui, Main:Add, Text,% "x" profNameCoords.X " y+10 w" profNameCoords.W+60 " Center hwndhTEXT_ProfileParameters",Launch parameters
		Gui, Main:Add, Edit, xp y+5 wp hwndhEDIT_LaunchParameters
		__f := GUI_Main.SetLaunchParameters.bind(GUI_Main, hEDIT_LaunchParameters)
		GuiControl, Main:+g,% hEDIT_LaunchParameters,% __f

		Gui, Main:Add, Text,% "x" profNameCoords.X " y+20 hwndhTEXT_CmdHelp w180",/Profile=""



		secondRowX := profNameCoords.X+290, secondRowY := profNameCoords.Y+20

		Gui, Main:Add, GroupBox,% "x" secondRowX-10 " y" secondRowY-10 " w215 h140 c000000"
		Gui, Main:Add, Checkbox,% "x" secondRowX " y" secondRowY " hwndhCB_UseNSOOverlay",Use NSO Overlay
		useNSOCoords := Control_Coords("Main", hCB_UseNSOOverlay)
		__f := GUI_Main.ToggleCheckBox.bind(GUI_Main, "UseNSOOverlay", hCB_UseNSOOverlay)
		GuiControl, Main:+g,% hCB_UseNSOOverlay,% __f


		profBoxCoords := Control_Coords("Main", hGB_ProfileSettings)
		Gui, Main:Add, Text,% "xp yp+25 w" profNameCoords.W " Center BackgroundTrans",Steam Overlay shortcut:
		Gui, Main:Add, Hotkey,% "xp y+5 wp vvHK_SteamOverlay hwndhHK_SteamOverlay",% steamHotkey
		__f := GUI_Main.OnHotkeyChange.bind(GUI_Main, "SteamOverlay", hHK_SteamOverlay)
		GuiControl, Main:+g,% hHK_SteamOverlay,% __f

		Gui, Main:Add, Text,% "xp y+15 wp Center BackgroundTrans",NSO Overlay shortcut:
		Gui, Main:Add, Hotkey,% "xp y+5 wp vvHK_NSOOverlay hwndhHK_NSOOverlay",% NSOHotkey
		__f := GUI_Main.OnHotkeyChange.bind(GUI_Main, "NSOOverlay", hHK_NSOOverlay)
		GuiControl, Main:+g,% hHK_NSOOverlay,% __f

		coords := Control_Coords("Main", hLV_Profiles)
		Gui, Main:Add, Button,% "x" coords.X " y" coords.Y+coords.H+5 " w" coords.W/2-2 " h25 hwndhBTN_Add", Add
		Gui, Main:Add, Button, x+5 yp wp hp hwndhBTN_Remove, Remove
		__f := GUI_Main.OnAddOrRemoveBtnClick.bind(GUI_Main, "Add")
		GuiControl, Main:+g,% hBTN_Add,% __f
		__f := GUI_Main.OnAddOrRemoveBtnClick.bind(GUI_Main, "Remove")
		GuiControl, Main:+g,% hBTN_Remove,% __f

		Gui, Main:Add, Link, x5 y+10 hwndhLINK_GitHub,% "<a href=""" ProgramValues.Github """>See on GitHub</a>"
		Gui, Main:Add,Text,x+5 yp,-
		Gui, Main:Add, Link, x+5 yp hwndhLINK_Discord,% "<a href=""" ProgramValues.Discord """>Join on Discord</a>"

		; ToolTips
		AddToolTip(hEDIT_ProfileName, "Name of the profile as it will be used for the /Profile parameter.")
		AddToolTip(hEDIT_Launcher, "Location of the launcher executable used to run the game."
		.			 "`nIf you are running the game directly without any launcher, untick the case.")
		AddToolTip(hEDIT_Client, "Location of the game executable.")
		AddToolTip(hEDIT_LaunchParameters, "Launch parameters for the game that will be launched."
		. 			"`nIf you are using a launcher, these parameters will be used for the launcher only."
		. 			"`nWhen using a launcher, you cannot set parameters for the client as " ProgramValues.Name " does NOT run the client."
		. 			"`nIf your client requires parameter, it would be recommended to use a shortcut (.lnk) file and use that file as the client.")
		AddToolTip(hCB_UseNSOOverlay, "Work-around for games where the Steam Overlay does not normally work.")
		AddToolTip(hHK_SteamOverlay, "Your hotkey used to normally toggle the Steam Overlay."
		.			"`nIt will be used to automatically enable the Steam Overlay inside the NSO Overlay."
		.			"`n`nIf the Steam Overlay does not appear on the NSO Overlay,"
		.			"`n simply press your Steam Overlay shortcut to bring it up.")
		AddToolTip(hHK_NSOOverlay, "Hotkey to toggle the NSO Overlay.")
		AddToolTip(hLINK_GitHub, ProgramValues.Github)
		AddToolTip(hLINK_Discord, ProgramValues.Discord)

		; Handles
		GUI_Main_Handles.EDIT_ProfilName := hEDIT_ProfileName
		GUI_Main_Handles.EDIT_Launcher := hEDIT_Launcher
		GUI_Main_Handles.CB_EnableLauncher := hCB_EnableLauncher
		GUI_Main_Handles.EDIT_Client := hEDIT_Client
		GUI_Main_Handles.EDIT_LaunchParameters := hEDIT_LaunchParameters
		GUI_Main_Handles.CB_UseNSOOverlay := hCB_UseNSOOverlay

		GUI_Main_Handles.TEXT_CmdHelp := hTEXT_CmdHelp
		GUI_Main_Values.TEXT_CmdHelp := "/Profile="

		; Values
		GUI_Main_Values.Ini_File := profilesINI

		; Show the gui
		Gui, Main:Show, ,% ProgramValues.Name " v" ProgramValues.Version
		WinWait, ahk_id %hGUI_Main%
		WinWaitClose, ahk_id %hGUI_Main%
		return

		GUI_Main_Close:
			Gui, %A_Gui%:Destroy
		return
	}

	SetLaunchParameters(CtrlHwnd) {
		global ProgramValues
		global GUI_Main_Values, GUI_Main_Handles
		static profilesINI
		profilesINI := GUI_Main_Values.Ini_File

		if !GUI_Main.IsSelectedProfileNameValid() {
			Return
		}

		GuiControlGet, content, %A_Gui%:,% CtrlHwnd
		profileName := GUI_Main.LV_GetSelectedContent()
		keysAndValues := INI.Get(profilesINI, profileName)

		INI.Set(profilesINI, profileName, "Launch_Parameters", content)
	}

	OnHotkeyChange(param, CtrlHwnd, special="") {
		global GUI_Main_Values, ProgramValues
		iniFile := ProgramValues.Ini_File

		GuiControlGet, content, %A_Gui%:,% CtrlHwnd

		if (SubStr(param, 1, 4) = "vHK_") {
			param := SubStr(param, 5)
			content := special
		}

		if content in +,^,!,+^,+!,^!,+^!    ;if the hotkey contains only modifiers, return to wait for a key.
			return

		if (param = "NSOOverlay") 
			INI.Set(iniFile, "NSO_Overlay", "Hotkey", content)
		else if (param = "SteamOverlay") {
			INI.Set(iniFile, "Steam_Overlay", "Hotkey", content)
			Loop 3 {
				char := SubStr(content, A_Index, 1)
				restOfString := SubStr(content, A_Index)
				keyStr := (char="^")?("{Ctrl Down}"):(char="!")?("{Alt Down}"):(char="+")?("{Shift Down}"):("")

				if !(keyStr)
					Break

				hotkeyString .= (keyStr)?(keyStr):("")
			}

			hotkeyString .= "{" restOfString " Down}"

			split := StrSplit(hotkeyString, "Down}")
			for key, element in split {
				if (element)
					maxIndex++
			}
			splitIndex := maxIndex
			
			Loop, %maxIndex% {
				hotkeyString .= split[splitIndex] "Up}"
				splitIndex--
			}
			
			Ini.Set(ProgramValues.Ini_File, "Steam_Overlay", "Hotkey_String", hotkeyString)
		}
	}

	IsSelectedProfileNameValid() {
		if GUI_Main.IsSelectedProfileValid(True, True)
			Return 1
	}

	IsSelectedProfileValid(skipLauncher=False, skipClient=False) {
		global GUI_Main_Values

		rowID := GUI_Main.LV_GetSelectedRow()
		rowContent := GUI_Main.LV_GetSelectedContent()

		if GUI_Main.IsProfileValid(rowContent, skipLauncher, skipClient) {
			Return 1
		}
	}

	IsProfileValid(profile, skipLauncher=False, skipClient=False) {
		global GUI_Main_Values, ProgramValues
		profilesINI := GUI_Main_Values.Ini_File

		if (skipLauncher && skipClient) { ; Use skipKeyCheck to only check for profile name
			if (profile != "" && profile != "Profiles")
				return True
		}

		if (profile && profile != "Profiles") { ; "Profiles" is our collumn name
			keysAndValues := INI.Get(profilesINI, profile)
			skipLauncher := (keysAndValues.Enable_Launcher)?(False):(True)

			for key, value in keysAndValues {
				exists := true
				if (key = "Launcher" && !skipLauncher && !FileExist(value))
					invalidMsg .= "Path for " key " does not exist: " value "`n"
				else if  (key = "Client" && !skipClient && !FileExist(value))
					invalidMsg .= "Path for " key " does not exist: " value "`n"
			}

			if !(exists) {
				invalidMsg := "The following profile does not exist: " profile "`n" invalidMsg
			}
		}

		if (exists && !invalidMsg)
			return True
		else {
			invalidMsg := "Profile """ profile """ is invalid.`n" invalidMsg
			MsgBox,% 48+4096,% ProgramValues.Name,% invalidMsg
		}
	}

	ToggleCheckBox(param, CtrlHwnd) {
		global GUI_Main_Handles
		global GUI_Main_Values
		profilesINI := GUI_Main_Values.Ini_File

		if !GUI_Main.IsSelectedProfileNameValid() {
			Return
		}

		profName := GUI_Main.LV_GetSelectedContent()
		GuiControlGet, state, %A_Gui%:,% CtrlHwnd
		if (param = "UseNSOOverlay")
			INI.Set(profilesINI, profName, "Use_NSO_Overlay", state)
		else if (param = "EnableLauncher")
			INI.Set(profilesINI, profName, "Enable_Launcher", state)
	}

	ChangeProfileName(param, CtrlHwnd) {
		global GUI_Main_Handles
		global GUI_Main_Values
		profilesINI := GUI_Main_Values.Ini_File
		profileNameHwnd := GUI_Main_Handles.EDIT_ProfilName

		rowID := GUI_Main.LV_GetSelectedRow()
		rowContent := GUI_Main.LV_GetSelectedContent(row)
		GuiControlGet, newContent,%A_Gui%:,% profileNameHwnd

		if !GUI_Main.IsProfileValid(rowContent)
			Return

		if (rowContent && newContent) && (newContent != rowContent) {
			INI.Rename(profilesINI, rowContent, , newContent)
			LV_Modify(rowID, , newContent)
		}
	}

	BrowseForFile(param, EditHwnd) {
		global GUI_Main_Values
		static profilesINI
		profilesINI := GUI_Main_Values.Ini_File

		if !GUI_Main.IsSelectedProfileNameValid() {
			Return
		}

		if (param = "Launcher") {
			prompt := "Please select the launcher executable"
		}
		else if (param = "Client") {
			prompt := "Please select the client executable"
		}
		FileSelectFile, selectedFile,% 1+2+32, ,% prompt, Executables (*.exe; *.lnk) ; 1=file exists, 2=path exists, 3=lnk file not resolved to target
		if (!ErrorLevel) {
			GuiControl, Main:,% EditHwnd,% selectedFile
			profileName := GUI_Main.LV_GetSelectedContent()
			INI.Set(profilesINI, profileName, param, selectedFile)
		}
	}

	OnAddOrRemoveBtnClick(param) {
		global GUI_Main_Values, ProgramValues
		static profilesINI
		profilesINI := GUI_Main_Values.Ini_File

		if (param = "Add") {
			InputBox, userInput, Profile Name, Please input a name for the profile:, , 250, 125
			if (!ErrorLevel && userInput) {
				LV_Add("", userInput)
				INI.Set(profilesINI, userInput, "Launcher", "")
				INI.Set(profilesINI, userInput, "Client", "")
				INI.Set(profilesINI, userInput, "Enable_Launcher", False)
				INI.Set(profilesINI, userInput, "Use_NSO_Overlay", False)
				INI.Set(profilesINI, userInput, "Launch_Parameters", "")
			}
		}
		else if (param = "Remove") {
			if !GUI_Main.IsSelectedProfileNameValid()
				return

			profileName := GUI_Main.LV_GetSelectedContent()
			rowID := GUI_Main.LV_GetSelectedRow()

			if (rowID = 0)
				Return

			MsgBox, 4100,% ProgramValues.Name,%profileName%`nAre you sure you want to completely remove this profile?
			IfMsgBox, Yes
			{
				LV_Delete(rowID)
				Ini.Remove(profilesINI, profileName)
			}
		}
	}

	OnProfilesLVClick(CtrlHwnd, GuiEvent, EventInfo) {
		global GUI_Main_Handles
		global GUI_Main_Values
		static profilesINI
		profilesINI := GUI_Main_Values.Ini_File

		Gui, Main:Default

		if GuiEvent in Normal,D,I,K
		{
			profileName := GUI_Main.LV_GetSelectedContent()
			rowID := GUI_Main.LV_GetSelectedRow()
			if (rowID = 0) {
				Return
			}

			keysAndValues := INI.Get(profilesINI, profileName)
			GuiControl, Main:,% GUI_Main_Handles.EDIT_ProfilName,% profileName
			GuiControl, Main:,% GUI_Main_Handles.CB_EnableLauncher,% keysAndValues.Enable_Launcher
			GuiControl, Main:,% GUI_Main_Handles.EDIT_Launcher,% keysAndValues.Launcher
			GuiControl, Main:,% GUI_Main_Handles.EDIT_Client,% keysAndValues.Client
			GuiControl, Main:,% GUI_Main_Handles.EDIT_LaunchParameters,% keysAndValues.Launch_Parameters

			if (keysAndValues.Use_NSO_Overlay && keysAndValues.Use_NSO_Overlay != "ERROR")
				GuiControl, Main:,% GUI_Main_Handles.CB_UseNSOOverlay, 1
			else GuiControl, Main:,% GUI_Main_Handles.CB_UseNSOOverlay, 0

			GuiControl, Main:,% GUI_Main_Handles.TEXT_CmdHelp,% GUI_Main_Values.TEXT_CmdHelp """" profileName """"
		}
	}

	LV_GetSelectedRow() {
		rowID := LV_GetNext(0, "F")

		Return rowID
	}

	LV_GetSelectedContent() {
		; LV_GetText(string, A_EventInfo) is unreliable. A_EventInfo will sometimes not contain the correct row ID.
		; LV_GetNext() seems to be the best alternative. Though, it rises an issue when no row is selected.
		;	Instead of retrieving a blank value, it will retrieve the same value as the previously selected row ID.
		;	As workaround, when the user does not select any row, we re-highlight the previously selected one.
		rowID := LV_GetNext(0, "F")
		LV_GetText(content, rowID)

		return content
	}

}

Control_Coords(guiName, ctrlHandler) {
/*		Retrieve a control's position and return them in an array.
		The reason of this function is because the variable content would be blank
			unless its sub-variables (coordsX, coordsY, ...) were set to global.
			(Weird AHK bug)
*/
	GuiControlGet, coords, %guiName%:Pos,% ctrlHandler
	return {X:coordsX,Y:coordsY,W:coordsW,H:coordsH}
}