;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname lope_TIF_mariaEventsFinish_1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
conditions.iTryedAtEvent1 = 0
getOwningQuest().CompleteQuest()
getOwningQuest().stop()
(mariaMeeting as lope_mariaFollower).setFollower(akSpeaker)
(mariaMeeting as lope_MariaProgression).setTimeRecruited()
(mariaMeeting as lope_MariaProgression).registerForTimeWithMaria()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; (mariaMeeting as lope_MariaProgression).totalHoursWithMaria = 0
(mariaMeeting as lope_MariaProgression).eventTriggered = False
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property mariaMeeting  Auto  

lope_conditionsContainer Property conditions  Auto  
