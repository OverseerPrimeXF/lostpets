;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname lope_TIF__04000D6A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;/sub.showSubtitles(PlayerRef, text="*Moaning fast and loud, feeling dog's cum filling her uterus* Yes, yes! Make me puppies!")
utility.wait(3)
sub.showSubtitles(Pet.getActorRef(), text="Cumming inside player")
utility.wait(3)
sub.WidgetVisible(false)/;
subt.showString()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Pet  Auto  

ReferenceAlias Property Owner  Auto  

Faction Property LostPetsFac  Auto  

ObjectReference Property Marker  Auto  

ObjectReference Property xmarkerKatla  Auto  

lope_lostpets_sl Property sl Auto  

lopeSubtitles Property sub  Auto  

Actor Property PlayerRef  Auto  

lopeGetSubtitles Property subt  Auto  
