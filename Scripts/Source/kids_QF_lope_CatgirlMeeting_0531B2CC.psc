;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname kids_QF_lope_CatgirlMeeting_0531B2CC Extends Quest Hidden

;BEGIN ALIAS PROPERTY Kitty
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kitty Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DrunkMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DrunkMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Kitty = alias_Kitty.getActorReference()
Kitty.MoveTo(alias_drunkMarker.getReference())
kitty.EvaluatePackage()
Utility.wait(2)
Kitty.MoveTo(alias_drunkMarker.getReference())
kitty.EvaluatePackage()

setObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
