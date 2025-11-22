;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_TGTJ02_shareEnd Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.addItem(Gold001, (TGTJc.goldAmount * 0.33) as Int)
game.getPlayer().removeItem(Gold001, (TGTJc.goldAmount * 0.33) as Int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_TGTJ02_controller Property TGTJc Auto
lope_RubyThiefQuest_conditions Property RTQc Auto
MiscObject Property Gold001  Auto  
