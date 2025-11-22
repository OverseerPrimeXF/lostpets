;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname lope_QF_lope_FalmersGirl_051338CE Extends Quest Hidden

;BEGIN ALIAS PROPERTY Falmer1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falmer1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Falmer3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falmer3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bedroll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bedroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Girl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Girl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Falmer2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falmer2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
setObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
TrapTrigger.disable()

; (game.getPlayer().moveto(TrapTrigger))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property TrapTrigger  Auto  

