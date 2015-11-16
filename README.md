This script allows the use of the Steam Overlay in games that uses a launcher (mostly mmos)  
It requires minimal set-up and should be working for every games.
  - Save the script inside the game's directory.
  - Open Steam and click on "Games > Add a Non-Steam Game to My Library"
  - Browse to your game folder, select the launcher.exe and add it.
  - Now Find your game in your Steam Library, right click > properties.
  - Change the "Target" field to (quotes included):  
  "C:\Windows\System32\cscript.exe" "GameDirectory\SteamOverlayFix.vbs"  
	Example: "D:\Jeux\Grand Fantasia\Launcher.exe"  
	Becomes: "C:\Windows\System32\cscript.exe" "D:\Jeux\Grand Fantasia\SteamOverlayFix.vbs"  
  - Feel free to click on "Choose Icon" and select whichever .exe's icon you like the most.  
You're now set to go! Running the shortcut from Steam should let you use the Steam Overlay while playing your favorite games!
	 
Download: https://github.com/lemasato/Steam-Overlay-for-Launchers/releases/download/1.0/SteamOverlayFixv1.0.zip
