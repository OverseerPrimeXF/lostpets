;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF__052405C7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; lope_ShowSubtitlesHandler ssh = (lope_SSH as lope_ShowSubtitlesHandler)
; ss h.ShowSubtitles(sceneName="dogTagsAnal",\
;                         stageId=0,\
;                         partner=akspeaker)
; ssh.countPrefix()

foos.MoveActorToRandomPosBehind(akspeaker, game.GetPlayer(), 240, 612)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property lope_SSH  Auto  

lope_functions Property foos  Auto  
