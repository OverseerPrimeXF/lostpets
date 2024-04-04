Scriptname lope_LostPets_SL extends Quest  

SexLabFramework Property SexLab  Auto  

Import Debug

sslThreadController ThreadController

scene afterSexSceneGlobal = None


; Starts Sexlab scene with animation 'Dog worship service' by Billy with optional Skyrim scene. Args: ObjectReference Dog, scene[] scenes = None.
Function dogSexBlowjob(ObjectReference Dog, scene[] scenes = None, string animName ="", string tags = "", bool isUndressingDisabled = False)
    ;messagebox((dog as actor).getactorbase().getname())
    if scenes
        scenesArray = scenes
        scenesArrayLength = scenes.length
    endif

    sslThreadModel Thread = SexLab.NewThread() 

    Thread.AddActor(PlayerREF) ; 2nd param ForceSilent = bool
    Thread.AddActor(Dog as Actor) 
    Thread.SetHook("dogBlowjob") 

    SexLab.TrackActor(Dog as Actor, "DogTracking")

    RegisterForModEvent("HookAnimationStart_dogBlowjob", "dogBlowjobStarted")
    RegisterForModEvent("HookStageStart_dogBlowjob", "dogBlowjobStageStart")
    RegisterForModEvent("HookStageEnd_dogBlowjob", "dogBlowjobStageEnd")
    RegisterForModEvent("HookAnimationEnd_dogBlowjob", "dogBlowjobEnded")
    RegisterForModEvent("HookDogTracking_Orgasm", "dogOrgasms") 
    
    sslBaseAnimation[] anim = new sslBaseAnimation[1]
    sslBaseAnimation[] anims

    ;tags = "Billyy, Creature, Dog, Canine, Wolf, Bestiality, CF, Dirty, Loving, Foreplay, Kneeling, Laying, Balljob, Handjob, Blowjob, CumInMouth, Oral, MovingDick, ABC"
    if tags
        anims = SexLab.GetCreatureAnimationsByRaceTags(2, (dog as actor).getRace(), tags , "", True)
    endif
    if animName 
        anim[0] = SexLab.GetCreatureAnimationByName(animName) 
    endif
    ;messagebox(anims)
    if anims || anim[0]
        if isUndressingDisabled == true ;if we dont wand her undress
    	     Thread.SetNoStripping(SexLab.PlayerRef)
        endif
        if anim
            Thread.SetAnimations(anim)
        endif
        if anims
            Thread.SetAnimations(anims)
        endif
        Thread.StartThread()
        ThreadController = sexlab.threadslots.getcontroller(Thread.tid)
    Else
        debug.notification("Shoite! No valid animations found, mating skipped.")
        Utility.Wait(1)
        ;afterFirstMating(HumanActor)
    endif  
EndFunction


Event dogBlowjobStarted(int tid, bool hasplayer)
    currentStage = 0
    ThreadController.UpdateTimer(120)
    ; ThreadController.GoToStage(3)
    ; utility.wait(20)
    ; ThreadController.endanimation()
    ; ThreadController.AdvanceStage()
endevent


; Advances Sexlab stage to next one.
function nextStageSexlab()
    currentStage += 1
    ThreadController.AdvanceStage()
endfunction


; Sets lope_LostPetsRadiant quest stage, arfs: int Stage.
function setQuestStage(int stage)
    setstage(stage)
endfunction


Event dogBlowjobStageStart(int tid, bool hasplayer)
    ;messagebox("currentStage - "+currentStage)
    scenesArray[currentStage].start()
    ThreadController.UpdateTimer(120)
    ;
endevent


Event dogBlowjobStageEnd(int tid, bool hasplayer)
    ;currentStage += 1
    ;
endevent

Event dogBlowjobEnded(int tid, bool hasplayer)
    ; start final scene
endevent


Event dogOrgasm(int tid, bool hasplayer)
    ;messagebox("dog cumming")
    ;
endevent


; Increase relationshiprank with Pet after mating.
function IncreaseRelationship(Actor target)
    int relations = target.GetRelationshipRank(PlayerREF)
    if relations  < 4
        target.SetRelationshipRank(PlayerREF, relations + 1)
    endif
endfunction


function foo(actor dog)
    sslBaseAnimation[] anim = new sslBaseAnimation[1]
    string animName = "Anubs  Dog Anal"
    anim[0] = SexLab.GetCreatureAnimationByName(animName) ;  "Billyy (Canine) Laying Worship Service"
    debug.messagebox(anim[0])
    animName = "Anubs, Creature, Dog, Bestiality, Dirty, Rough, Anal"
    anim = SexLab.GetCreatureAnimationsByRaceTags(2, (dog as actor).getRace(), animName, "", True)
    debug.messagebox(anim[0]) 
endfunction


Actor Property PlayerRef  Auto  

Int property currentStage Auto hidden
Int property scenesArrayLength Auto hidden

Scene[] Property scenesArray Auto hidden 
 

ReferenceAlias Property Pet  Auto  

Sound Property DogWhine  Auto  
