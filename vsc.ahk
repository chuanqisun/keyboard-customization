;======================
;AUTO EXECUTE SECTION
;======================

; Update status on initial launch
UpdateStatus()

;======================
;THREADED SECTION
;======================

; Usa Capslock to toggle mode 
~*CapsLock::
UpdateStatus()
return
 
; Leap mode mappings
#MenuMaskKey vk07  ; vk07 is unassigned.
#If IsCapsLockOn()
; Char move
*i::Up
*k::Down
*j::Left
*l::Right

; Home/End
^+u::Send +{Home}
^+o::Send +{End}
^u::Send {Home}
^o::Send {End}
+u::Send +{Home}
+o::Send +{End}
u::Send {Home}
o::Send {End}

; Block travel (requires Block Travel extension)
^i::Send ^!{PgUp}
^k::Send ^!{PgDn}
^+i::Send ^!+{PgUp}
^+k::Send ^!+{PgDn}

; Page 
[::Send {PgUp}
]::Send {PgDn}
+[::Send +{PgUp}
+]::Send +{PgDn}

; Document
^[::Send ^{Home}
^]::Send ^{End}
^+[::Send ^+{Home}
^+]::Send ^+{End}


; All time mappings
#If 
+Backspace::Send {Del}
^+Backspace::Send ^{Del}

;======================
;FUNCTIONS
;======================

IsCapsLockOn()
{
	return GetKeyState("CapsLocK", "T") = 1
}

UpdateStatus()
{
	width := A_ScreenWidth/2 - 50
	height := 0

	Sleep, 10
	if IsCapsLockOn()
	{
		Progress, B W120 ZH0 FS8 x%width% y%height% CW5FF9D4 CT000000, LEAP MODE, , LeapStatus
	}		
	else
	{
		Progress, off
	}
	return
}



