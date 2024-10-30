;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_MariaEvents_fillAliasInn2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(getOwningQuest() as lope_mariaEvents_aliasUtil).fillAliases()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
conditions.iBlockMariaFollowerDialogues = 1
getOwningQuest().setStage(\
    getOwningQuest().getStage() + 5)
Maria.forceRefTo(akSpeaker)
mariaInnkeeperScene.start()
; debug.messagebox("maria innkeeper scene started")
; getowningquest().setObjectivedisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property mariaInnkeeperScene  Auto  

ReferenceAlias Property Maria  Auto  

lope_conditionsContainer Property Conditions  Auto  
