;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_LoPeFiRu_end Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MariaProgression.eventTriggered = False
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setStage(1000)
mariaEvents.setStage(1000)
updateWatch.registerForRadiant()
MariaProgression.setTimeRecruited()
MariaProgression.registerForTimeWithMaria()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property mariaEvents  Auto  

lope_MariaProgression Property mariaProgression  Auto  

lope_onUpdateWatch Property updateWatch  Auto
