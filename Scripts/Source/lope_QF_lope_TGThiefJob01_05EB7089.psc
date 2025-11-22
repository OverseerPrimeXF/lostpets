;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname lope_QF_lope_TGThiefJob01_05EB7089 Extends Quest Hidden

;BEGIN ALIAS PROPERTY house
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_house Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ruby
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ruby Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ItemMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ItemMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Valuable
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Valuable Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; alias_valuable.getReference().getBaseObject().setGoldValue(1000)
setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
RTQc.iJobInProgress = 0
RTQc.iValuablesStolen += 1
RTQc.iAmountOfCompletedJobs += 1
setStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
setObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
RTQc.iJobInProgress = 1
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_RubyThiefQuest_conditions Property RTQc Auto
