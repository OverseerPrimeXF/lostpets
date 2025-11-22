;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_SE_Haafingar3_stage10 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; debug.messageBox(\
;     func.getOffsetArray(sexChair.getReference(), "Chair") + "\n" + \
;     Chair.GetPositionX() +" "+Chair.GetPositionY() +" "+Chair.GetPositionZ()\
; )
;sl.sceneOffset = func.getOffsetArray(sexChair.getReference(), "Chair")
;sl.petSexNPC(\
;   Grimner, akSpeaker,\
;   animName="Billyy (Canine) Chair(Armless) Over Chair Anal")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(10)
akSpeaker.evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

Actor Property Grimner  Auto  

ReferenceAlias Property SexChair  Auto  

lope_functions Property func  Auto  

ObjectReference Property Chair  Auto  
