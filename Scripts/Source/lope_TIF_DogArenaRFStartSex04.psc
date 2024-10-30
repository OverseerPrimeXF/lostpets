;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_DogArenaRFStartSex04 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if DARFc.sexVariant == 1
    Tags = "Threesome, CCF"  ; 
elseif DARFc.sexVariant == 2
    Tags = "Anal, Vaginal, DoublePen"  ; 
elseif DARFc.sexVariant == 3
    Tags = "Oral, Vaginal, Spitroast"  ; 
endif

sl.sceneOffset = func.getOffsetArray(arenaUpdater.getReference(), "LostPetMarker")
arenaUpdater.sexAfterFightTID = sl.petsSex(\
    sl.sexlab.makeActorArray(\
        AnimalLoserAlias.getActorReference(),\
        AnimalWinnerAlias.getActorReference()),\
    HumanAlias.getActorReference(),\
    tags=Tags,\
    actionOnEnd="setStage,lope_DogArena_fightRadiant,200")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

ReferenceAlias Property HumanAlias  Auto  

ReferenceAlias Property AnimalWinnerAlias  Auto  

ReferenceAlias Property AnimalLoserAlias  Auto  

String Property Tags  Auto  

lope_functions Property func  Auto  

lope_DogArenaRadiantFightConditions Property DARFc  Auto 

lope_DogArena_arenaUpdater Property arenaUpdater  Auto 
