;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 52
Scriptname lope_QF_lope_RubyGrandKidnapp_05EEB06B Extends Quest Hidden

;BEGIN ALIAS PROPERTY SackWithDog2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SackWithDog2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dog1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dog1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hideout
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hideout Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Meat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Meat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthJarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkarthJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Potion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Potion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WritingChair
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WritingChair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Voada
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Voada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Marise
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Marise Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ingun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ingun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dog2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dog2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UrnWithGold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UrnWithGold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Meat2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Meat2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SackWithDog1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SackWithDog1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DogTemporalFollower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DogTemporalFollower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DemandsNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DemandsNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ruby
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ruby Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE lope_RGK_controller
Quest __temp = self as Quest
lope_RGK_controller kmyQuest = __temp as lope_RGK_controller
;END AUTOCAST
;BEGIN CODE
; debug.messageBox("stage 5")
; setStage(5)
; utility.wait(1)
; kmyQuest.playScene(VoadaFeedsDogs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(55)
setObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
setObjectiveCompleted(300)
setObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE lope_RGK_controller
Quest __temp = self as Quest
lope_RGK_controller kmyQuest = __temp as lope_RGK_controller
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(610)
setObjectiveDisplayed(650)
(alias_demandsNote as lope_RGK_demandsNoteWatch).registerProgression(kmyQuest.daysToWait, 700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE lope_RGK_controller
Quest __temp = self as Quest
lope_RGK_controller kmyQuest = __temp as lope_RGK_controller
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(650)
setObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
setObjectiveCompleted(751)
setObjectiveDisplayed(760)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
setObjectiveCompleted(520)
setObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(55)
;setObjectiveCompleted(100)
setObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
setObjectiveCompleted(600)
setObjectiveDisplayed(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
setObjectiveDisplayed(750, false)
setObjectiveDisplayed(751, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
setObjectiveCompleted(712)
setObjectiveDisplayed(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
setObjectiveCompleted(400)
setObjectiveDisplayed(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
setObjectiveCompleted(710)
setObjectiveDisplayed(712)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(10)
setObjectiveDisplayed(51)
setObjectiveDisplayed(52)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN AUTOCAST TYPE lope_RGK_controller
Quest __temp = self as Quest
lope_RGK_controller kmyQuest = __temp as lope_RGK_controller
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(700)
setObjectiveDisplayed(710)
; needs to be loaded, so cant add item here
; kmyquest.placeItem(alias_UrnWithGold.getReference(), gold001, 40000)
; ObjectReference urn = alias_UrnWithGold.getReference()
; urn.addItem(Gold001, 40000)
; debug.messageBox("710")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
setObjectiveCompleted(500)
setObjectiveDisplayed(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
setObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(200)

setObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
CompleteAllObjectives()
setObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
completeAllObjectives()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
setObjectiveCompleted(510)
setObjectiveDisplayed(520)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property VoadaFeedsDogs  Auto  

MiscObject Property Gold001  Auto  
