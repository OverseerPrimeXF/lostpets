;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname lope_QF_lope_LostPets_special_05DD5C3C Extends Quest Hidden

;BEGIN ALIAS PROPERTY BrylingHouseDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrylingHouseDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrylingWaitMarkerStart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrylingWaitMarkerStart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bryling
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bryling Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SexChair
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SexChair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Grimner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Grimner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Falk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Irnskar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Irnskar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setObjectiveCompleted(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(5)
lope_LostPets_SE_Haafingar3_BrylingStartScene.start()
alias_BrylingHouseDoor.getReference().Lock(101)
alias_Bryling.tryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
setObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveCompleted(100)
setObjectiveDisplayed(500)
alias_Falk.tryToEnable()
alias_Irnskar.tryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property lope_LostPets_SE_Haafingar3_BrylingStartScene  Auto  
