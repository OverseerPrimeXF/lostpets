;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname lope_QF_lope_LostPets_special_056C44BB Extends Quest Hidden

;BEGIN ALIAS PROPERTY SybilleStentor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SybilleStentor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Elisif
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Elisif Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Odar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Odar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY eventHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_eventHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BolgeirHousecarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BolgeirHousecarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterFromElisif
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterFromElisif Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fluffpaw
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fluffpaw Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Falk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FluffpawCloaking
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FluffpawCloaking Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeatBait
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeatBait Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FluffpawFollower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FluffpawFollower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Una
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Una Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bryling
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bryling Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
alias_BolgeirHousecarl.tryToEnable()
alias_Bryling.tryToEnable()
alias_Falk.tryToEnable()
alias_Una.tryToEnable()
Utility.wait(3)
setstage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10)
ElisifScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE lope_SE_Haafingar4
Quest __temp = self as Quest
lope_SE_Haafingar4 kmyQuest = __temp as lope_SE_Haafingar4
;END AUTOCAST
;BEGIN CODE
kmyquest.registerForNHours(8)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property ElisifScene  Auto  
