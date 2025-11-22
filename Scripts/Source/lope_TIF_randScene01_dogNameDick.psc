;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_randScene01_dogNameDick Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; DogNameRazor.clear()
; DogNameBandit.clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(getOwningQuest() as lope_randomScenes01Controller).dogWasRenamed  = 1
(getOwningQuest() as lope_randomScenes01Controller).dogCurrentName  = 1


DogNameDick.forceRefTo(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property DogNameBandit Auto
ReferenceAlias Property DogNameDick Auto
ReferenceAlias Property DogNameRazor  Auto  
