;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname lope_TIF_RGK_dogMatingOral Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sl.petSex(akSpeaker, game.getPlayer(), tags="Blowjob,CumInMouth", tagsExcluded="Furniture")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;crappy approach, but i dont care
if dog1.getActorReference() == akSpeaker
    ctr.dog1NeedsMating = 0
    (dog1 as lope_RGK_dog1Watch).registerForMating(12)
elseif dog2.getActorReference() == akSpeaker
    ctr.dog2NeedsMating = 0
    (dog2 as lope_RGK_dog1Watch).registerForMating(12)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_RGK_controller Property ctr  Auto  

ReferenceAlias Property Dog1  Auto  

ReferenceAlias Property Dog2  Auto  

lope_sl Property sl  Auto  
