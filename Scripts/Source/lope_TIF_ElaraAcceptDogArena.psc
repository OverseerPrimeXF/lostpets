;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname lope_TIF_ElaraAcceptDogArena Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Conditions.iElaraAcceptedDogArena = 1
if getOwningQuest().IsObjectiveDisplayed(15)
    getOwningQuest().setObjectiveCompleted(15)
    DASConditions.iNumberOfObjectivesDisplayed -= 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if DASConditions.iNumberOfObjectivesDisplayed == 0
    getOwningQuest().setStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_conditionsContainer Property Conditions  Auto  
lope_DogArenaStart_conditions Property DASConditions  Auto  
