;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_TGTJ01_reward Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getPlayer().removeItem(Valuable.getReference(), 1000)
int initial_gold = akSpeaker.GetGoldAmount()
akSpeaker.AddItem(leveledReward)
TGTJc.paidMoney = akSpeaker.GetGoldAmount() - initial_gold

game.getPlayer().addItem(Gold001, TGTJc.paidMoney)
akSpeaker.removeItem(Gold001, TGTJc.paidMoney)
getOwningQuest().setStage(500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property leveledReward  Auto  

MiscObject Property Gold001  Auto  

lope_TGTJ01_controller Property TGTJc  Auto  

ReferenceAlias Property Valuable  Auto  
