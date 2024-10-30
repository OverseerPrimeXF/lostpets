;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_LoPeFiRu_afterMatingSceneEnd Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
quest OQ = getOwningQuest()
OQ.setObjectiveCompleted(100)
OQ.setObjectiveDisplayed(100, false)
OQ.setObjectiveCompleted(200)
OQ.setObjectiveDisplayed(200, false)
OQ.setObjectiveDisplayed(250)
OQ.setStage(250)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
