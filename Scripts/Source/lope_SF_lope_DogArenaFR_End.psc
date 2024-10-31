;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_SF_lope_DogArenaFR_End Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stripUtil.unstrip_actor(visitor.getActorReference())
getOwningQuest().setstage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if DARC.startVariant == 1
DARC.SceneAfterMatingVariant = utility.RandomInt(10, 100) / 10
else
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_DogArenaRadiantFightConditions Property DARc  Auto

lope_strippingUtility Property stripUtil  Auto  

ReferenceAlias Property visitor  Auto  
