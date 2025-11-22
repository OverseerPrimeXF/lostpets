;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_LostPets_StartSexNoSubt01 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
String actionOnEnd = "SetStage," + PO3_SKSEFunctions.GetFormEditorID(\
    getOwningQuest()) + ",120"

sl.petSex(\
    PetREF=akSpeaker,\
    tags=sl.getGeneralTagsForActor(akSpeaker),\
    actionOnEnd=actionOnEnd)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

lope_functions Property func  Auto  
