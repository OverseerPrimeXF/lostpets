;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_RGK_discussionEnd Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ActorUtil.RemovePackageOverride(MercerFreyREF, mercerGTFO)
DFS.dismissFollower(0, 0)
debug.messageBox("Ruby will do her things for now")
GetOwningQuest().setStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property MercerFreyRef  Auto  

Package Property mercerGTFO  Auto  

DialogueFollowerScript Property DFS  Auto  
