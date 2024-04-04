;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__05049DD0 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Pet.getActorReference().PlayIdle(idleDogTurn)
utility.wait(1)
Pet.getActorReference().PlayIdle(idleDogLay)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Pet  Auto  

Idle Property idleDogTurn  Auto  

Idle Property IdleDogLay  Auto  
