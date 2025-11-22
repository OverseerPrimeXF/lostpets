;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_RGK_letDogsGotoJarl Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Dog1.getActorReference().setPlayerTeammate(0)
Dog2.getActorReference().setPlayerTeammate(0)
getOwningQuest().setStage(760)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Dog1  Auto  

ReferenceAlias Property Dog2  Auto  
