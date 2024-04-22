;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__05294845 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setstage(130)
Actor[] WolvesActors = new Actor[2]
WolvesActors[0] = Wolves[0].getActorRef()
WolvesActors[1] = Wolves[1].getActorRef()
sl.petsSex(WolvesActors,\
                   animName="Anubs  Wolf Wolf Female Surrender",\
                   isShowSubtitle=True,\
                   sceneName="WolfAmbushRape",\
                   isRape=True,\
                   endingSceneName="WolfAmbushEnd")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

ReferenceAlias[] Property Wolves  Auto  
