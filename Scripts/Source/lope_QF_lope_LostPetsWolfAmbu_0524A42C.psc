;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname lope_QF_lope_LostPetsWolfAmbu_0524A42C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInReach
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInReach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfEnc02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WolfEnc02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInPale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInPale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RumorsSource
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RumorsSource Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WolfEnc01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WolfEnc01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInHaafingar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInHaafingar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInRift
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInRift Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInEastmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInEastmarch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInHjaalmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInHjaalmarch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreatMeat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreatMeat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LostPetMarkerInWinterhold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LostPetMarkerInWinterhold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_WolfEnc01.TryToEvaluatePackage()
Alias_WolfEnc02.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Alias_WolfEnc01.TryToEvaluatePackage()
Alias_WolfEnc02.TryToEvaluatePackage()
WAC.registerAndGetStage(12)
; (lope_SSH as lope_ShowSubtitlesHandler).ShowSubtitlesNonSexlab("WolfAmbushEnd", 0, None)
; utility.wait(12)
; alias_wolfEnc01.getRef().disable()
; alias_wolfEnc02.getRef().disable()
alias_Pet.getRef().Enable()
SetObjectiveCompleted(110)
SetObjectiveDisplayed(150)
(PlayerREF as Actor).SetDontMove (False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
WAC.registerAndGetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
setobjectivedisplayed(0)
alias_pet.getactorreference().Disable()
ObjectReference PetMarker = controller.getPetMarker(alias_Owner, lostPet_Markers)
controller.SetPetMarkerAlias(PetMarker, alias_LostPetMarker)
; controller.SetPetLocationAlias(PetMarker)
; ObjectReference Marker = alias_lostpetmarker.getreference()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_LostPetsController Property Controller  Auto  

ReferenceAlias[] Property LostPet_Markers  Auto 

lope_WolfAmbushController Property WAC  Auto 


ReferenceAlias Property lope_SSH  Auto  

ObjectReference Property PlayerRef  Auto  
