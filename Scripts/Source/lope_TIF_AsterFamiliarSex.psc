;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_AsterFamiliarSex Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Conditions.iAsterInSceneWithFamiliar = 1
sl.sceneOffset = func.getOffsetArray(Bedroll, "bedroll")
sl.petSexNPC(Familiar, Aster,\
                        tags="Missionary",\
                        actionOnEnd="setcondition,AsterInSceneWithFamiliar,0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
thisScene.stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Familiar  Auto  

Actor Property Aster  Auto    

lope_sl Property sl  Auto  

ObjectReference Property Bedroll  Auto  

lope_functions Property func  Auto  

lope_conditionsContainer Property Conditions  Auto  

Scene Property thisScene  Auto  
