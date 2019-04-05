#include <Misc.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include "_ImageSearch.au3"
#include "_ImageSearch_Debug.au3"

#Region Variables ===================================================================
HotKeySet("{ESC}", "_Exit")
Local $hDLL = DllOpen("user32.dll")
Local $getResourcesIcon[1] = [@ScriptDir & "\getResourcesIcon.bmp"]
Local $getNoticeIcon[1] = [@ScriptDir & "\getNoticeIcon.bmp"]
Local $getHomeIcon[1] = [@ScriptDir & "\getHomeIcon.bmp"]
Local $i = 1
#EndRegion Variables=================================================================

#Region Main ========================================================================
_CreateImages()
Sleep(3000)
While 1
	_Construction()
	Sleep(Random(500, 750))
	For $i = 1 To 5
		_Upgrade()
		Sleep(Random(200, 450))
	Next
	_Deconstruct()
	Sleep(Random(500, 750))
WEnd
#EndRegion Main =====================================================================

#Region Functions ===================================================================
Func _Exit()
	DllClose($hDLL)									;release el dll
	Exit
EndFunc ;==>_Exit

Func _CreateImages()
	_ImageSearch_Create_BMP($getResourcesIcon[0])
	_ImageSearch_Create_BMP($getNoticeIcon[0])
	_ImageSearch_Create_BMP($getHomeIcon[0])
EndFunc ;==>_CreateImages

Func _CheckForHome()
	Local $return = _ImageSearch($getHomeIcon[0], 0, False)
	If $return[0] = 0 Then
		Do
			WinActivate("(MEmu0)")
			WinWaitActive("(MEmu0)")
			Send("{F5}")
			Sleep(Random(1500, 1600))
			$return = _ImageSearch($getHomeIcon[0], 0, False)
		Until $return[0] = 1
	EndIf
EndFunc ;==>_CheckForHome

Func _CheckForResources()
	Local $return = _ImageSearch($getResourcesIcon[0], 0, False)
	If $return[0] = 1 Then
		MouseClick("left", 471, 299, 1, 0)  ;CLICK GET RESOURCES
		Sleep(Random(5000, 5100))
		MouseClick("left", 554, 832, 1, 0)  ;BUY 500,000 FOOD
		Sleep(Random(5000, 5100))
		Send("{F5}")
	EndIf
EndFunc ;==>_CheckForResources

Func _Construction()
	WinActivate("(MEmu0)")
	WinWaitActive("(MEmu0)")
	_CheckForHome()
	MouseClick("left", 342, 661, 1, 0)	;CLICK EMPTY SPACE
	Sleep(Random(500, 750))
	MouseClick("left", 310, 332, 1, 0)	;CLICK FARM BUILDING FROM LIST
	Sleep(Random(750, 1000))
;~ 	_CheckForResources()
;~ 	Sleep(Random(2000, 2100))
;~ 	_CheckForResources()
;~ 	Sleep(Random(2000, 2100))
	MouseClick("left", 468, 298, 1, 0)	;CLICK BUILD
	Sleep(Random(500, 750))
EndFunc ;==>_Construction()

Func _Upgrade()
	WinActivate("(MEmu0)")
	WinWaitActive("(MEmu0)")
	_CheckForHome()
	MouseClick("left", 342, 661, 1, 0)	;CLICK FARM
	Sleep(Random(700, 800))
	MouseClick("left", 477, 299, 1, 0)  ;CLICK UPGRADE
	Sleep(Random(700, 800))
;~ 	_CheckForResources()
;~ 	Sleep(Random(2000, 2100))
;~ 	_CheckForResources()
;~ 	Sleep(Random(2000, 2100))
	MouseClick("left", 477, 299, 1, 0)  ;CLICK UPGRADE UPGRADE
	Sleep(Random(700, 800))
	If $i > 6 Then MouseClick("left", 420, 173, 1, 0) ;CLICK FREE
;~ 	Local $return = _ImageSearch($getNoticeIcon[0], 0, False)
;~ 	If $return[0] = 1 Then
;~ 		MouseClick("left", 339, 443, 1, 0)  ;CLICK OK
;~ 	EndIf
	Sleep(Random(400, 600))
EndFunc ;==>_Upgrade()

Func _Deconstruct()
	WinActivate("(MEmu0)")
	WinWaitActive("(MEmu0)")
	_CheckForHome()
	MouseClick("left", 342, 661, 1, 0)	;CLICK FARM
	Sleep(Random(700, 800))
	MouseClick("left", 203, 298, 1, 0)	;CLICK DECONSTRUCT
	Sleep(Random(700, 800))
	MouseClick("left", 443, 521, 1, 0)	;CLICK USE
	Sleep(Random(1000, 1300))
	MouseClick("left", 446, 444, 1, 0)	;CLICK YES
	Sleep(Random(1500, 1600))
	If $i > 6 Then MouseClick("left", 420, 173, 1, 0) ;CLICK FREE
	$i = 1
	Sleep(Random(1000, 1100))
EndFunc ;==>_Deconstruct()
#EndRegion Functions ================================================================