;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__056A90F7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(MariaMeeting as lope_conditionsContainer).iBlockMariaFollowerDialogues = 0
getOwningQuest().CompleteQuest()
getOwningQuest().stop()
(mariaMeeting as lope_mariaFollower).setFollower(akSpeaker)
(mariaMeeting as lope_MariaProgression).setTimeRecruited()
(mariaMeeting as lope_MariaProgression).registerForTimeWithMaria()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MariaMeeting  Auto  
