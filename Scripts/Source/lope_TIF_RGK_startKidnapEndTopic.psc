;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_RGK_startKidnapEndTopic Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getPlayer().removeItem(foodBeef, 2)
game.getPlayer().removeItem(PotionREF.getReference(), 1)
if !akSpeaker.IsPlayerTeammate()
    DFS.SetFollower(akspeaker)
endIf
debug.notification("Ruby will be your follower until kidnap is done.")
getOwningQuest().setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DialogueFollowerScript Property DFS  Auto  

ReferenceAlias Property PotionREF  Auto  

ReferenceAlias Property Meat  Auto  

Potion Property FoodBeef  Auto  
