;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_DogArenaStart_visitorLeaving Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If LosersMaster.getActorReference() == akSpeaker
    DASc.iLosersMasterLeft = 1
else
    DASc.iWinnersMastersLeft = 1
endIf

If Visitor01.getActorReference() == akSpeaker
    visitorsConditions.visitor01OnArena = 0
elseif Visitor02.getActorReference() == akSpeaker
    visitorsConditions.visitor02OnArena = 0
endIf

DASc.iVisitorsLeft += 1
If DASc.iVisitorsLeft == 2
    getOwningQuest().setStage(300)
endIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property LosersMaster  Auto  
lope_DogArenaStart_conditions Property DASc  Auto  

ReferenceAlias Property Visitor01  Auto  

ReferenceAlias Property Visitor02  Auto  

lope_DogArena_VisitorsConditions Property visitorsConditions Auto

