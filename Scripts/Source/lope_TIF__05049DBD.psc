;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__05049DBD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(PlayerREF as Actor).playIdle(idleGive)
if Bait_predators  
    PlayerREF.removeItem(Bait_predators.getReference(), 10)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bait_predators  Auto  

ObjectReference Property PlayerRef  Auto  

Idle Property IdleGive  Auto  
