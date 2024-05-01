;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_QF_lope_LostPetsStart_0500BA6F Extends Quest Hidden

;BEGIN ALIAS PROPERTY RumorsSourceREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RumorsSourceREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RumorSourceLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_RumorSourceLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;ObjectReference PS = PlayerSpeaker.getReference()
;PlayerREF.PlaceAtMe(PS)
;PS.disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PlayerSpeaker  Auto  

ObjectReference Property PlayerRef  Auto  

GlobalVariable Property minimalRelationship  Auto  
