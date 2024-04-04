;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__0509425B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PetTemporalFollower.ForceRefTo(Pet.GetReference())
;Pet.getActorReference().AddToFaction(CurrentFollowerFaction)
quest qt = getowningquest()
akspeaker.getRace().MakePushable()
qt.setstage(200)
qt.setObjectiveCompleted(120)
qt.setObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Pet  Auto  

ReferenceAlias Property PetTemporalFollower  Auto  

Faction Property CurrentFollowerFaction  Auto  
