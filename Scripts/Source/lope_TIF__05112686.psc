;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__05112686 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if !Innkeeper.getReference() || !Innkeeper.getReference().IsInLocation(PlayerREF.GetCurrentLocation())
    lope_aliasUtil.setstage(0)
    Innkeeper.ForceRefTo(InnkeeperExt.GetReference())
    ;debug.messagebox(Innkeeper.GetReference())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
lope_aliasUtil.stop()
innVisited.setValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Innkeeper  Auto  

ReferenceAlias Property InnkeeperExt  Auto  

Quest Property lope_aliasUtil  Auto  

ObjectReference Property PlayerRef  Auto  

GlobalVariable Property InnVisited  Auto  
