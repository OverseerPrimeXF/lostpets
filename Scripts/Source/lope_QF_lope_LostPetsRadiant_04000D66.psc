;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname lope_QF_lope_LostPetsRadiant_04000D66 Extends Quest Hidden

;BEGIN ALIAS PROPERTY LostPetMarkerInWinterhold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInWinterhold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetsTreatBait_predators
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetsTreatBait_predators Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerSpeaker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerSpeaker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RumorsSourceREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RumorsSourceREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInRift
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInRift Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RumorsSourceLocationExt
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_RumorsSourceLocationExt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInHjaalmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInHjaalmarch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LostPetLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInReach
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInReach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInHaafingar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInHaafingar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInPale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInPale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInEastmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInEastmarch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetTemporalFollower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetTemporalFollower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInWhiterun Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
alias_petTemporalFollower.forceRefTo(alias_Pet.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
LoPeCo.registerNextTimeUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setobjectivedisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE lope_LostPetsController
Quest __temp = self as Quest
lope_LostPetsController kmyQuest = __temp as lope_LostPetsController
;END AUTOCAST
;BEGIN CODE
setobjectivedisplayed(0)
;debug.messagebox("RumorsSourceLocExt"+RumorsSourceLocExt.getLocation())
actor Pet = alias_pet.getactorreference()
; ObjectReference PetMarker = kmyquest.GetRandomMarker(kmyquest.setFormList())
ObjectReference PetMarker = kmyquest.getPetMarker()
; debug.messagebox("PetMarker in quest stages is "+PetMarker )
kmyquest.SetPetMarkerAlias(PetMarker)
kmyquest.SetPetLocationAlias(PetMarker)
ObjectReference Marker = alias_lostpetmarker.getreference()
; Pet.MoveTo(Marker)
; debug.messagebox(petmarker)
; Pet.EvaluatePackage()
utility.wait(1)
Pet.MoveTo(PetMarker)
PetFromPackages.ForceRefTo(Pet)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property RumorsSourceLocExt  Auto  

lope_LostPetsController Property LoPeCo  Auto  

ReferenceAlias Property PetFromPackages  Auto  
