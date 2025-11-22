;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_SE_Haafingar3_stg10showSubt Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lope_ssh.ShowSubtitlesNonSexlab(\
    "specialEventStart_haafingar3", 0,\
    Grimner.getActorReference(), Bryling.getActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


lope_ShowSubtitlesHandler Property lope_SSH Auto

ReferenceAlias Property Grimner  Auto  

ReferenceAlias Property Bryling  Auto  
