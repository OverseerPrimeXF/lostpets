;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_MariaDismiss Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as lope_MariaFollower).DismissFollower(0,0)
followerProgression.gameTimeMariaTotalWaited = 0
;END CODE
EndFunction
;END FRAGMENT

lope_MariaProgression Property followerProgression Auto

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
