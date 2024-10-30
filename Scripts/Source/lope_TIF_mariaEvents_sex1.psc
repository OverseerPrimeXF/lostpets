;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname lope_TIF_mariaEvents_sex1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_11
Function Fragment_11(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
String tags = "Cunnilingus"
If (getOwningQuest() as lope_mariaEvents_slHelper).sl.sexlab.PlayerRef.getActorBase().getSex() == 1 ;  holy shet
    tags += ",Lesbian"
endIf
    (getOwningQuest() as lope_mariaEvents_slHelper).beginScene(\
        human1=akSpeaker, playerGoesFirst=false, tags=tags, tagsExcluded="dildo,Standing")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

