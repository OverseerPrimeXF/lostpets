;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_LoPeFiRu_petIsBackEnd Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Quest QT = getOwningQuest()
QT.setObjectiveCompleted(250)
QT.setObjectiveDisplayed(250, False)
PetFromPackages.clear()
PetFollower.clear()
QT.setStage(300)
; BackEnd, lmao
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PetFollower  Auto  

ReferenceAlias Property PetFromPackages  Auto  
