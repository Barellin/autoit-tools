
;+--------------------------------+----------------------------------+
;|   Tools                        |      Design by Barellin          |
;+-------------------------+------+-------+--------------------------+
;|                         |Version 1.0.1 |                          |
;+-------------------------+--------------+--------------------------+


;*********************************************************************
; Include & Constant
;*********************************************************************

; Gui Lib
#include <Gui.au3>

; Debug Mode
Global $Debug = true

; Assign key to function
HotKeySet("{F1}", "CapturePixel")

;*********************************************************************
; Main Script
;*********************************************************************

Main()

;*********************************************************************
; Script Fonctions
;*********************************************************************

Func Main()
   GUISetState(@SW_SHOW)
   While 1
	Switch GUIGetMsg()
	  Case $GUI_EVENT_CLOSE
		 Exit
	  Case $IDCTXMENUOPS1
		 CleanAll()
	  Case $IDCTXMENUOPS2
		 CleanListView()
	  Case $IDCTXMENUOPS3
		 CleanLogs()
	EndSwitch
   WEnd
EndFunc

;*********************************************************************

Func CapturePixel()
	Local $pos = MouseGetPos()
	Local $var = PixelGetColor(  $pos[0] , $pos[1] )
	Local $strDebug = "Mouse x = "& $pos[0] & " y = " & $pos[1] & " color = " & Hex($var, 6)
	Local $strList = $pos[0]&"|"& $pos[1] &"|"& Hex($var, 6)
    Local $i = _GUICtrlListView_GetItemCount($IDLISTVIEW)
    GUICtrlCreateListViewItem($strList, $IDLISTVIEW)
	_GUICtrlListView_EnsureVisible($IDLISTVIEW,$i)
	If($DEBUG) Then
	  Local $iLen = _GUICtrlEdit_GetTextLen($IDEDIT)
	  _GUICtrlEdit_SetSel($IDEDIT, $iLen, $iLen)
	   GUICtrlSetData($IDEDIT, $strDebug & @CRLF, 1)
	EndIf
EndFunc
