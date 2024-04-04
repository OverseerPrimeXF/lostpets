;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname lope_TIF__0509B92F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PS.getRef().enable()
PS.getRef().moveto(Pet.getRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PetPackages.clear()
petBack.start()
getowningquest().setobjectivecompleted(200)
getowningquest().setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property petBack  Auto  

ReferenceAlias Property PS  Auto  

ReferenceAlias Property Pet  Auto  

ReferenceAlias Property PetPackages  Auto  

ObjectReference Property PlayerRef  Auto  
