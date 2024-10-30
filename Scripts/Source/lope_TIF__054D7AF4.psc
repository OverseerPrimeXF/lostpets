;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__054D7AF4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Maria.forceRefTo(akSpeaker)
InnLocation.ForceLocationTo(akSpeaker.getCurrentLocation())
(lope_MariaMeeting as lope_MariaFollower).DismissFollower(6,0)
GetOwningQuest().SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property InnLocation  Auto  

ReferenceAlias Property Maria  Auto  

Quest Property lope_MariaMeeting  Auto  
