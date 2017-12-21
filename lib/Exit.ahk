Exit(ExitReason, ExitCode) {
	global OVERLAY_PID

	if ExitReason not in Reload
	{
		ShellMessage_Disable()
		WinGet, pName, ProcessName, ahk_pid %OVERLAY_PID%
		if (pName = "ExternalOverlay.exe")
			Process, Close, %OVERLAY_PID%
		ExitApp
	}
}