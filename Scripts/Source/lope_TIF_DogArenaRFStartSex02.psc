;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_DogArenaRFStartSex02 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
String Tagz 
if DARFc.sexVariant == 1
    Tagz = "Vaginal, Creampie"  ; 
elseif DARFc.sexVariant == 2
    Tagz = "Anal, AnalCreampie"  ; 
elseif DARFc.sexVariant == 3
    Tagz = "Oral, CumInMouth"  ; 
endif
; debug.messageBox(DARFc.sexVariant+ " | " +Tags)  ; DEBUG
sl.sceneOffset = func.getOffsetArray(HumanAlias.getReference(), "LostPetMarker")
arenaUpdater.sexAfterFightTID = sl.petSexNPC(\
    AnimalAlias.getActorReference(),\
    HumanAlias.getActorReference(),\
    tags=Tagz,\
    actionOnEnd="setStage,lope_DogArena_fightRadiant,200")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

ReferenceAlias Property HumanAlias  Auto  

ReferenceAlias Property AnimalAlias  Auto  

String Property Tags  Auto  

lope_functions Property func  Auto  

lope_DogArenaRadiantFightConditions Property DARFc  Auto 

lope_DogArena_arenaUpdater Property arenaUpdater  Auto 

