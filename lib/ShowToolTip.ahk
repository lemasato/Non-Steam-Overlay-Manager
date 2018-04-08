ShowToolTip(_tip, tipX="", tipY="", radiusX=10, radiusY=10, _coord="", whichtooltip="") {
/*	Show a tooltip at the cursor position, unless specified.
	Tooltip disappears upon moving the mouse outside specified radius.
*/
	static mouseX, mouseY, tipRadiusX, tipRadiusY, previousTip, sameTipExists, coord
	coord := _coord?_coord : {Mouse:"Screen"} ; Force mouse cmd to use screen if unspecified

;	Get current CoordMode settings and set CoordMode
	coordSettings := CoordMode()
	CoordMode(coord)

;	RemoveToolTip()
	if (_tip = "") {		
		ToolTip, , , ,% whichtooltip
		SetTimer, %A_ThisFunc%_Remove, Delete
		CoordMode(coordSettings) ;	Revert CoordMode settings
		Return
	}

;	Radius and mouse position. Used for removal on mouse move out of radius.
	tipRadiusX := radiusX, tipRadiusY := radiusY ; Backup of parameters, so we can declare as static.
	MouseGetPos, mouseX, mouseY

;	Showing the ToolTip
	if (previousTip != _tip || !sameTipExists) {
		ToolTip ; Reset tooltip. Avoid uninteded tooltip style such as underline.
		if (tipX || tipY) { ; Show tip at specified position.
			ToolTip,% _tip,% tipX,% tipY,% whichtooltip
		}
		else { ; Let AHK handle position.
			ToolTip,% _tip,,,% whichtooltip
		}
	}	

	previousTip := _tip ; Avoid replacing previous tip, when previous still exists.
	GoSub, %A_ThisFunc%_Remove ; Run "out of radius" timer.
	return

	ShowToolTip_Remove:
	/*	Remove the tooltip once the mouse exists the square radius.
	*/
		CoordMode(coord)
		sameTipExists := true
		MouseGetPos, currentX, currentY

		outOfXRadius := (currentX - mouseX) ** 2 > tipRadiusX ** 2
		outOfYRadius := (currentY - mouseY) ** 2 > tipRadiusY ** 2
		if (outOfXRadius || outOfYRadius)	{ ; Out of radius. Remove Tip.
			SetTimer, %A_ThisLabel%, Delete 
			Loop 20
				RemoveToolTip(A_Index, coord)
			sameTipExists := false
			coord :=, tipRadiusX :=, tipRadiusY :=, mouseX :=, mouseY :=, previousTip := 
		}
		else {
			SetTimer, %A_ThisLabel%, -100
		}
		
	;	Revert CoordMode settings
		CoordMode(coordSettings)
	return
}

RemoveToolTip(whichtooltip="", coord="") {
/*	Reset ShowToolTip() parameters used to detect previous tip and previous tip existence, and remove ToolTip.
*/
	ShowToolTip("",0,0,0,0,coord,whichtooltip)
}
