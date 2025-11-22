;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_SE_Haafingar3_reward Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if (getOwningQuest() as lope_SE_Haafingar3_conditions).rewardReceived == 0
    Game.getPlayer().addItem(Gold, GoldValue.getValueInt())
    (getOwningQuest() as lope_SE_Haafingar3_conditions).rewardReceived = 1
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property GoldValue  Auto  

MiscObject Property Gold  Auto  
