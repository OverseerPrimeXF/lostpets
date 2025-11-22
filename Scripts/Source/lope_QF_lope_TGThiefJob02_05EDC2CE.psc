;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname lope_QF_lope_TGThiefJob02_05EDC2CE Extends Quest Hidden

;BEGIN ALIAS PROPERTY StrongBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StrongBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Buisness
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Buisness Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE lope_TGTJ02_controller
Quest __temp = self as Quest
lope_TGTJ02_controller kmyQuest = __temp as lope_TGTJ02_controller
;END AUTOCAST
;BEGIN CODE
kmyQuest.placeGold(alias_Strongbox.getReference())
RTQc.iJobInProgress = 1
setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
setStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
completeAllObjectives()
RTQc.iJobInProgress = 0
RTQc.iTimesGoldStolen += 1
RTQc.iAmountOfCompletedJobs += 1
setstage(1000)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_RubyThiefQuest_conditions Property RTQc Auto
