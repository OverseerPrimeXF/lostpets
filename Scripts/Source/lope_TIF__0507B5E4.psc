;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__0507B5E4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerREF.SetLookAt(Pet.getReference())
Pet.getActorReference().playIdle(idleDogStand)
PlayerREF.PlayIdle(idlePetDog)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Idle Property idlePetDog  Auto  

ReferenceAlias Property Pet  Auto  

Idle Property idleDogStand  Auto  
