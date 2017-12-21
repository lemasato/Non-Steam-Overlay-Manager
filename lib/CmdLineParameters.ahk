Get_CmdLineParameters() {
	global 0
	global ProgramValues

	programName := ProgramValues.Name

	params := []
	Loop, %0% {
		param := %A_Index%
		params.Push(param)
	}
	return params
}
