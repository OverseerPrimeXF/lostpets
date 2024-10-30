;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname lope_DBG_TIF__2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
stripUtil.strip_actor(akSpeaker, True)
;/
;cond.visitor01OnArena = 0
;cond.visitor02OnArena = 0
;cond.visitor03OnArena = 0
;cond.visitor04OnArena = 0

Scene test_scene = (po3_sksefunctions.getformfromeditorid("lope_DogArena_fightRadiant_FightStarts01") as Scene)
; Scene test_scene = PO3_SKSEFunctions.GetFormFromEditorID("lope_DogArena_fightRadiant_testScene") As scene
test_scene.ForceStart()

String tagz = "Vaginal, Creampie"
sl.petSexNPC(\
    Predator.getActorReference(),\
    lope_MariaREF,\
    tags=Tagz,\
    actionOnEnd="setStage,lope_DogArena_fightRadiant,200")
; sexlab.QuickStart(Predator.getActorReference(), lope_MariaREF, AnimationTags=tagz)
/;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_storageContainer Property Storage  Auto  

ReferenceAlias Property Predator  Auto  



lope_waitor1 Property wtr  Auto  

lope_waitor1_refali Property wat1  Auto  

lope_waitor1_refali Property wat2  Auto  

Scene Property AsterIntimacy  Auto  

SexLabFramework Property SexLab  Auto  

lope_DogArena_VisitorsConditions  Property cond  Auto  


lope_sl Property sl  Auto  

Actor Property lope_MariaREF  Auto  

Actor Property Hulda  Auto  

lope_strippingUtility Property stripUtil  Auto  
