;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname lope_QF_lope_PetsOwnersScenes_053A4C34 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Chair
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Chair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY currentLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_currentLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OwnersBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnersBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetFurniture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TargetFurniture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY centerPrivacy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_centerPrivacy Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE lope_POSController
Quest __temp = self as Quest
lope_POSController kmyQuest = __temp as lope_POSController
;END AUTOCAST
;BEGIN CODE
MiscUtil.PrintConsole("[LoPe] POS scene is ending.")
kmyquest.registerForNextPOS()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE lope_POSController
Quest __temp = self as Quest
lope_POSController kmyQuest = __temp as lope_POSController
;END AUTOCAST
;BEGIN CODE
MiscUtil.PrintConsole("[LoPe] Player left the cell, POS scene is ending.")
kmyquest.registerForNextPOS()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
