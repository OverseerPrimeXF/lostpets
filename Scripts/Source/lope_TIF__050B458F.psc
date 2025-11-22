;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__050B458F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;  getowningquest().setstage(999)
; getowningquest().stop()
; getowningquest().CompleteQuest()
;  lope_start.setstage(1000)
;  lope_start.stop()
;  onUpdateRadiant.registerForRadiant(12)
; lope_start.setstage(0)
;  overseer.registerForVisit() ;  it's me!
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property lope_start  Auto  

lope_onUpdateWatch Property overseer  Auto  

lope_onUpdateRadiant Property onUpdateRadiant  Auto  
