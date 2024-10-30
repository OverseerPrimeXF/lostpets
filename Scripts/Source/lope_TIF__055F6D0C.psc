;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__055F6D0C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(mariaMeeting as lope_MariaProgression).eventTriggered = False
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
conditions.iTryedAtEvent1 = 1
getOwningQuest().CompleteQuest()
getOwningQuest().stop()
(mariaMeeting as lope_mariaFollower).setFollower(akSpeaker)
(mariaMeeting as lope_MariaProgression).setTimeRecruited()
(mariaMeeting as lope_MariaProgression).registerForTimeWithMaria()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property mariaMeeting  Auto  

lope_conditionsContainer Property conditions  Auto  
