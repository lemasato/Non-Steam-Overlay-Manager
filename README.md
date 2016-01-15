This script allows the use of the Steam Overlay in games that uses a launcher (mostly mmos)  
It requires minimal set-up and should be working for every games.  
  
Please! Make sure to read the ENTIRE commented section in order to set everything up!  
GitHub Link: https://github.com/lemasato/Steam-Overlay-for-Launchers  
  
SETTINGS UP THE .VBS:  
- Save the .vbs script inside the game's folder
- Run the script once
	LAUNCHER: This is what you run the game with (game updater)
	CLIENT: This is what the launcher starts to run the game
	To find the CLIENT, run the game as you would do normally
					Right click on the startup bar > open task manager
					On the "Applications" tab:
						Right click on your game, choose "Go to the process"
					On the "Processes" tab:
						Right click on the process, choose "Open file location"
					A folder will open, the pointed file is the CLIENT.exe
		- Keep following the steps
  
		WARNING!! If you run the game from a shortcut, the script may not work! BUT!! There is a workaround.  
		You will have to edit the .ini file and point the "Launcher" to the shortcut (.lnk) instead of the application (.exe)  
		DO NOT USE QUOTES IN THE .INI FILE!! Simply copy and paste the shortcut (.lnk) location to the "Launcher" value.  
  
  
		SETTING UP THE NON-STEAM GAME:  
		- Open Steam, click on "Games > Add a Non-Steam Game to My Library"
		- Browse to your game folder, select any .exe and add it.
		- Now Find your game in your Steam Library, right click > properties.
		- Change the "Target" field to (quotes included):  
  			"C:\Windows\System32\cscript.exe" "GameDirectory\SteamOverlayFix.vbs"  
			Example: "D:\Jeux\Grand Fantasia\Launcher.exe"  
			Becomes: "C:\Windows\System32\cscript.exe" "D:\Jeux\Grand Fantasia\SteamOverlayFix.vbs"  
		- Feel free to click on "Choose Icon" and select whichever .exe's icon you like the most.
  
	You're now set to go! Running the shortcut from Steam should let you use the Steam Overlay while playing your favorite games!  
  
  
	THANKS TO: Karmond for the original script.  
				  http://us.battle.net/hearthstone/en/forum/topic/9882829213?page=1#14  
			   Kirsch for his shorter version (which is the one here)  
				  http://us.battle.net/hearthstone/en/forum/topic/9882829213?page=4#68  
			   Creators of the ReadIni WriteIni BrowseForFile functions (credited in said functions)  
  
	version: 1.01 (15/01/16)																	-masato  
  
Download: 