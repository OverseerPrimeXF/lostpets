;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname lope_QF_lope_WE_WA01_050D7F4E Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wolf2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wolf2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlaceToTravel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlaceToTravel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY wolf1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_wolf1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; setObjectiveDisplayed(1)

SexLab.TrackActor(alias_Wolf1.getActorReference(), "WE01Wolf1")
SexLab.TrackActor(alias_Wolf2.getActorReference(), "WE01Wolf2")

alias_Wolf1.getActorReference().getRace().ClearCantOpenDoors()
alias_Wolf1.getActorReference().getRace().SetAllowPCDialogue()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
alias_Wolf1.getActorReference().getRace().SetCantOpenDoors()
alias_Wolf1.getActorReference().getRace().ClearAllowPCDialogue()

alias_wolf1.getReference().deleteWhenAble()
alias_wolf2.getReference().deleteWhenAble()

setObjectiveDisplayed(1, 0)

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SexLabFramework Property SexLab  Auto  
