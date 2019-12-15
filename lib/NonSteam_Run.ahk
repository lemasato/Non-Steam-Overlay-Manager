NonSteam_Run(_launcher, _game, launchParams) {
	global ProgramValues, NSO_OVERLAY_ENABLED, AllowedProcessForOverlay, OVERLAY_PID, RESTRICT_NSO_OVERLAY_HOTKEY
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
		if (!game && !gameDir) {
			noGameDir := True
			game := _game
		}

		else {
			SplitPath, game, gameFileName
			if (gameLaunchParams)
				game := game " " gameLaunchParams
		}
	}

	AllowedProcessForOverlay .= gameFileName?"," gameFileName : ""
	AllowedProcessForOverlay .= launcherFileName?"," launcherFileName : ""

	if (launcher) {
		GoSub NonSteam_Run_GetExistingInstances

		Run,% launcher " " launchParams,% launcherDir, , launcherPID ; Run launcher, using its directory as WorkingDir
		Menu,Tray,Tip,% ProgramValues.Name "`nWaiting for a new instance: " gameFileName

		Loop {
			Gosub, NonSteam_Run_WaitNewInstance
			if (gamePID) {
				Break
			}
			Sleep 1000
		}

		for Item in ComObjGet( "winmgmts:" ).ExecQuery("Select * from Win32_Process") {
			Commandline := Item.Commandline
			StringReplace Parameters, Commandline, % Item.ExecutablePath
			StringReplace Parameters, Parameters, ""
			if (Trim(Parameters) <> "") && (Item.Name = gameFileName) {
				exePath := Item.ExecutablePath
				SplitPath, exePath, , exeFolder
				MsgBox % "Name: " Item.Name "`n`nParameters: " Parameters
				Break
			}
		}
		Process, Close,% gameFileName
		Process, WaitClose,% gameFileName
		Run,% exePath " " Parameters,% exeFolder, , gamePID
		WinWait, ahk_pid %gamePID%
	}
	else {
		if (noGameDir) {
			; ShowToolTip(_tip, tipX=0, tipY=0, radiusX=10, radiusY=10, coord="", whichtooltip="")
			Run,% game

			ShowToolTip("Unable to get the game's location from its shortcut." ; ontop+exclamation
			. "`nThis could be due to it being a Windows Store game."
			. "`n"
			. "`nThe NSO Overlay hotkey will be forced to be global, and will be working with any window."
			. "`n" ProgramValues.Name " will be unable to close itself automatically upon game closure."
			. "", "", "", 50, 50)
			RESTRICT_NSO_OVERLAY_HOTKEY := "0"
			SetTimer, NonSteam_Run_RemoveToolTip, -10000
		}
		else {
			Run,% game " " launchParams,% gameDir, , gamePID
			WinWait, ahk_pid %gamePID%
		}
	}

	if (NSO_OVERLAY_ENABLED) {
		NSOOverlayHotkey := INI.Get(ProgramValues.Ini_File, "NSO_Overlay", "Hotkey_SimpleString")
		Menu,Tray,Tip,% ProgramValues.Name "`nNSO Overlay Hotkey: " NSOOverlayHotkey
	}
	else {
		Menu,Tray,Tip,% ProgramValues.Name "`n" gameFileName " is running (PID " gamePID ")"
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

	ProgramValues.GamePID := gamePID
	Return

	NonSteam_Run_RemoveToolTip:
		RemoveToolTip()
	Return

	NonSteam_Run_GetExistingInstances:
		pidList := Get_Windows_PID(gameFileName, "ahk_exe", ",")
	Return

	NonSteam_Run_WaitNewInstance:
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