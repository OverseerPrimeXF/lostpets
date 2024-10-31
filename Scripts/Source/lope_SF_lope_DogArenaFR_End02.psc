;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_SF_lope_DogArenaFR_End02 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stripUtil.unstrip_actor(visitor.getActorReference())
getOwningQuest().setstage(999)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property visitor  Auto  

lope_strippingUtility Property stripUtil  Auto  
