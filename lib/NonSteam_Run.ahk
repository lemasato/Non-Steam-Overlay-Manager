NonSteam_Run(_launcher, _game, launchParams) {
	global ProgramValues, NSO_OVERLAY_ENABLED, AllowedProcessForOverlay, OVERLAY_PID
	static gamePID, noLauncherCount, launcherPID

	SplitPath, _launcher, launcherFileName, launcherDir, launcherFileExt ; Get launcher folder path
	SplitPath, _game, gameFileName, gameDir, gameFileExt
	launcher := _launcher, game := _game

	if (launcherFileExt = "lnk") {
		FileGetShortcut,% _launcher, launcher, launcherDir, launcherLaunchParams
		SplitPath, launcher, launcherFileName
		if (launcherLaunchParams)
			launcher := launcher " " launcherLaunchParams
	}
	if (gameFileExt = "lnk") {
		FileGetShortcut,% _game, game, gameDir, gameLaunchParams
		SplitPath, game, gameFileName
		if (gameLaunchParams)
			game := game " " gameLaunchParams
	}

	AllowedProcessForOverlay .= "," gameFileName "," launcherFileName

	if (launcher) {
		GoSub NonSteam_Run_GetExistingInstances

		Run,% launcher " " launchParams,% launcherDir, launcherPID ; Run launcher, using its directory as WorkingDir
		Menu,Tray,Tip,% ProgramValues.Name "`nWaiting for a new instance to start.`n" game

		Loop {
			Gosub, NonSteam_Run_WaitNewInstance
			if (gamePID) {
				Break
			}
			Sleep 5000
		}
	}
	else {
		Run,% game " " launchParams,% gameDir, , gamePID
		WinWait, ahk_pid %gamePID%
	}

	if (NSO_OVERLAY_ENABLED) {
		NSOOverlayHotkey := INI.Get(ProgramValues.Ini_File, "NSO_Overlay", "Hotkey")
		Menu,Tray,Tip,% ProgramValues.Name "`nGame is running (PID " gamePID ")`n" game "`n`nNSO Overlay Hotkey: " NSOOverlayHotkey
	}
	else {
		Menu,Tray,Tip,% ProgramValues.Name "`nGame is running (PID " gamePID ")`n" game
	}

	; Make sure Steam and the game are running with same rights.
	; If the game is elevated but Steam is not, then the GameOverlayUI.exe by steam will be unable to hook in our tool.
	; Also, if the game is elvated but our tool is not, then the NSO Overlay hotkey won't be working.
	gameProcessInfos := Get_ProcessInfos(gameFileName, gamePID)
	steamOverlayProcessInfos := Get_ProcessInfos("Steam.exe")

	isGameElevated := (gameProcessInfos[1]["TokenIsElevated"])?(True):(gameProcessInfos=2)?(True):(False)
	isSteamOverlayElevated := (steamOverlayProcessInfos[1]["TokenIsElevated"])?(True):(steamOverlayProcessInfos=2)?(True):(False)

	if (NSO_OVERLAY_ENABLED) {
		nsoOverlayProcessInfos := Get_ProcessInfos("NSO Overlay.exe", OVERLAY_PID)
		isNSOOverlayElevated := (nsoOverlayProcessInfos[1]["TokenIsElevated"])?(True):(nsoOverlayProcessInfos=2)?(True):(False)

		if (isGameElevated && (!isNSOOverlayElevated || !isSteamOverlayElevated)) {
			Msgbox,% 48+4096,% ProgramValues.Name,% "The game process (" gameFileName " | " gamePID ") is running as elevated but Steam is not. You may be unable to use the NSO Overlay until you restart Steam with elevated rights."
		}
	}
	else {
		if (isGameElevated && !isSteamOverlayElevated) {
			Msgbox,% 48+4096,% ProgramValues.Name,% "The game process (" gameFileName " | " gamePID ") is running as elevated but Steam is not. You may be unable to use the Steam Overlay until you restart Steam with elevated rights."
		}
	}
	
	Process, WaitClose,% gamePID
	Process, Close, NSO Overlay.exe
	Return

	NonSteam_Run_GetExistingInstances:
		pidList := Get_Windows_PID(gameFileName, "ahk_exe", ",")
	Return

	NonSteam_Run_WaitNewInstance:
		newPidList := ""

		if (noLauncherCount > 10) {
			launcherCloseElapsed := A_Now
			EnvSub, launcherCloseElapsed, %launcherCloseTime%, Minutes
			MsgBox % "The launcher window has been closed for " launcherCloseElapsed " minutes and no new game instance has been detected ever since.`n`n" ProgramValues.Name " will therefore be closing."
			ExitApp
		}
		if !WinExist("ahk_pid " launcherPID) {
			if (!launcherCloseTime)
				launcherCloseTime := A_Now
			noLauncherCount++
		}

		newPidList := Get_Windows_PID(gameFileName, "ahk_exe", ",")

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