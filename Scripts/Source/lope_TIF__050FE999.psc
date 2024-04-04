;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__050FE999 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Owner.ForceRefTo(OwnerExt.GetRef())
getowningquest().setstage(5)
getowningquest().setobjectivedisplayed(5)
lope_aliasUtil.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lope_aliasUtil.setstage(0)
PetExt.forceRefTo(Pet.getRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property lope_aliasUtil  Auto  

ReferenceAlias Property OwnerExt  Auto  

ReferenceAlias Property Owner  Auto  

ReferenceAlias Property PetExt  Auto  

ReferenceAlias Property Pet  Auto  
