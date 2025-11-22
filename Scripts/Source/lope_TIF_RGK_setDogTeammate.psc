;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_RGK_setDogTeammate Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.setPlayerTeammate(1)
if (Dog1.getActorReference().IsPlayerTeammate() && \
   Dog2.getActorReference().IsPlayerTeammate())
    getOwningQuest().setStage(751)
endIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Dog1  Auto  

ReferenceAlias Property Dog2  Auto  
