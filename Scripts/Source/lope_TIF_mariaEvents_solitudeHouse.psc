;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_mariaEvents_solitudeHouse Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(getOwningQuest() as lope_MariaEvents_states).\
houseChoise = 4
RestingLocation.forceLocationTo(solitudeHouseCenter.getCurrentLocation())
getOwningquest().setstage(205)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property solitudeHouseCenter  Auto  

LocationAlias Property RestingLocation  Auto  
