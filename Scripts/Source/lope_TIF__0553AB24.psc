;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__0553AB24 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lope_SSH.ShowSubtitlesNonSexlab(\
    "mariaEvents_playerExp1f1c", 0,\
    Billy.GetActorRef(), Maria.GetActorRef(), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Maria  Auto  

ReferenceAlias Property Billy  Auto  

lope_showSubtitlesHandler Property lope_SSH  Auto  
