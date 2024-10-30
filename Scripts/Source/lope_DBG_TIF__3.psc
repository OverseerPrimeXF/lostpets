;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_DBG_TIF__3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
stripUtil.unstrip_actor(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property visitor01  Auto  
ReferenceAlias Property visitor02  Auto  
ReferenceAlias Property visitor03  Auto  
ReferenceAlias Property visitor04  Auto  

lope_DogArena_arenaUpdater Property aU  Auto  


lope_functions Property func  Auto  

lope_strippingUtility Property stripUtil  Auto  
