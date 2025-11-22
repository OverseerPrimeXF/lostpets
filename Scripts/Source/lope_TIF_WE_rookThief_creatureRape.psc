;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_TIF_WE_rookThief_creatureRape Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
String animationName
String sceneName
ObjectReference CreatureRef = Creature.getReference()
if (CreatureRef.getVoiceType() == crDogVoice || \
    CreatureRef.getVoiceType() == crDogHusky)
    animationName = "Billyy (Canine) Doggy Anal"
    sceneName="rookThief_rapeDog"
    (RubyQuest as lope_RubyThiefQuest_conditions).iRubyRaped = 1
elseIf (CreatureRef.getVoiceType() == crWolfVoice)
    animationName = "Billyy (Canine) Doggy Anal"
    sceneName="rookThief_rapeDog"
    (RubyQuest as lope_RubyThiefQuest_conditions).iRubyRaped = 2
elseIf CreatureRef.getVoiceType() == crDogDeathHound
    animationName = "Billyy (Canine) Doggy Anal"
    sceneName="rookThief_rapeDog"
    (RubyQuest as lope_RubyThiefQuest_conditions).iRubyRaped = 3
elseIf CreatureRef.getVoiceType() == crTrollVoice
    animationName = "Billyy (Troll) Doggy Anal 2"
    sceneName="rookThief_rapeTroll"
    (RubyQuest as lope_RubyThiefQuest_conditions).iRubyRaped = 4
endIf
Actor[] pets = new Actor[1]
pets[0] = Creature.getActorReference()
sl.petsSex(\
    petsREF=pets,\
    Human=akSpeaker,\
    isHumanJustWatching=False,\
    animName=animationName,\
    isShowSubtitle=True,\
    sceneName=sceneName,\
    isRape=True\
)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(150)
akSpeaker.evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Creature  Auto  

VoiceType Property CrDogVoice  Auto  
VoiceType Property CrDogDeathHound  Auto  
VoiceType Property CrDogHusky  Auto  
VoiceType Property CrWolfVoice  Auto  
VoiceType Property CrTrollVoice  Auto  

lope_sl Property sl  Auto  

Quest Property RubyQuest  Auto  
