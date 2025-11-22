;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_TGTJ01_RubyCutExtra Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.addItem(Gold001, (TGTJc.paidMoney * TGTJc.RubysRewardModifier) as Int)
game.GetPlayer().removeItem(Gold001, (TGTJc.paidMoney * TGTJc.RubysRewardModifier) as Int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_TGTJ01_controller Property TGTJc  Auto  

MiscObject Property Gold001  Auto  
