;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_lope_MariaEvents_054C8D44 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PairedChair1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PairedChair1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FuckingBard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FuckingBard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Billy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Billy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PairedChair2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PairedChair2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RestingLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_RestingLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Furniture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Furniture Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
conditions.iBlockMariaFollowerDialogues = 0
conditions.WriteMariaEventStage()
completequest()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveDisplayed(20, False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_conditionsContainer Property Conditions  Auto  
