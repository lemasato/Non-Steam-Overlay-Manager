'------------------------------------------------------------------------------------------------
'	This script allows the use of the Steam Overlay in games that uses a launcher (mostly mmos)  
'	It requires minimal set-up and should be working for every games.
'
'	Please! Make sure to read the ENTIRE commented section in order to set everything up!
'	GitHub Link: https://github.com/lemasato/Steam-Overlay-for-Launchers
'
'		SETTINGS UP THE .VBS:
'		- Save the .vbs script inside the game's folder
'		- Run the script once
'			LAUNCHER: This is what you run the game with (game updater)
'			CLIENT: This is what the launcher starts to run the game
'					To find the CLIENT, run the game as you would do normally
'					Right click on the startup bar > open task manager
'					On the "Applications" tab:
'						Right click on your game, choose "Go to the process"
'					On the "Processes" tab:
'						Right click on the process, choose "Open file location"
'					A folder will open, the pointed file is the CLIENT.exe
'		- Keep following the steps
'
'		WARNING!! If you run the game from a shortcut, the script may not work! BUT!! There is a workaround.
'		You will have to edit the .ini file and point the "Launcher" to the shortcut (.lnk) instead of the application (.exe)
'		DO NOT USE QUOTES IN THE .INI FILE!! Simply copy and paste the shortcut (.lnk) location to the "Launcher" value.
'
'
'		SETTING UP THE NON-STEAM GAME:
'		- Open Steam, click on "Games > Add a Non-Steam Game to My Library"
'		- Browse to your game folder, select any .exe and add it.
'		- Now Find your game in your Steam Library, right click > properties.
'		- Change the "Target" field to (quotes included):  
'  			"C:\Windows\System32\cscript.exe" "GameDirectory\SteamOverlayFix.vbs"  
'			Example: "D:\Jeux\Grand Fantasia\Launcher.exe"  
'			Becomes: "C:\Windows\System32\cscript.exe" "D:\Jeux\Grand Fantasia\SteamOverlayFix.vbs"  
'		- Feel free to click on "Choose Icon" and select whichever .exe's icon you like the most.
'
'	You're now set to go! Running the shortcut from Steam should let you use the Steam Overlay while playing your favorite games!
'
'
'	THANKS TO: Karmond for the original script.
'				  http://us.battle.net/hearthstone/en/forum/topic/9882829213?page=1#14
'			   Kirsch for his shorter version (which is the one here)
'				  http://us.battle.net/hearthstone/en/forum/topic/9882829213?page=4#68
'			   Creators of the ReadIni WriteIni BrowseForFile functions (credited in said functions)
'	
'	version: 1.01 (15/01/16)																	-masato
'------------------------------------------------------------------------------------------------

OPTION EXPLICIT
DIM gameLauncher
DIM gameClient
DIM scriptHome
DIM objShell
DIM objWMIService
DIM objInstanceList
DIM objInstance
DIM commandLine
DIM objFile
DIM lName
DIM lPath
DIM cName
DIM cPath

DIM iniFile
iniFile = "SteamOverlayFix.ini"
DIM scriptDir
scriptDir = Replace(WScript.ScriptFullName, WScript.ScriptName, "") 


'Sets current script dir as default dir
	Replace WScript.ScriptFullName, WScript.ScriptName, ""

'Ensures SteamOverlayFix.ini exists, if not creates it
	Dim oFSO, oTxtFile
	Set oFSO = CreateObject("Scripting.FileSystemObject") 
	If oFSO.FileExists(iniFile)  Then
	Else 
		WriteIni scriptDir & iniFile, "General", "Launcher", ""
	End If

'Retrieves launcher/client path from .ini or ask user to point them
	gameLauncher = ReadIni(iniFile, "General", "Launcher")
	if gameLauncher = "" or gameLauncher = " " Then
		MSGBOX "Select the LAUNCHER please"
		WriteIni scriptDir & iniFile, "General", "Launcher", BrowseForFile()
		gameLauncher = ReadIni(iniFile, "General", "Launcher")
	end if
	
	gameClient = ReadIni(iniFile, "General", "Client")
	if gameClient = "" or gameClient = " " Then
		MSGBOX "Select the CLIENT please"
		WriteIni scriptDir & iniFile, "General", "Client", BrowseForFile()
		gameClient = ReadIni(iniFile, "General", "Client")
	end if
	
	
'Divide the full path into two variables containing respectively
'only the .exe and only the path without the .exe
	Set objFile = oFSO.GetFile(gameLauncher)
	lName = objFile.Name
	lPath = objFile.Path
	lPath = Left(lPath, Len(lPath)-Len(lName))
	
	Set objFile = oFSO.GetFile(gameClient)
	cName = objFile.Name
	cPath = objFile.Path
	cPath = Left(cPath, Len(cPath)-Len(cName))
		
