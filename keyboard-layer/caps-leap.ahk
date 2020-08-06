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

; Shift + backspace => delete
+Backspace::Send {Del}
^+Backspace::Send ^{Del}

; System-wide leap mode mappings
#If isOn
  
*i::Up
*k::Down
*j::Left
*l::Right

; Tab->Ctrl for ergonomics
Tab & j::^Left
Tab & l::^Right

; Line start/end
*o::End
*u::Home

; Line start/end
*y::PgUp
*h::PgDn

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
    Progress, B W120 ZH0 FS8 x%width% y%height% CW5FF9D4 CT000000, LEAP MODE
    isOn := True
  }		
  else if (!IsCapsLockOn())
  {
    Progress, off
    isOn := False
  }
return
}
