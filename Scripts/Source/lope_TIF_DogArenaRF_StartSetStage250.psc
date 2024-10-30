;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_DogArenaRF_StartSetStage250 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; (PO3_SKSEFunctions.getFormFromEditorID("lope_DogArena_Start") as Quest).setStage(250)
(getOwningQuest() as lope_DogArenaRadiantFightController).SetStageOfSourceQuest(250)
(getOwningQuest() as lope_DogArenaRadiantFightController).SetAliasAtSourceQuest(\
    "LosersMaster", LosersMaster)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property LosersMaster  Auto  
