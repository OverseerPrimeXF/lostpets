;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__0524CBCD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if Bait_predators  
    PlayerREF.addItem(Bait_predators.getReference(), 1)
endif
GetOwningQuest().SetStage(100)
getowningquest().setobjectivecompleted(0)
getowningquest().setobjectivedisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bait_predators  Auto  

ObjectReference Property PlayerRef  Auto  
