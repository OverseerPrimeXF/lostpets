;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_ElaraAcceptDogArena2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Conditions.iElaraAcceptedDogArena = 1
GetOwningQuest().SetStage(10)
akSpeaker.MakePlayerFriend()
if Maria.isInFaction(CurrentFollowerFaction)\
   && Maria.getDistance(game.getPlayer()) < 512
    akSpeaker.setRelationshipRank(Maria, 1)
    ; MariaElaraMeet.start()  ; Elara goes to Cragslane, no scene playing
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_conditionsContainer Property Conditions  Auto

Actor Property Maria  Auto  

Faction Property CurrentFollowerFaction  Auto  
