Scriptname lope_sl extends Quest  
{ Newest version of SL script which handles animation start }

SexLabFramework Property SexLab  Auto  

Import Debug
Import sslCreatureAnimationSlots 
Import Utility


sslThreadController ThreadController

bool subtitlesG
String sceneNameG
scene afterSexSceneGlobal = None
Actor currentPet


;/Starts Sexlab scene with options.
Args: ObjectReference Pet : with who start scene;
      String animName = "None": if need to start specific anim // DON'T USE WITH  tags;
      String tags = "None": if need to use tags // DON'T USE WITH animName;
      Scene[] scenes = None : if need to player scene with slscene [obsolete candidate];
      String sceneName = "None" : name of scene to find in Json Subtitles;
      Bool isShowSubtitle = False : must use with sceneName, to show ubtitles;
      Bool isUndressingDisabled = False : disable player undressing.
/;
Function petSex(Actor PetREF,\
                String animName = "None",\
                String tags = "None",\
                Scene[] scenes = None,\
                String sceneName = "None",\
                Bool isShowSubtitle = False,\
                Bool isUndressingDisabled = False\
                )
    ; messagebox(PetREF.getactorbase().getname())
    ; Setup variables if given
    if scenes
        scenesArray = scenes
        scenesArrayLength = scenes.length
    endif
    if isShowSubtitle
        subtitlesG = True
    else
        subtitlesG = False
    endif
    if sceneName != "None"
        sceneNameG = sceneName
    endif

    currentPet = PetREF
    sslThreadModel Thread = SexLab.NewThread() 

    Thread.AddActor(PlayerREF) ; 2nd param ForceSilent = bool
    Thread.AddActor(PetREF)
    Thread.SetHook("petSex") 

    SexLab.TrackActor(PetREF, "PetTracking")

    RegisterForModEvent("HookAnimationStart_petSex", "petSexStarted")
    RegisterForModEvent("HookStageStart_petSex", "petSexStageStart")
    RegisterForModEvent("HookStageEnd_petSex", "petSexStageEnd")
    RegisterForModEvent("HookAnimationEnd_petSex", "petSexEnded")
    RegisterForModEvent("HookPetTracking_Orgasm", "PetOrgasms") 
    
    sslBaseAnimation[] anim = new sslBaseAnimation[1]
    sslBaseAnimation[] anims
    string RaceKey
    ;tags = "Billyy, Creature, Dog, Canine, Wolf, Bestiality, CF, Dirty, Loving, Foreplay, Kneeling, Laying, Balljob, Handjob, Blowjob, CumInMouth, Oral, MovingDick, ABC"
    if tags != "None"
        RaceKey = GetRaceKey(PetREF.getRace())
        ; messagebox("RaceKey ="+RaceKey)
        ; messagebox("TAGS = "+tags)
        anims = SexLab.GetCreatureAnimationsByRacekeyTags(2, RaceKey , tags, "", True)
        ; messagebox(PetREF.getRace())
    endif
    if animName != "None"
        anim[0] = SexLab.GetCreatureAnimationByName(animName) 
    endif
    ; messagebox(anims)
    ; messagebox(anim[0])
    if anims || anim[0]
        if isUndressingDisabled == true ;if we dont wand her undress
    	     Thread.SetNoStripping(SexLab.PlayerRef)
        endif
        wait(1)
        if anim[0]
            ; messagebox("anim set, animName "+anim[0])
            Thread.SetAnimations(anim)
        endif
        if anims
            ; messagebox("anims set, tags "+anims)
            Thread.SetAnimations(anims)
        endif
        PlayerREF.RemoveFromFaction(SexLabAnimatingFaction)
        Thread.StartThread()
        ThreadController = sexlab.threadslots.getcontroller(Thread.tid)
    Else
        notification("Shoite! No valid animations found or something went wrong."+\
                     "Trying to start at least something.")
        ; Utility.Wait(1)
        Thread.ClearAnimations()
        PlayerREF.RemoveFromFaction(SexLabAnimatingFaction)
        actor[] actors = new actor[2]
        actors[0] = PlayerRef
        actors[1] = PetREF
        sslBaseAnimation[] anim_backup = SexLab.GetCreatureAnimationsByRaceKey(2, RaceKey)
        int tid = SexLab.StartSex(actors, anim_backup, Hook="petSex")
        ThreadController = sexlab.threadslots.getcontroller(tid)
    endif  
EndFunction


Event petSexStarted(int tid, bool hasplayer)
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


; Sets lope_LostPetsRadiant quest stage, args: int Stage.
function setQuestStage(int stage)
    setstage(stage)
endfunction


Event petSexStageStart(int tid, bool hasplayer)
    ; messagebox("currentStage - "+currentStage)
    if scenesArray
        scenesArray[currentStage].start()
    endif
    if subtitlesG
        ; subt.showString(sceneId=currentStage, partner=currentPet)
        (lope_SSH as lope_ShowSubtitlesHandler\
        ).ShowSubtitles(sceneName=sceneNameG,\
                        stageId=currentStage,\
                        partner=currentPet)
    endif
    ThreadController.UpdateTimer(120)
endevent


Event petSexStageEnd(int tid, bool hasplayer)
    ; currentStage += 1
    ;
endevent

Event petSexEnded(int tid, bool hasplayer)
    ; start final scene
endevent


Event PetOrgasms(int tid, bool hasplayer)
    ;messagebox("pet cumming")
    ;
endevent


; Increase relationshiprank with Pet after mating.
function IncreaseRelationship(Actor target)
    int relations = target.GetRelationshipRank(PlayerREF)
    if relations  < 4
        target.SetRelationshipRank(PlayerREF, relations + 1)
    endif
endfunction


function playNPCReactionScene(ObjectReference NPC, Scene reaction, Keyword locKWD = None, Bool reqNPCNearby = True, Bool moveSpeaker=True)
    ;debug.messagebox("is loc is inn"+PlayerOREF.getCurrentLocation().hasKeyword(locKWD))
    ;debug.messagebox("is NPC is in player loc"+ NPC.IsInLocation(PlayerOREF.GetCurrentLocation()))

    if PlayerOREF.getCurrentLocation().hasKeyword(locKWD) && NPC.IsInLocation(PlayerOREF.GetCurrentLocation())
        if moveSpeaker
            PlayerSpeaker.moveto(PlayerRef, 50, 0, 50)
            ;PlayerSpeaker.SetMotionType(PlayerSpeaker.Motion_Keyframed)
        endif
        reaction.start()
    endif
endfunction


Actor Property PlayerRef  Auto  

Int property currentStage Auto hidden
Int property scenesArrayLength Auto hidden

Scene[] Property scenesArray Auto hidden 
 
ReferenceAlias Property Pet  Auto  

Sound Property DogWhine  Auto  

ObjectReference Property PlayerOREF  Auto  

ObjectReference Property PlayerSpeaker  Auto  

lopeGetSubtitles Property subt  Auto  

ReferenceAlias Property lope_SSH Auto  
Quest Property lope_SubtitlesWidget Auto  

Faction Property SexLabAnimatingFaction  Auto  
