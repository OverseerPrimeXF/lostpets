;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_ElaraFirstMeetingEnd Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(10)
akSpeaker.setRelationshipRank(Game.getPlayer(), 1)
Conditions.iPlayerMetElara = 1
if Maria.isInFaction(CurrentFollowerFaction)\
   && Maria.getDistance(game.getPlayer()) < 512
    akSpeaker.setRelationshipRank(Maria, 1)
    MariaElaraMeet.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Maria  Auto  

Faction Property CurrentFollowerFaction  Auto  

Scene Property MariaElaraMeet  Auto  

lope_conditionsContainer Property Conditions  Auto  
