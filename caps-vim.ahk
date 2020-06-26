;======================
;SETUP
;======================
width := A_ScreenWidth/2 - 50
height := 0
isVimModeOn := False

; Disable Capslock
SetCapsLockState, AlwaysOff

; Match window by substring
SetTitleMatchMode, 2

;======================
;AUTO EXECUTE SECTION
;======================

;noop

;======================
;THREADED SECTION
;======================

; Ctrl + Alt + CapsLock to use Capslock
!^CapsLock::CapsLock


; Usa Capslock to toggle mode 
~*CapsLock::
  EnableVimMode()
	KeyWait CapsLock
return

~*CapsLock up::
	LeaveVimMode()
return

; System-wide leap mode mappings
#If isVimModeOn
*k::Up
*j::Down
*h::Left
*l::Right

; Home/End
*,::Home
*.::End

;======================
;FUNCTIONS
;======================

IsCapsLockOn()
{
	return GetKeyState("CapsLocK", "P") = 1
}

EnableVimMode()
{
	global width
	global height
	global isVimModeOn

	Progress, B W120 ZH0 FS8 x%width% y%height% CW5FF9D4 CT000000, LEAP MODE, , LeapStatus
	isVimModeOn := True

	return
}

LeaveVimMode()
{
	Progress, off
	isVimModeOn := False

	return
}
