;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_RGK_BuyMeat Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.GetPlayer().addItem(Meat.getReference())
game.GetPlayer().addItem(beef)
game.GetPlayer().removeItem(Gold001, 78)
(getOwningQuest() as lope_RGK_controller).meatBought = 1

getOwningQuest().setObjectiveCompleted(52)
if getOwningQuest().isObjectiveCompleted(51) && getOwningQuest().isObjectiveCompleted(52)
    getOwningQuest().setStage(55)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

Potion Property Beef  Auto  

ReferenceAlias Property Meat  Auto  
