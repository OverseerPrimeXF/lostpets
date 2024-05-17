;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__052A35E7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Quest this = getOwningquest()
this.completeAllObjectives()
this.setstage(1000)
this.completeQuest()
this.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
wolfEnc01.getRef().Enable()
wolfEnc02.getRef().Enable()
wolfEnc01.getRef().moveTo(utilCell)
wolfEnc02.getRef().moveTo(utilCell)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property utilCell  Auto  

ReferenceAlias Property WolfEnc01  Auto  

ReferenceAlias Property WolfEnc02  Auto  
