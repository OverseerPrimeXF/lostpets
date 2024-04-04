;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__0514B560 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
isPlayingTag.setValue(1)
Tags.resetTags()
DogCatcher.forceRefTo(Pet.getRef())
Pet.getActorRef().EvaluatePackage()
getowningquest().setobjectivedisplayed(100)
Tags.register(2.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DogCatcher  Auto  

ReferenceAlias Property DogRunaway  Auto  

ReferenceAlias Property Pet  Auto  

GlobalVariable Property isPlayingTag  Auto  

lope_TagsGameWithPet Property Tags  Auto  
