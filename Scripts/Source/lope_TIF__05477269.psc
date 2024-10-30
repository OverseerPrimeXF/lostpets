;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__05477269 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int i = 0
while i < allMead.GetSize()
    if PlayerREF.getItemCount(allMead.getAt(i)) >= 1
        PlayerREF.removeItem(allMead.getAt(i), 1)
        return
    endif
    i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PlayerRef  Auto  

Formlist  Property allMead  Auto  
