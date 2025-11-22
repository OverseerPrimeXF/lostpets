;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_TIF_RGK_placeMeatNearDogs Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
dog1.getReference().addItem(foodBeef)
meat.forceRefTo(dog1.getReference().DropObject(foodBeef))

dog2.getReference().addItem(foodBeef)
meat2.forceRefTo(dog2.getReference().DropObject(foodBeef))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property FoodBeef  Auto  

ReferenceAlias Property Dog1  Auto  

ReferenceAlias Property Dog2  Auto  

ReferenceAlias Property Meat  Auto  

ReferenceAlias Property Meat2  Auto  
