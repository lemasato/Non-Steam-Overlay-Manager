ExternalOverlay_Toggle() {
	global OVERLAY_PID, OVERLAY_TOGGLE
	static previousWin
	OVERLAY_TOGGLE := !OVERLAY_TOGGLE

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

ExternalOverlay_Run() {
	global ProgramValues, OVERLAY_PID, ProgramSettings
	iniFile := ProgramValues.Ini_File

	detectHiddenWin := A_DetectHiddenWindows
	DetectHiddenWindows, On

	overlayPID := INI.Get(iniFile, "External_Overlay", "PID")

	if WinExist("ahk_exe Overlay.exe ahk_pid " overlayPID)
		Return

	Run,% ProgramValues.External_Overlay " --in-process-gpu", , Hide, OVERLAY_PID
	INI.Set(iniFile, "External_Overlay", "PID", OVERLAY_PID)
	WinWait, ahk_pid %OVERLAY_PID%
	DetectHiddenWindows, %detectHiddenWin%

	SetTimer, ExternalOverlay_Run_Styles, -3000
	SetTimer, ExternalOverlay_Run_SteamOverlay, -10000
	Return

	ExternalOverlay_Run_Styles:
		WinSet, ExStyle, +0x80, ahk_pid %OVERLAY_PID% ; ToolWindow Style. Hide from taskbar.
		WinSet, Style, -0xc40000, ahk_pid %OVERLAY_PID% ; Borderless Style.
	Return

	ExternalOverlay_Run_SteamOverlay:
		BlockInput, On

		detectHiddenWin := A_DetectHiddenWindows
		DetectHiddenWindows, On

		keyDelay := A_KeyDelay
		keyDuration := A_KeyDuration
		SetKeyDelay, 50

		curWin := WinActive("A")
		WinActivate, ahk_pid %OVERLAY_PID%
		WinWaitActive, ahk_pid %OVERLAY_PID%
		Sleep 1000
		WinActivate, ahk_pid %OVERLAY_PID%
		SendEvent,% ProgramSettings.Steam_Overlay.Hotkey_String
		Sleep 1000

		WinActivate, ahk_id %curWin%
		SetKeyDelay, %keyDelay%, %keyDuration%
		DetectHiddenWindows, %detectHiddenWin%

		BlockInput, Off
	Return

}