;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_firstLostPets_askedOwner Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setObjectiveCompleted(10)
getOwningQuest().setObjectiveDisplayed(100)
getOwningQuest().setStage(100)
watch.registerForPetSight()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Pet  Auto  

lope_LPFR_watch Property watch  Auto  
