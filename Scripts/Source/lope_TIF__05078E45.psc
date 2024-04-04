;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname lope_TIF__05078E45 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lope_scenes.start()
Player.PlayIdle(idleDogPet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
this.stop()
sl.dogSexBlowjob(akspeaker, dogBlowjobWorshipStages, "Billyy (Canine) Laying Worship Service")
sl.IncreaseRelationship(akspeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene[] Property dogBlowjobWorshipStages  Auto 

lope_lostpets_sl Property sl  Auto  

Scene Property this  Auto  

Quest Property lope_scenes  Auto  

Actor Property Player  Auto  

Idle Property idleDogPet  Auto  
