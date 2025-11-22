;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname lope_QF_lope_LostPetsRadiant__0523EDDE Extends Quest Hidden

;BEGIN ALIAS PROPERTY PetMarkerPale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerPale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarkerReach
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerReach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarkerFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarkerHjaalmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerHjaalmarch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarkerWinterhold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerWinterhold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarkerEastmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerEastmarch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarkerHaafingar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerHaafingar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarkerRift
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerRift Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarkerWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarkerWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if alias_PetMarkerEastmarch.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerEastmarch.getReference())

elseif alias_PetMarkerFalkreath.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerFalkreath.getReference())

elseif alias_PetMarkerHaafingar.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerHaafingar.getReference())

elseif alias_PetMarkerHjaalmarch.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerHjaalmarch.getReference())

elseif alias_PetMarkerPale.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerPale.getReference())

elseif alias_PetMarkerReach.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerReach.getReference())

elseif alias_PetMarkerRift.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerRift.getReference())

elseif alias_PetMarkerWhiterun.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerWhiterun.getReference())

elseif alias_PetMarkerWinterhold.getReference()
    alias_PetMarker.ForceRefTo(alias_PetMarkerWinterhold.getReference())
endIf

; for testing
; game.getPlayer().moveTo(alias_PetMarker.getRef())
; stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
