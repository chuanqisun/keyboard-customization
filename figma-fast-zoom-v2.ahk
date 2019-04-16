; Space + wheel => faster zoom
; Space + x => zoom to fit
; Space + z => drag to select a tiny square, zoom to selection, then zoom to 100%

#IfWinActive ahk_exe Figma.exe
~Space & WheelUp::Send ^{WheelUp 5} ; fast zoom in
return

~Space & WheelDown::Send ^{WheelDown 20} ; fastest zoom out                     
return

Space & z::
Send {Space up}
Send {z down}
MouseClickDrag, Left, -10, -10, 20, 20, 0, Relative
MouseMove, -10, -10, 0, Relative
Send {z up}
Send +{0}
Send {Space down}
return

~Space & ~x::+1
return


