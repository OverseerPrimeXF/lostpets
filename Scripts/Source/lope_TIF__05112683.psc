;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__05112683 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
aboutToMate.setValue(0)
sl.PetSex(Pet.getRef(), tags="Vaginal")
sl.playNPCReactionScene(Innkeeper.getReference(), reaction=Reaction, locKWD=LocTypeInn, moveSpeaker=True)
;if PlayerREF.getCurrentLocation().hasKeyword(LocTypeInn) && Innkeeper.getActorRef().IsInLocation(PlayerREF.GetCurrentLocation())
;endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

ReferenceAlias Property Pet  Auto  

Keyword Property LocTypeInn  Auto  

ObjectReference Property PlayerRef  Auto  

ReferenceAlias Property Innkeeper  Auto  

Scene Property reaction  Auto  

GlobalVariable Property aboutToMate  Auto  
