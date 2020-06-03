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
 
; Handle arrowkey mappings
#If IsCapsLockOn()
*i::Up
*k::Down
*j::Left
*l::Right
#If


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
		Progress, B W100 ZH0 FS8 x%width% y%height% CW5FF9D4 CT000000, LEAP MODE, , LeapStatus
	}
	else
	{
		Progress, off
	}
	return
}



