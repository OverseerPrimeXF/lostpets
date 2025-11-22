;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_MeekoFirstSex Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sl.sceneOffset = func.getOffsetArray(bed, "bed")
sl.petSex(\
    petREF=akSpeaker,\
    animName="Billyy (Canine) Missionary 2",\
    sceneName="MeekoSex",\
    isShowSubtitle=True)
getOwningQuest().setStage(70)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

ObjectReference Property Bed  Auto  

lope_functions Property func  Auto  
