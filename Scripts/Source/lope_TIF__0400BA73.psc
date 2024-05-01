;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__0400BA73 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lowestPetRelationship.setValueInt(StartupRoutine.getMinimalRelationships())
RumorSourceLocation.ForceLocationTo(akspeaker.getCurrentLocation())
RumorsSourceREF.ForceRefTo(akspeaker)
;debug.messagebox("rumors here - "+RumorSourceLocation.getLocation())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property RumorSourceLocation  Auto  

ReferenceAlias Property RumorsSourceREF  Auto  

GlobalVariable Property lowestPetRelationship  Auto  

lope_LostPetsStartupRoutine Property StartupRoutine Auto 

ReferenceAlias Property RandomPet  Auto  
