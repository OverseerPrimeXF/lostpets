;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__057603ED Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Una.tryToDisable()
Falk.tryToDisable()
Bryling.tryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lope_ssh.ShowSubtitlesNonSexlab("specialEventStart_haafingar4", 0, Fluffpaw.getActorRef(), akSpeaker)
getOwningQuest().setStage(150)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_ShowSubtitlesHandler Property lope_SSH  Auto  

ReferenceAlias Property Fluffpaw  Auto  

ReferenceAlias Property Una  Auto  

ReferenceAlias Property Falk  Auto  

ReferenceAlias Property Bryling  Auto  
