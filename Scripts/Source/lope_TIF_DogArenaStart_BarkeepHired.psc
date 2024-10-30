;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_DogArenaStart_BarkeepHired Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Conditions.iBarkeepHiredDogArena = 1
akSpeaker.EvaluatePackage()
akSpeaker.addToFaction(Barkeep)
akSpeaker.addToFaction(JobMerchantFaction)
akSpeaker.addToFaction(JobInnkeeperFaction)
akSpeaker.MakePlayerFriend()
getOwningQuest().setObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property JobMerchantFaction  Auto  

Faction Property Barkeep  Auto  

lope_conditionsContainer Property Conditions  Auto  

Faction Property JobInnkeeperFaction  Auto  
