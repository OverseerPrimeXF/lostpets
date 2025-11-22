;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_RGK_makeDogFollower Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; akSpeaker.setRace(dogCompanion)
dogFollower.forceRefTo(akSpeaker)
akSpeaker.evaluatePackage()
debug.notification("Find some place")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property dogFollower  Auto  

Race Property dogCompanion  Auto  
