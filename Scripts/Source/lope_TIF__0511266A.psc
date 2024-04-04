;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__0511266A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(10)
GetOwningQuest().setobjectivecompleted(5)
GetOwningQuest().setobjectivedisplayed(10)
PetFollower.forceRefTo(Pet.getRef())
PetVisit.setStartTime()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PetFollower  Auto  

ReferenceAlias Property Pet  Auto  

lope_PetVisitScript Property PetVisit  Auto  
