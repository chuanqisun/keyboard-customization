;======================
;SETUP
;======================
isOn := False
width := A_ScreenWidth/2 - 50
height := 0

;======================
;AUTO EXECUTE SECTION
;======================

; Disable Capslock
SetCapsLockState, AlwaysOff

; Update status on initial launch
UpdateStatus()

;======================
;THREADED SECTION
;======================

; Ctrl + Alt + CapsLock to use Capslock
!^CapsLock::CapsLock


; Usa Capslock to toggle mode 
~*CapsLock::
  UpdateStatus()
	keywait, CapsLock
return

~*CapsLock Up::UpdateStatus()

 
; Leap mode mappings
; Char move
#If isOn
*i::Up
*k::Down
*j::Left
*l::Right

; ; Home/End
^+u::Send +{Home}
^+o::Send +{End}
^u::Send {Home}
^o::Send {End}
+u::Send +{Home}
+o::Send +{End}
u::Send {Home}
o::Send {End}

; ; Block travel (requires Block Travel extension)
; ^i::Send ^!{PgUp}
; ^k::Send ^!{PgDn}
; ^+i::Send ^!+{PgUp}
; ^+k::Send ^!+{PgDn}

; ; Page 
; [::Send {PgUp}
; ]::Send {PgDn}
; +[::Send +{PgUp}
; +]::Send +{PgDn}

; ; Document
; ^[::Send ^{Home}
; ^]::Send ^{End}
; ^+[::Send ^+{Home}
; ^+]::Send ^+{End}


; All time mappings
#If
+Backspace::Send {Del}
^+Backspace::Send ^{Del}

;======================
;FUNCTIONS
;======================

IsCapsLockOn()
{
	return GetKeyState("CapsLocK", "P") = 1
}

UpdateStatus()
{
	global width
	global height
	global isOn

	if (IsCapsLockOn())
	{
		Progress, B W120 ZH0 FS8 x%width% y%height% CW5FF9D4 CT000000, LEAP MODE, , LeapStatus
		isOn := True
	}		
	else if (!IsCapsLockOn())
	{
		Progress, off
		isOn := False
	}
	return
}
