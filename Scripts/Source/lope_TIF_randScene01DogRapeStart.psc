;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname lope_TIF_randScene01DogRapeStart Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(10)
(GetOwningQuest() as lope_randomScenes01Controller).dogRapedPlayer = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sl.petSex(\
    PetREF=akSpeaker,\
    animName="Billyy (Canine) Doggy Anal"\
)
; actionOnEnd="setStage,lope_randonScenes01,10"\  ; disabled
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  
