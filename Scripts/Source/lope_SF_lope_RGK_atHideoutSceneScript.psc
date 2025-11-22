;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname lope_SF_lope_RGK_atHideoutSceneScript Extends Scene Hidden

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
dog1.getActorReference().playIdle(DogIdleWarn)
dog2.getActorReference().playIdle(DogIdleWarn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
dog1.getActorReference().playIdle(DogIdleWarn)
dog2.getActorReference().playIdle(DogIdleWarn)
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

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
dog1.getActorReference().playIdle(DogIdleWarn)
dog2.getActorReference().playIdle(DogIdleWarn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
getOwningQuest().setStage(500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property DogIdleWarn  Auto  

ReferenceAlias Property Dog1  Auto  

ReferenceAlias Property Dog2  Auto  
