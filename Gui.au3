
;+--------------------------------+----------------------------------+
;|   Gui                          |      Design by Barellin          |
;+-------------------------+------+-------+--------------------------+
;|                         |Version 1.0.1 |                          |
;+-------------------------+--------------+--------------------------+

;*********************************************************************
; Include & Constante & Create Gui objects
;*********************************************************************


#include <GUIConstants.au3>
#include <GuiConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>
#include <ScrollBarsConstants.au3>

; GUI
GUICreate("Tools UI", 400, 400)

; MENU
Global $IDMENUOPS = GUICtrlCreateMenu("Options")

; CONTEXT MENU
Global $IDCTXMENUOPS1 =  GUICtrlCreateMenuItem("Clear All", $IDMENUOPS)
Global $IDCTXMENUOPS2 =  GUICtrlCreateMenuItem("Clear List View", $IDMENUOPS)
Global $IDCTXMENUOPS3 =  GUICtrlCreateMenuItem("Clear Logs", $IDMENUOPS)

;LIST VIEW
Global $IDLISTVIEW = GUICtrlCreateListView("X|Y|COLOR", 0, 0, 400, 300 , -1 , $LVS_EX_GRIDLINES)

; EDIT
Global $IDEDIT = GUICtrlCreateEdit(@CRLF & "", 0, 300, 400, 100 ,  $ES_AUTOVSCROLL  + $ES_READONLY + $WS_VSCROLL)

GUICtrlSetData($IDEDIT, "Usage : "& @CRLF & @CRLF , 1)
GUICtrlSetData($IDEDIT, " F1 = Capture Pixel "& @CRLF & @CRLF , 1)
GUICtrlSetData($IDEDIT, "Logs : "& @CRLF & @CRLF , 1)

;*********************************************************************
; Fonctions
;*********************************************************************


Func CleanAll()
   CleanListView()
   CleanLogs()
EndFunc

;*********************************************************************

Func CleanListView()
   _GUICtrlListView_DeleteAllItems($IDLISTVIEW)
EndFunc

;*********************************************************************

Func CleanLogs()
   GUICtrlSetData($IDEDIT,"")
EndFunc