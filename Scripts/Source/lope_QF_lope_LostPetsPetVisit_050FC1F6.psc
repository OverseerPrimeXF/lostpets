;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname lope_QF_lope_LostPetsPetVisit_050FC1F6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Pet_GameCatcher
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pet_GameCatcher Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetFollower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetFollower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Owner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Owner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerSpeaker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerSpeaker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Pet_GameRunaway
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pet_GameRunaway Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TavernBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TavernBed Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE lope_PetVisitScript
Quest __temp = self as Quest
lope_PetVisitScript kmyQuest = __temp as lope_PetVisitScript
;END AUTOCAST
;BEGIN CODE
kmyquest.setStartTime()
kmyquest.register(2.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
