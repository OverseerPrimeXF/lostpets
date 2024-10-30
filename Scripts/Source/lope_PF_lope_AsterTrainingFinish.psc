;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname lope_PF_lope_AsterTrainingFinish Extends Package Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6(Actor akActor)
;BEGIN CODE
if !Player.isDetectedBy(Aster)
    AsterFamiliarScene.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property AsterFamiliarScene  Auto  

Actor Property Aster  Auto  

Actor Property Player  Auto  
