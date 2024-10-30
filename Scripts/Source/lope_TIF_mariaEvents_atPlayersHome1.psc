;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_mariaEvents_atPlayersHome1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(210)
conditions.iBlockMariaFollowerDialogues = 1
String animName
if Game.getPlayer().getActorBase().GetSex() == 1 ;  female player
    animName = "Billyy Lesbian Kissing"
else                                                                               ;  not female player
    animName = "Billyy Kissing"
endif
sl.humanSexPlayer1NPC(Human=akSpeaker,\
                                           animName=animName,\
                                           isUndressingDisabled=True,\
                                           actionOnEnd="setstage,lope_mariaevents,220")
ObjectReference[] chairs = func.findPairedChairs()
PairedChair1.forceRefTo(chairs[0])
PairedChair2.forceRefTo(chairs[1])
Maria.forceRefTo(akSpeaker)
Housecarl.forceRefTo(func.getHousecarlFromCurrentCell())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

ReferenceAlias Property PairedChair1  Auto  

ReferenceAlias Property PairedChair2  Auto  

lope_functions Property func  Auto  

ReferenceAlias Property Maria  Auto  

lope_conditionsContainer Property Conditions  Auto  

ReferenceAlias Property HouseCarl  Auto  
