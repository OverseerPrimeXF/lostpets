;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_SE_Haafingar4_FluffpawMeet Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
FluffpawFollower.forceRefTo(akSpeaker)
getOwningQuest().setObjectiveCompleted(100)
getOwningQuest().setObjectiveDisplayed(110)
getOwningQuest().setstage(110)
BluePalaceScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property FluffpawFollower  Auto  

Scene Property BluePalaceScene  Auto  
