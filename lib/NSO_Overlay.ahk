NSO_Overlay_Toggle(force="") {
	global OVERLAY_PID, OVERLAY_TOGGLE
	static previousWin
	OVERLAY_TOGGLE := !OVERLAY_TOGGLE

	if (force = "On")
		OVERLAY_TOGGLE := True
	else if (force = "Off")
		OVERLAY_TOGGLE := False

	DetectHiddenWindows, On
	if (OVERLAY_TOGGLE) {
		WinGetPos, overlayX, overlayY, overlayW, overlayH, ahk_pid %OVERLAY_PID%
		WinGetPos, windowX, windowY, windowW, windowH, A
		previousWin := WinActive("A")

		WinSet, Trans, 0, ahk_pid %OVERLAY_PID%
		WinShow, ahk_pid %OVERLAY_PID%
		WinActivate, ahk_pid %OVERLAY_PID%

		if (overlayX != windowX || overlayY != windowY || overlayW != windowW || overlayH != windowH) {
			if ( (windowX || windowX=0) && (windowY || windowY=0) && (windowW || windowW=0) && (windowH || windowH=0) ) {
				WinMove, ahk_pid %OVERLAY_PID%, , %windowX%, %windowY%, %windowW%, %windowH%
			}
			else {
				WinMove, ahk_pid %OVERLAY_PID%, , 0, 0,% A_ScreenWidth,% A_ScreenHeight
			}
		}

		WinSet, Trans, 220, ahk_pid %OVERLAY_PID%
	}
	else {
		WinHide, ahk_pid %OVERLAY_PID%
		WinActivate, ahk_id %previousWin%
	}

	DetectHiddenWindows, Off

	Hotkey, %A_ThisHotkey%, Off
	Hotkey, %A_ThisHotkey%, On
}

NSO_Overlay_Run() {
	global ProgramValues, OVERLAY_PID, ProgramSettings
	static steamFolder, steamUILogContent
	iniFile := ProgramValues.Ini_File

	detectHiddenWin := A_DetectHiddenWindows
	DetectHiddenWindows, On

	overlayPID := INI.Get(iniFile, "NSO_Overlay", "PID")

	if WinExist("ahk_exe NSO Overlay.exe ahk_pid " overlayPID) {
		Process, Close, %overlayPID%
		Process, WaitClose, %overlayPID%, 5
		MsgBox,% 48+4096,% ProgramValues.Name,NSO Overlay.exe already exists, unable to kill its process. Please manually kill the process and restart the tool. The tool will now be closing.
		ExitApp
	}

	WinGet, steamExePath, ProcessPath, ahk_exe Steam.exe
	SplitPath, steamExePath, , steamFolder
	FileRead, steamUILogContent,% steamFolder "\GameOverlayUI.exe.log"
	FileDelete,% steamFolder "\GameOverlayUI.exe.log"

	Run,% ProgramValues.NSO_Overlay " -popupwindow", , Hide, OVERLAY_PID
	INI.Set(iniFile, "NSO_Overlay", "PID", OVERLAY_PID)
	WinWait, ahk_pid %OVERLAY_PID%
	DetectHiddenWindows, %detectHiddenWin%
	
	SetTimer, NSO_Overlay_Run_Styles, -3000
	SetTimer, NSO_Overlay_Run_SteamOverlay, -10000
	SetTimer, NsO_Overlay_Run_ReadUILogs, -5000
	Return

	NsO_Overlay_Run_ReadUILogs:
		steamUILogContentNew := ""
		FileRead, steamUILogContentNew,% steamFolder "\GameOverlayUI.exe.log"
		if !(steamUILogContentNew && steamUILogContentNew != steamUILogContent) {
			SetTimer,% A_ThisLabel, -1000
			Return
		}

		if (IsContaining(steamUILogContentNew, "Generating new") IsContaining(steamUILogContentNew, OVERLAY_PID)) {
			; __TO_BE_ADDED__: Logs
			; Can confirm, PID hooked
		}

		else if (IsContaining(steamUILogContentNew, "Generating new")) {
			; __TO_BE_ADDED__: Logs
			; All good, probably
		}
		else if (IsContaining(steamUILogContentNew, "Shutting down") && IsContaining(steamUILogContentNew, OVERLAY_PID)) {
			; __TO_BE_ADDED__: Logs
			; Our PID was unable to get Steam hooked
			MsgBox,% 48+4096,% ProgramValues.Name,It seems the Steam Overlay failed to connect with NSO Overlay, please try restarting the tool.
		}
	Return

	NSO_Overlay_Run_Styles:
		WinSet, ExStyle, +0x80, ahk_pid %OVERLAY_PID% ; ToolWindow Style. Hide from taskbar.
		WinSet, Style, -0xc40000, ahk_pid %OVERLAY_PID% ; Borderless Style.
	Return

	NSO_Overlay_Run_SteamOverlay:
		BlockInput, On ; Only work if elevated

		detectHiddenWin := A_DetectHiddenWindows
		DetectHiddenWindows, On
		WinMove, ahk_pid %OVERLAY_PID%, , 0, 0, 0, 0
		WinShow, ahk_pid %OVERLAY_PID%

		keyDelay := A_KeyDelay
		keyDuration := A_KeyDuration
		SetKeyDelay, 50

		curWin := WinActive("A")
		WinActivate, ahk_pid %OVERLAY_PID%
		WinWaitActive, ahk_pid %OVERLAY_PID%
		Sleep 250
		WinActivate, ahk_pid %OVERLAY_PID%
		Sleep 250
		SendEvent,% ProgramSettings.Steam_Overlay.Hotkey_String

		Sleep 10
		WinActivate, ahk_id %curWin%
		SetKeyDelay, %keyDelay%, %keyDuration%
		DetectHiddenWindows, %detectHiddenWin%

		WinHide, ahk_pid %OVERLAY_PID%
		BlockInput, Off ; Only work if elevated
	Return

}