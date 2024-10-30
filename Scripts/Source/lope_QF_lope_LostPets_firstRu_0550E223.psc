;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname lope_QF_lope_LostPets_firstRu_0550E223 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RumorSource
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RumorSource Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetFollower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetFollower Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
alias_PetFollower.forceRefTo(alias_Pet.getRef())
alias_PetFollower.getActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;LoPeCo.SetRandomPetFactionRank(\
;    alias_Pet.getActorRef(), storage.LostPetFaction())
PetFromPackages.ForceRefTo(alias_Pet.getRef())
alias_Pet.getRef().moveTo(alias_LostPetMarker.getRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
PetFromPackages.clear()
completeQuest()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Innkeeper  Auto  

ReferenceAlias Property PetFromPackages  Auto  

lope_LostPetsController Property LoPeCo  Auto  

lope_storageContainer Property Storage  Auto  
