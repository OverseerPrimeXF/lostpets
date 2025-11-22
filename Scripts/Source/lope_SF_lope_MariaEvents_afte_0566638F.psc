;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_SF_lope_MariaEvents_afte_0566638F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
func.setPlayerReadyForAIScene(True)
moveWatch.RunChecks(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
func.setPlayerReadyForAIScene(False)
moveWatch.RunChecks()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_functions Property func  Auto  
lope_PlayerMovementWatcher Property moveWatch  Auto  
