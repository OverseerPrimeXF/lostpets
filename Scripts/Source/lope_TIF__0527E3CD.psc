;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__0527E3CD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
debug.messagebox("name: "+katla.getActorRef().getActorBase().getname())
debug.messagebox(katla.getRef().hasKeyword(lope_npcFarmer))
debug.messagebox("katla as actor "+katla.getActorRef().hasKeyword(lope_npcFarmer))
debug.messagebox("katla as actorbase "+katla.getActorRef().getActorBase().hasKeyword(lope_npcFarmer))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ssh  Auto  

Idle Property Wave  Auto  

ObjectReference Property lope_Fenris  Auto  

Form Property FenrisForm  Auto  

lope_LostPetsStartupRoutine Property startup  Auto  

lope_storageContainer Property Storage  Auto  

ReferenceAlias Property Katla  Auto  

Keyword Property lope_npcFarmer  Auto  
