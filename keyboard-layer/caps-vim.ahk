;======================
;SETUP
;======================
width := A_ScreenWidth/2 - 50
height := 0
isOn := False

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
  UpdateStatus()
	KeyWait, CapsLock
return

~*CapsLock up::UpdateStatus()

; System-wide leap mode mappings
#If isOn
*k::Up
*j::Down
*h::Left
*l::Right

; Word travel
b::^Left
w::^right

; Line start/end
*4::End
*6::Home

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
		Progress, B W120 ZH0 FS8 x%width% y%height% CW5FF9D4 CT000000, VIM MODE
		isOn := True
	}		
	else if (!IsCapsLockOn())
	{
		Progress, off
		isOn := False
	}
	return
}