'Here comes the script	
	scriptHome = WScript.ScriptFullName
	scriptHome = Left(scriptHome, InStr(scriptHome, WScript.ScriptName) - 1)

	WScript.Echo "[1/5] starting laucher"
	SET objShell = WScript.CreateObject("Shell.Application")
	objShell.ShellExecute lName, "", lPath

	WScript.Echo "[2/5] waiting for launcher to start game..."
	SET objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	DO WHILE TRUE
		SET objInstanceList = objWMIService.ExecQuery("Select * from Win32_Process Where Name = '" & cName & "'")
		FOR EACH objInstance IN objInstanceList
		WScript.Echo "[3/5] game instance detected"
		commandLine = objInstance.CommandLine
 
		WScript.Echo "[4/5] killing game instance"
		objInstance.Terminate()
		EXIT DO
		NEXT
		WScript.Sleep 1000
	LOOP

	commandLine = Right(commandLine, Len(commandLine) - (InStr(1, commandLine, """ ") + 1))

	WScript.Echo "[5/5] starting game again"
	SET objShell = CreateObject("Shell.Application")
	objShell.ShellExecute cName, commandLine, cPath









Function ReadIni( myFilePath, mySection, myKey )
    ' This function returns a value read from an INI file
    '
    ' Arguments:
    ' myFilePath  [string]  the (path and) file name of the INI file
    ' mySection   [string]  the section in the INI file to be searched
    ' myKey       [string]  the key whose value is to be returned
    '
    ' Returns:
    ' the [string] value for the specified key in the specified section
    '
    ' CAVEAT:     Will return a space if key exists but value is blank
    '
    ' Written by Keith Lacelle
    ' Modified by Denis St-Pierre and Rob van der Woude

    Const ForReading   = 1
    Const ForWriting   = 2
    Const ForAppending = 8

    Dim intEqualPos
    Dim objFSO, objIniFile
    Dim strFilePath, strKey, strLeftString, strLine, strSection

    Set objFSO = CreateObject( "Scripting.FileSystemObject" )

    ReadIni     = ""
    strFilePath = Trim( myFilePath )
    strSection  = Trim( mySection )
    strKey      = Trim( myKey )

    If objFSO.FileExists( strFilePath ) Then
        Set objIniFile = objFSO.OpenTextFile( strFilePath, ForReading, False )
        Do While objIniFile.AtEndOfStream = False
            strLine = Trim( objIniFile.ReadLine )

            ' Check if section is found in the current line
            If LCase( strLine ) = "[" & LCase( strSection ) & "]" Then
                strLine = Trim( objIniFile.ReadLine )

                ' Parse lines until the next section is reached
                Do While Left( strLine, 1 ) <> "["
                    ' Find position of equal sign in the line
                    intEqualPos = InStr( 1, strLine, "=", 1 )
                    If intEqualPos > 0 Then
                        strLeftString = Trim( Left( strLine, intEqualPos - 1 ) )
                        ' Check if item is found in the current line
                        If LCase( strLeftString ) = LCase( strKey ) Then
                            ReadIni = Trim( Mid( strLine, intEqualPos + 1 ) )
                            ' In case the item exists but value is blank
                            If ReadIni = "" Then
                                ReadIni = " "
                            End If
                            ' Abort loop when item is found
                            Exit Do
                        End If
                    End If

                    ' Abort if the end of the INI file is reached
                    If objIniFile.AtEndOfStream Then Exit Do

                    ' Continue with next line
                    strLine = Trim( objIniFile.ReadLine )
                Loop
            Exit Do
            End If
        Loop
        objIniFile.Close
    Else
        WScript.Echo strFilePath & " doesn't exists. Exiting..."
        Wscript.Quit 1
    End If
End Function

Sub WriteIni( myFilePath, mySection, myKey, myValue )
    ' This subroutine writes a value to an INI file
    '
    ' Arguments:
    ' myFilePath  [string]  the (path and) file name of the INI file
    ' mySection   [string]  the section in the INI file to be searched
    ' myKey       [string]  the key whose value is to be written
    ' myValue     [string]  the value to be written (myKey will be
    '                       deleted if myValue is <DELETE_THIS_VALUE>)
    '
    ' Returns:
    ' N/A
    '
    ' CAVEAT:     WriteIni function needs ReadIni function to run
    '
    ' Written by Keith Lacelle
    ' Modified by Denis St-Pierre, Johan Pol and Rob van der Woude

    Const ForReading   = 1
    Const ForWriting   = 2
    Const ForAppending = 8

    Dim blnInSection, blnKeyExists, blnSectionExists, blnWritten
    Dim intEqualPos
    Dim objFSO, objNewIni, objOrgIni, wshShell
    Dim strFilePath, strFolderPath, strKey, strLeftString
    Dim strLine, strSection, strTempDir, strTempFile, strValue

    strFilePath = Trim( myFilePath )
    strSection  = Trim( mySection )
    strKey      = Trim( myKey )
    strValue    = Trim( myValue )

    Set objFSO   = CreateObject( "Scripting.FileSystemObject" )
    Set wshShell = CreateObject( "WScript.Shell" )

    strTempDir  = wshShell.ExpandEnvironmentStrings( "%TEMP%" )
    strTempFile = objFSO.BuildPath( strTempDir, objFSO.GetTempName )

    Set objOrgIni = objFSO.OpenTextFile( strFilePath, ForReading, True )
    Set objNewIni = objFSO.CreateTextFile( strTempFile, False, False )

    blnInSection     = False
    blnSectionExists = False
    ' Check if the specified key already exists
    blnKeyExists     = ( ReadIni( strFilePath, strSection, strKey ) <> "" )
    blnWritten       = False

    ' Check if path to INI file exists, quit if not
    strFolderPath = Mid( strFilePath, 1, InStrRev( strFilePath, "\" ) )
    If Not objFSO.FolderExists ( strFolderPath ) Then
        WScript.Echo "Error: WriteIni failed, folder path (" _
                   & strFolderPath & ") to ini file " _
                   & strFilePath & " not found!"
        Set objOrgIni = Nothing
        Set objNewIni = Nothing
        Set objFSO    = Nothing
        WScript.Quit 1
    End If

    While objOrgIni.AtEndOfStream = False
        strLine = Trim( objOrgIni.ReadLine )
        If blnWritten = False Then
            If LCase( strLine ) = "[" & LCase( strSection ) & "]" Then
                blnSectionExists = True
                blnInSection = True
            ElseIf InStr( strLine, "[" ) = 1 Then
                blnInSection = False
            End If
        End If

        If blnInSection Then
            If blnKeyExists Then
                intEqualPos = InStr( 1, strLine, "=", vbTextCompare )
                If intEqualPos > 0 Then
                    strLeftString = Trim( Left( strLine, intEqualPos - 1 ) )
                    If LCase( strLeftString ) = LCase( strKey ) Then
                        ' Only write the key if the value isn't empty
                        ' Modification by Johan Pol
                        If strValue <> "<DELETE_THIS_VALUE>" Then
                            objNewIni.WriteLine strKey & "=" & strValue
                        End If
                        blnWritten   = True
                        blnInSection = False
                    End If
                End If
                If Not blnWritten Then
                    objNewIni.WriteLine strLine
                End If
            Else
                objNewIni.WriteLine strLine
                    ' Only write the key if the value isn't empty
                    ' Modification by Johan Pol
                    If strValue <> "<DELETE_THIS_VALUE>" Then
                        objNewIni.WriteLine strKey & "=" & strValue
                    End If
                blnWritten   = True
                blnInSection = False
            End If
        Else
            objNewIni.WriteLine strLine
        End If
    Wend

    If blnSectionExists = False Then ' section doesn't exist
        objNewIni.WriteLine
        objNewIni.WriteLine "[" & strSection & "]"
            ' Only write the key if the value isn't empty
            ' Modification by Johan Pol
            If strValue <> "<DELETE_THIS_VALUE>" Then
                objNewIni.WriteLine strKey & "=" & strValue
            End If
    End If

    objOrgIni.Close
    objNewIni.Close

    ' Delete old INI file
    objFSO.DeleteFile strFilePath, True
    ' Rename new INI file
    objFSO.MoveFile strTempFile, strFilePath

    Set objOrgIni = Nothing
    Set objNewIni = Nothing
    Set objFSO    = Nothing
    Set wshShell  = Nothing
End Sub

'Bypasses IE7+ c:\fakepath\file.txt problem
Function BrowseForFile()
    With CreateObject("WScript.Shell")
        Dim fso : Set fso = CreateObject("Scripting.FileSystemObject")
        Dim tempFolder : Set tempFolder = fso.GetSpecialFolder(2)
        Dim tempName : tempName = fso.GetTempName() & ".hta"
        Dim path : path = "HKCU\Volatile Environment\MsgResp"
        With tempFolder.CreateTextFile(tempName)
            .Write "<input type=file name=f>" & _
            "<script>f.click();(new ActiveXObject('WScript.Shell'))" & _
            ".RegWrite('HKCU\\Volatile Environment\\MsgResp', f.value);" & _
            "close();</script>"
            .Close
        End With
        .Run tempFolder & "\" & tempName, 1, True
        BrowseForFile = .RegRead(path)
        .RegDelete path
        fso.DeleteFile tempFolder & "\" & tempName
    End With
End Function

