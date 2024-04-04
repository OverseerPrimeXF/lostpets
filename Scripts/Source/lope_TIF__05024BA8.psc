;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname lope_TIF__05024BA8 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ObjectReference PS = PlayerSpeaker.getReference()
ObjectReference P = Pet.getReference()
PS.SetDisplayName(Player.getName())
PS.moveto(P)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PlayerSpeaker  Auto  

ReferenceAlias Property Pet  Auto  

ActorBase Property Player  Auto  

Race Property dogCompanion  Auto  
