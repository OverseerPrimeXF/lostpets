;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_SonaDialogues_PlayerMetSona Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; debug.messagebox(akSpeaker.GetCurrentLocation())
Conditions.iPlayerMetSona = 1
if Maria.GetCurrentLocation() == akSpeaker.GetCurrentLocation()
    Conditions.iMariaMetSona = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_conditionsContainer Property Conditions  Auto  

Actor Property Maria  Auto  
