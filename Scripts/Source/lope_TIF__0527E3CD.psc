;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF__0527E3CD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; startup.setPetsArrays()
; bool FIH = lope_Fenris.GetCurrentLocation().IsChild(\
;     Storage.HaafingarLoc())
; debug.messagebox(Storage.HaafingarLoc()+fih)
debug.messagebox(Storage.HaafingarLoc() as string)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ssh  Auto  

Idle Property Wave  Auto  

ObjectReference Property lope_Fenris  Auto  

Form Property FenrisForm  Auto  

lope_LostPetsStartupRoutine Property startup  Auto  

lope_storageContainer Property Storage  Auto  
