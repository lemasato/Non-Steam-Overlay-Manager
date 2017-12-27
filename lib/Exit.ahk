Exit(ExitReason, ExitCode) {
	global OVERLAY_PID

	if ExitReason not in Reload
	{
		ShellMessage_Disable()
		WinGet, pName, ProcessName, ahk_pid %OVERLAY_PID%
		if (pName = "NSO Overlay.exe")
			Process, Close, %OVERLAY_PID%
		Process, Close, NSO Overlay.exe
		ExitApp
	}
}