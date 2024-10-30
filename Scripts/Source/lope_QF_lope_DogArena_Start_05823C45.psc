;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 51
Scriptname lope_QF_lope_DogArena_Start_05823C45 Extends Quest Hidden

;BEGIN ALIAS PROPERTY VeshleBei
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VeshleBei Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Elara
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Elara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stool
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stool Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Visitor02Pet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Visitor02Pet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Visitor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Visitor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerOutsideCavern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerOutsideCavern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Visitor01Pet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Visitor01Pet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LosersMaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LosersMaster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sona
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sona Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Visitor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Visitor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maria Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE lope_DogArenaStart
Quest __temp = self as Quest
lope_DogArenaStart kmyQuest = __temp as lope_DogArenaStart
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(70)
kmyQuest.registerForProgression(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
if IsObjectiveDisplayed(60)
    SetObjectiveCompleted(60)
endif
if IsObjectiveDisplayed(65)
    SetObjectiveCompleted(65)
endif
SetObjectiveDisplayed(70)
; ObjectReference note = Game.getPlayer().PlaceAtme(Advert, 100)
Game.getPlayer().addItem(Advert, 100)
alias_Courier.tryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if conditions.iPlayerMetElara == 1
    SetObjectiveDisplayed(15)
    DASConditions.iNumberOfObjectivesDisplayed += 1
endif
if conditions.iPlayerMetAster == 1
    SetObjectiveDisplayed(16)
    DASConditions.iNumberOfObjectivesDisplayed += 1
endif
if conditions.iPlayerMetSona == 1
    SetObjectiveDisplayed(17)
    DASConditions.iNumberOfObjectivesDisplayed += 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveDisplayed(20)
if IsObjectiveDisplayed(12)
    SetObjectiveCompleted(12)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
alias_Visitor01.TryToEnable()
alias_Visitor02.TryToEnable()
alias_Visitor01Pet.TryToEnable()
alias_Visitor02Pet.TryToEnable()
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
alias_visitor01.TryToEvaluatePackage()
alias_visitor02.TryToEvaluatePackage()
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveDisplayed(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(30)
setObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE lope_DogArenaStart
Quest __temp = self as Quest
lope_DogArenaStart kmyQuest = __temp as lope_DogArenaStart
;END AUTOCAST
;BEGIN CODE
kmyQuest.registerForProgression(8.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
lope_DogArena_main.setStage(0)
arenaUpdater.SetScriptRunning()
setStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
SetObjectiveCompleted(61)
SetObjectiveDisplayed(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE lope_DogArenaStart
Quest __temp = self as Quest
lope_DogArenaStart kmyQuest = __temp as lope_DogArenaStart
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(70)
kmyQuest.registerForProgression(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE lope_DogArenaStart
Quest __temp = self as Quest
lope_DogArenaStart kmyQuest = __temp as lope_DogArenaStart
;END AUTOCAST
;BEGIN CODE
; kmyQuest.registerForProgression(2)
setObjectiveCompleted(50)
setObjectivedisplayed(61)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectivedisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveCompleted(35)
setObjectivedisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_conditionsContainer Property Conditions  Auto  
lope_DogArenaStart_conditions Property DASConditions  Auto  

Book Property Advert  Auto  

Quest Property lope_DogArena_main  Auto  
lope_DogArena_arenaUpdater Property arenaUpdater  Auto 
