;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__05186BD1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
sl.PetSex(akspeaker, tags="Cowgirl", sceneName="dogTagsCowgirl", isShowSubtitle=true)
aboutToMate.setvalue(0)
isPlayingTags.setvalue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_sl Property sl  Auto  

GlobalVariable Property aboutToMate  Auto  

GlobalVariable Property isPlayingTags  Auto  
