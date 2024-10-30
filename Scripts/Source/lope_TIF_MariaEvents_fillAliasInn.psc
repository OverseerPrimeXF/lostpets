;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_MariaEvents_fillAliasInn Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; init all aliases

(getOwningQuest() as lope_mariaEvents_aliasUtil).fillAliases()
;/
utilityQuest.setStage(0)
Utility.Wait(0.5)
if aliasFurniture1Ext.getRef()
    aliasFurniture.forceRefTo(aliasFurniture1Ext.getRef())
elseif aliasFurniture2Ext.getRef()
    aliasFurniture.forceRefTo(aliasFurniture2Ext.getRef())
endif
aliasCenterMarker.forceRefTo(aliasCenterMarkerExt.getRef())
aliasBard.forceRefTo(aliasBardExt.getRef())
utilityQuest.stop()
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;
conditions.iBlockMariaFollowerDialogues = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property utilityQuest  Auto  

ReferenceAlias Property aliasFurniture  Auto  
ReferenceAlias Property aliasCenterMarker  Auto  
ReferenceAlias Property aliasInnkeeper  Auto 

ReferenceAlias Property aliasFurniture1Ext  Auto  
ReferenceAlias Property aliasFurniture2Ext  Auto  
ReferenceAlias Property aliasCenterMarkerExt  Auto  
ReferenceAlias Property aliasInnkeeperExt  Auto  

lope_conditionsContainer Property Conditions  Auto  

ReferenceAlias Property aliasBard  Auto  

ReferenceAlias Property aliasBardExt  Auto  
