Class INI {

	Get(file, sect="", key="") {

		if (!sect) {
			IniRead, allSections,% file
			Return allSections
		}

		if (sect && key) {
			IniRead, val,% file,% sect,% key
			if (val && val != "ERROR") || (val = 0)
				Return val
			else Return "ERROR"
		}
		else if (sect && !key) {
			IniRead, allKeys,% file,% sect

			keyAndValuesArr := {}
			Loop, Parse, allKeys,% "`n"
			{
				keyAndValue := A_LoopField
				if RegExMatch(keyAndValue, "(.*)=(.*)", found) {
					keyName := found1, value := found2
					keyAndValuesArr.Insert(found1, found2)
					found1 := "", found2 := ""
				}
			}
			return keyAndValuesArr
		}
	}

	Remove(file, sect, key="") {
		if (!key) {
			IniDelete,% file,% sect
			Return
		}

		IniDelete,% file,% sect,% key
	}

	Rename(file, curSect, curKey="", newSect="", newKey="") {

		quote := """"

		if (!file && !curSect && !curKey) {
			; No param specified. Help box.
			MsgBox % "Class_INI.ahk: Usage."
			.		 "`nINI.Rename(file, curSect, curKey=" quote ", newSect=" quote ", newKey=" quote ")"
			.		 "`n"
			.		 "`nINI.Rename(file, curSect, , newSect)"
			.		 "`nMakes a copy of all keys from the curSect section to the newSect section."
			.		 "`nDeletes the curSect section afterwards."
			.		 "`n"
			.		 "`nINI.Rename(file, curSect, curKey, newSect, newKey)"
			.		 "`nINI.Rename(file, curSect, curKey, , newKey)"
			.		 "`nMakes a copy of the selected key from the curSect section to the newSect section."
			.		 "`nDeletes the curKey key from the curSect section afterwards."
			.		 "`nIf unspecified, the newSect parameter will be the same as the curSect parameter."
			Return
		}

		if !FileExist(file) {
			; Inexistent file.
			MsgBox % "Class_INI.ahk: Specified file does not exist: " file
			Return
		}


		newSect := (!newSect && newSect != 0)?(curSect):(newSect)
		newKey := (!newKey && newKey != 0)?(curKey):(newKey)

		if (newSect && !newKey) {
			; No key provided.
			; Copy content from one sect to another and delete the original.

			keysAndValues := INI.Get(file, curSect)

			IniDelete,% file,% curSect
			for key, value in keysAndValues {
				IniWrite,% value,% file,% newSect,% key
			}
		}
		else if (newSect && newKey) && (curSect != newSect || curKey != curKey) {
			; New sect and key exists. And either of them is different from the original.
			; Set the new key and delete the original.

			IniRead, value,% file,% curSect,% curKey
			IniDelete,% file,% newSect,% newKey
			IniWrite,% value,% file,% newSect,% newKey
		}
		else {
			; No matching conditions.
			MsgBox % "Class_INI.ahk: Innapropriate use of the function."
			.		 "`nUse the function without parameters for documentation."
		}
	}

	Set(file, sect, key, value) {
		IniWrite,% value,% file,% sect,% key
	}
}