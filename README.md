## NSO Manager  
Use the Steam Overlay in **any** game.  

*The interface for this tool is still in development.*  
*Main core features are already available.*  

https://discord.gg/UMxqtfC  

### How do I use it?  
1. Head to the [releases](https://github.com/lemasato/Non-Steam-Overlay-Manager/releases) tab to download the latest NSO-Manager.exe.  
1. Then, simply run the executable to set up your profiles and settings. When finished, head to your Steam library.  
1. Add the executable as a non-steam game. Right click on it in your library > Properties. Click on "Set launch options".  
1. Put in: /Profile="Profile Name". For example, if your profile name is "Final Fantasy", use: /Profile="Final Fantasy".  
1. Click on "Ok". Feel free to rename the shortcut as you wish.  
1. Run the tool from your library.  

To add another game, the steps from 3-6.  

### How do I add a Windows Store Game?

1. Create a shortcut for your game:
Press Win+R and type: `shell:AppsFolder`. Find your game, right click on it, create a shortcut.  
The newly created shortcut will be on your desktop, but you can move it wherever you want.

1. Run NSO Manager and set up a profile that uses the newly created shortcut.

1. Make sure that you have "Use NSO Overlay" enabled and "NSO Overlay shortcut" configured.  

1. Make sure that the box "Restrict NSO Overlay shortcuts to the game window only" in **unticked**.

### Does it really work for any game?  
It does.  
Even though some games do not allowed Steam to hook their overlay to their process, we can still work around it by hooking the Steam overlay to an external process: NSO Overlay.  
The NSO Overlay is entirely safe to use, as it was made using Unity Engine.

As I will be repeating similar terms multiple times, I will try to make it clear and avoid confusion:  
"Steam Overlay" - This is the Overlay used by Steam. The one which allows you to speak with your friends and use its integrated browser.  
"Steam Overlay shortcut" - This is the key combination you normally press to toggle your Steam Overlay.  
"NSO Overlay" - This is our external application that can be used when your game does not allow overlays to be hooked.  
"NSO Overlay shortcut" - This is the key combination you will be using to toggle the external overlay provided by our tool.  
When the NSO Overlay is enabled, we run our own external application with the Steam Overlay hooked on it.  
Once the NSO Overlay is running, we send your Steam Overlay shortcut to its window, so that the Steam Overlay is automatically toggled on when you toggle on the NSO Overlay.  

### How do I enable the NSO Overlay?  
First, make sure that your game is running Windowed or Borderless.  

To enable the NSO Overlay:  
1. Enable the "Use NSO Overlay" setting.  
1. Set the hotkey you normally use to toggle the Steam Overlay.  
1. Set another hotkey you will be using to toggle the NSO Overlay.  
This hotkey has to be different than the one used for Steam.  
1. Once in-game, press your NSO Overlay hotkey.  
The screen will fade to black, and you should now be able to see the Steam Overlay.  
If you cannot see the Steam Overlay, simply press your "Steam Overlay" hotkey.  
If for some reason it still doesn't work, try running Steam with elevated (admin) rights to avoid any issue.  
