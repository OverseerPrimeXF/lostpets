;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_DogArenaStart_setstage60 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(getOwningQuest() as lope_DogArenaStart_conditions).fStartedWaitingAt = Utility.GetCurrentGameTime()
if akSpeaker == lope_ElaraREF
    getOwningQuest().setstage(61)
    return
endif
;/
elseif PlayerREF.GetActorValue("Speechcraft") >= 50
    getOwningQuest().setstage(62)
    return
endif
/;
getOwningQuest().setstage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property lope_ElaraREF  Auto  

Actor Property PlayerRef  Auto  
