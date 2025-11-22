;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname lope_SF_lope_RGK_kidnapSceneScript Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
func.ParalyseActor(Dog1.getActorReference())
func.ParalyseActor(Dog2.getActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
getOwningQuest().setStage(275)
getOwningQuest().setObjectiveDisplayed(275)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Meat.tryToDisable()
Meat2.tryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_functions Property func  Auto  

ReferenceAlias Property Dog1  Auto  

ReferenceAlias Property Dog2  Auto  

ReferenceAlias Property Meat  Auto  

ReferenceAlias Property Meat2  Auto  
