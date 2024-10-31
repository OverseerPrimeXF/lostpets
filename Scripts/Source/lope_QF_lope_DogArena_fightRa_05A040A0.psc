;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname lope_QF_lope_DogArena_fightRa_05A040A0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Master2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Master2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LosersMaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LosersMaster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArenaStaff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArenaStaff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpponentMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpponentMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RandomVisitor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RandomVisitor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY arenaCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_arenaCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LosersMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LosersMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OpponentMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OpponentMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Loser
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Loser Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WinnersMaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WinnersMaster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY winner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_winner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Opponent2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Opponent2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Master1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Master1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Opponent1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Opponent1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE lope_DogArenaRadiantFightController
Quest __temp = self as Quest
lope_DogArenaRadiantFightController kmyQuest = __temp as lope_DogArenaRadiantFightController
;END AUTOCAST
;BEGIN CODE
ArenaGate.SetOpen(True)
func.rotateOpponentMarkers(\
    arenaCenter,\
    alias_OpponentMarker1.getReference(),\
    alias_OpponentMarker2.getReference())
alias_Opponent1.getActorReference().evaluatePackage()
alias_Opponent2.getActorReference().evaluatePackage()
kmyQuest.registerForCheck()
; setObjectiveDisplayed(5)
; alias_OpponentMarker1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; func.setOpponentsHeadingEachOther(alias_Opponent1.getActorRef(), alias_Opponent2.getActorRef())
(alias_Opponent1 as lope_DogArena_opponentWatch).unregisterForPreFightWarn()
(alias_Opponent2 as lope_DogArena_opponentWatch).unregisterForPreFightWarn()


ArenaGate.SetOpen(False)
ArenaGate.Lock(True)
ArenaGate.SetLockLevel(255)
(alias_Opponent1 as lope_DogArena_opponentWatch).fighting = True
(alias_Opponent2 as lope_DogArena_opponentWatch).fighting = True
alias_Opponent1.getActorReference().addToFaction(PO3_SKSEFunctions.getFormFromEditorID("lope_DogArenaOpponent1") as Faction)
alias_Opponent2.getActorReference().addToFaction(PO3_SKSEFunctions.getFormFromEditorID("lope_DogArenaOpponent2") as Faction)
utility.wait(1)
alias_Opponent2.getActorReference().StartCombat(alias_Opponent1.getActorReference())
alias_Opponent1.getActorReference().StartCombat(alias_Opponent2.getActorReference())
alias_Opponent1.getActorReference().evaluatePackage()
alias_Opponent2.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
alias_Opponent1.getActorReference().playIdle(dogGrowl)
alias_Opponent2.getActorReference().playIdle(dogGrowl)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE lope_DogArenaRadiantFightController
Quest __temp = self as Quest
lope_DogArenaRadiantFightController kmyQuest = __temp as lope_DogArenaRadiantFightController
;END AUTOCAST
;BEGIN CODE
If DogArenaMainQST.isRunning()
    Int choise = Utility.randomInt(1, 99)
    ; debug.messagebox(choise)
    If 1 <= choise && choise < 25
        DARFc.startVariant = 1
    elseif 25 <= choise && choise < 50
        DARFc.startVariant = 2
    elseif 50 <= choise && choise < 75
        DARFc.startVariant = 3
    elseif 75 <= choise && choise <= 99
        DARFc.startVariant = 4
    endIf
    Int rnd = choise / 33
    if rnd == 0
        DARFc.sexVariant = 1
    elseif rnd == 1
        DARFc.sexVariant = 2
    elseif rnd == 2 || rnd == 3
        DARFc.sexVariant = 3
    ; elseif DARFc.startVariant == 4
    ;     DARFc.sexVariant = 4
    endif
    ; debug.messageBox(po3_sksefunctions.getformeditorid(lope_DogArena_fightRadiant_FightStarts01))
    ; DARFc.startVariant = 4  ; DEBUG
    ; DARFc.sexVariant = 2  ; DEBUG
    utility.wait(1)
    kmyQuest.PlayScene(lope_DogArena_fightRadiant_FightStarts01)
    ; lope_DogArena_fightRadiant_FightStarts01.start()
    ; Scene test_scene = PO3_SKSEFunctions.GetFormFromEditorID("lope_DogArena_fightRadiant_testScene") As scene
    ; test_scene.ForceStart()
    ; utility.wait(0.4)
    ; debug.messagebox(test_scene)
    ; SetStage(2)
Else
    DARFc.startVariant = 1
    SetStage(5)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
func.setOpponentsHeadingEachOther(alias_Opponent1.getActorRef(), alias_Opponent2.getActorRef(), False)

; setObjectiveDisplayed(100)
alias_Opponent1.getActorReference().removeFromFaction(PO3_SKSEFunctions.getFormFromEditorID("lope_DogArenaOpponent1") as Faction)
alias_Opponent2.getActorReference().removeFromFaction(PO3_SKSEFunctions.getFormFromEditorID("lope_DogArenaOpponent2") as Faction)
alias_Opponent2.getActorReference().StopCombat()
alias_Opponent1.getActorReference().StopCombat()
alias_Opponent2.getActorReference().ClearLookAt()
alias_Opponent1.getActorReference().ClearLookAt()
alias_Opponent1.clear()
alias_Opponent2.clear()
ArenaGate.SetOpen(True)
ArenaGate.Lock(False)

; String sceneEditorID = "lope_DogArena_fightRadiant_AfterFightScene0" + DARFc.startVariant
afterFightScene = PO3_SKSEFunctions.getFormFromEditorID(\
    "lope_DogArena_fightRadiant_AfterFightScene0" + DARFc.startVariant) as Scene
afterFightScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
DAvc.isRadiantFightRunning = 0
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;func.rotateOpponentMarkers(\
;    arenaCenter,\
;    alias_OpponentMarker1.getReference(),\
;    alias_OpponentMarker2.getReference())
DAvc.isRadiantFightRunning = 1
setStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE lope_DogArenaRadiantFightConditions
Quest __temp = self as Quest
lope_DogArenaRadiantFightConditions kmyQuest = __temp as lope_DogArenaRadiantFightConditions
;END AUTOCAST
;BEGIN CODE
kmyQuest.resetAllConditions()
setStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE lope_DogArenaRadiantFightController
Quest __temp = self as Quest
lope_DogArenaRadiantFightController kmyQuest = __temp as lope_DogArenaRadiantFightController
;END AUTOCAST
;BEGIN CODE
int sceneVariant
if DARFc.startVariant==1 || DARFc.startVariant==4
    sceneVariant = 1
else
    sceneVariant = 2
endif

sceneAfterMating = PO3_SKSEFunctions.getFormFromEditorID(\
    "lope_DogArena_fightRadiant_SceneAfterMating0" + sceneVariant) as Scene
; debug.messagebox(sceneAfterMating)
sceneAfterMating.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
utility.Wait(4)
lope_DogArena_fightRadiant_FightStarts01.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property arenaCenter  Auto  

lope_functions Property func  Auto  

lope_DogArenaRadiantFightConditions  Property DARFc  Auto  

lope_DogArena_VisitorsConditions  Property DAvc  Auto  

ObjectReference Property ArenaGate  Auto  

Scene Property afterFightScene  Auto  

Idle Property dogGrowl  Auto  

Idle Property DogKnockdown  Auto  

Scene Property sceneAfterMating  Auto  

ReferenceAlias Property LosersMasterOnStart  Auto  

Quest Property DogArenaMainQST  Auto  

Scene Property lope_DogArena_fightRadiant_FightStarts01  Auto  
