NonSteam_Run(launcher, game) {
	global ProgramValues, EXTERNAL_OVERLAY_ENABLED
	static gamePID, noLauncherCount, winList, winListBak

	SplitPath, launcher, , launcherDir ; Get launcher folder path
	SplitPath, game, gameFileName, gameDir

	ProgramValues.Game_Executable := gameFileName
	GroupAdd, GameGroup, ahk_exe %gameFileName%

	if (launcher) {
		GoSub NonSteam_Run_GetExistingInstances

		SplitPath, launcher, , launcherDir ; Get launcher folder path
		Run,% launcher,% launcherDir, , launcherPID ; Run launcher, using its directory as WorkingDir
		Menu,Tray,Tip,% ProgramValues.Name "`nWaiting for a new instance to start.`n" game

		WinWait, ahk_exe %gameFileName% ; Wait for the launcher to run the game
		Loop {
			Gosub, NonSteam_Run_WaitNewInstance
			if (gamePID) {
				Break
			}
			Sleep 5000
		}
	}
	else {
		Run,% %gameFileName%,% gameDir, , gamePID
		WinWait, ahk_pid %clientPID%
	}

	if (EXTERNAL_OVERLAY_ENABLED) {
		externalOverlayHotkey := INI.Get(ProgramValues.Ini_File, "External_Overlay", "Hotkey")
		Menu,Tray,Tip,% ProgramValues.Name "`nGame is running (PID " gamePID ")`n" game "`n`nExternal Overlay Hotkey: " externalOverlayHotkey
	}
	else {
		Menu,Tray,Tip,% ProgramValues.Name "`nGame is running (PID " gamePID ")`n" game
	}
	
	WinWaitClose, ahk_exe %gameFileName% ahk_pid %gamePID%
	Return

	NonSteam_Run_GetExistingInstances:
		winList := Get_Windows_List("PID", "EXE", gameFileName)
		for nothing, _pid in winList {
			pidList .= _pid ","
		}

		if (pidList)
			StringTrimRight, pidList, pidList, 1
	Return

	NonSteam_Run_WaitNewInstance:
		newPidList := ""

		if (noLauncherCount > 10) {
			ExitApp
		}
		if !WinExist("ahk_pid " launcherPID)
			noLauncherCount++

		winList := Get_Windows_List("PID", "EXE", gameFileName)

		for nothing, _pid in winList {
			newPidList .= _pid ","
		}
		
		StringTrimRight, newPidList, newPidList, 1

		if (pidList) {
			Loop, Parse, newPidList,% ","
			{
				if A_LoopField not in %pidList%
				{
					gamePID := A_LoopField
					Break
				}
			}
		}
		else {
			gamePID := newPidList
		}
	Return
}