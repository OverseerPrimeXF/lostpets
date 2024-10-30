;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname lope_DBG_TIF__1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int i = 0
faction[] facs = akSpeaker.GetFactions(-2, 127)
string facNames = ""
while i < facs.length
    facNames += po3_sksefunctions.getFormEditorID(facs[i]) + "\n"
    i += 1
endwhile

debug.messageBox(facNames)
; opp1.getActorRef().playIdle(woldIdle)
; opp2.getActorRef().playIdle(woldIdle)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ssh  Auto  

Idle Property woldIdle  Auto  



ReferenceAlias Property opp1  Auto  

ReferenceAlias Property opp2  Auto  
