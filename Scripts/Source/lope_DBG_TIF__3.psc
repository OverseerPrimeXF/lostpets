;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_DBG_TIF__3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
debug.messagebox(\
    lope_nativeFunctions.FindReferencesOfTypeInCellWithOwner(akSpeaker, sexlabBeds, 0))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property testAlias  Auto  

Scene Property lope_dbg_debugScene  Auto  

lope_functions Property func  Auto  

Idle Property write  Auto  

FormList Property SexLabBeds  Auto  
