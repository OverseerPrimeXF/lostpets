Scriptname lope_sl extends Quest  
{ Newest version of SL script which handles animation start.
  #FuckTheDRY. }

SexLabFramework Property SexLab  Auto  

Import Debug
Import Utility

Import sslCreatureAnimationSlots
import PO3_SKSEFunctions


sslThreadController ThreadController

bool subtitlesG
String sceneNameG
String endingSceneNameG
String actionOnEndG
scene afterSexSceneGlobal = None
Actor currentPet
Actor currentNPC


;/ Starts Sexlab scene with options.
 Args: ObjectReference Pet : with who start scene;
      String animName = "None": if need to start specific anim // DON'T USE WITH  tags;
      String tags = "None": if need to use tags // DON'T USE WITH animName;
      Scene[] scenes = None : if need to player scene with slscene [deprecation candidate];
      String sceneName = "None" : name of scene to find in Json Subtitles;
      Bool isShowSubtitle = False : must use with sceneName, to show ubtitles;
      Bool isUndressingDisabled = False : disable player undressing.
/;
Function petSex(Actor PetREF,\
                Actor Human = None,\
                String animName = "None",\
                String tags = "None",\
                Scene[] scenes = None,\
                String sceneName = "None",\
                Bool isShowSubtitle = False,\
                Bool isUndressingDisabled = False,\
                String endingSceneName = "None"\
                )
    ; messagebox(PetREF.getactorbase().getname())
    ; Setup variables if given
    if Human
        currentNPC = Human
    else
        currentNPC = None
    endif
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
    if endingSceneName != "None"
        endingSceneNameG = endingSceneName
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

    if (sceneBed)
        Thread.CenterOnObject(sceneBed)
    ElseIf (sceneOffset && sceneOffset.Length == 6)
        Thread.CenterOnCoords(sceneOffset[0], sceneOffset[1], sceneOffset[2],\
                              sceneOffset[3], sceneOffset[4], sceneOffset[5])
    endif

    string RaceKey
    ;tags = "Billyy, Creature, Dog, Canine, Wolf, Bestiality, CF, Dirty, Loving, Foreplay, Kneeling, Laying, Balljob, Handjob, Blowjob, CumInMouth, Oral, MovingDick, ABC"
    if tags != "None"
        RaceKey = GetRaceKey(PetREF.getRace())
        ; messagebox("RaceKey ="+RaceKey)
        ; messagebox("TAGS = "+tags)
        anims = SexLab.GetCreatureAnimationsByRacekeyTags(2, RaceKey, tags, "", True)
        ; messagebox(PetREF.getRace())
    endif
    if animName != "None"
        anim[0] = SexLab.GetCreatureAnimationByName(animName) 
    endif
    ; messagebox(anims+RaceKey)
    ; messagebox(anim[0])
    if anims || anim[0]
        if isUndressingDisabled == true ;if we dont wand Player undress
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
        PetREF.RemoveFromFaction(SexLabAnimatingFaction)
        Thread.StartThread()
        if (sceneBed)
            Thread.CenterOnObject(sceneBed)
        ElseIf (sceneOffset && sceneOffset.Length == 6)
            ; MessageBox(sceneOffset)
            Thread.CenterOnCoords(sceneOffset[0], sceneOffset[1], sceneOffset[2],\
                                  sceneOffset[3], sceneOffset[4], sceneOffset[5])
        endif
        ThreadController = sexlab.threadslots.getcontroller(Thread.tid)
    Else
        notification("Shoite! No valid animations found or something went wrong.")
        notification("Trying to start at least something.")
        ; Utility.Wait(1)
        Thread.ClearAnimations()
        PlayerREF.RemoveFromFaction(SexLabAnimatingFaction)
        PetREF.RemoveFromFaction(SexLabAnimatingFaction)
        actor[] actors = new actor[2]
        actors[0] = PlayerRef
        actors[1] = PetREF
        sslBaseAnimation[] anim_backup = SexLab.GetCreatureAnimationsByRaceKey(2, RaceKey)
        int tid = SexLab.StartSex(actors, anim_backup, Hook="petSex")
        ThreadController = sexlab.threadslots.getcontroller(tid)
    endif  
EndFunction


; Start sex with multiple pets.
int Function petsSex(Actor[] PetsREF,\
                 Actor Human = None,\
                 String animName = "None",\
                 String tags = "None",\
                 Scene[] scenes = None,\
                 String sceneName = "None",\
                 Bool isShowSubtitle = False,\
                 Bool isUndressingDisabled = False,\
                 Bool isRape = False,\
                 String endingSceneName = "None",\
                 String actionOnEnd = "None")
    ; messagebox(PetREF.getactorbase().getname())
    ; Setup variables if given
    if Human
        currentNPC = Human
    else
        currentNPC = None
    endif
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
    if endingSceneName != "None"
        endingSceneNameG = endingSceneName
    endif
    if actionOnEnd
        actionOnEndG = actionOnEnd
    else
        actionOnEndG = None
    endif
    currentPet = PetsREF[0]
    sslThreadModel Thread = SexLab.NewThread()

    Thread.AddActors(PetsREF)
    If (Human)
        Thread.AddActor(Human, isRape)
    else        
        Thread.AddActor(PlayerREF, isRape) ; 2nd param ForceSilent = bool
    EndIf
    Thread.SetHook("petSex")
    int actorsCount = PetsREF.Length + 1

    SexLab.TrackActor(PetsREF[0], "PetTracking")
    RegisterForModEvent("HookAnimationStart_petSex", "petSexStarted")
    RegisterForModEvent("HookStageStart_petSex", "petSexStageStart")
    RegisterForModEvent("HookStageEnd_petSex", "petSexStageEnd")
    RegisterForModEvent("HookAnimationEnding_petSex", "petSexEnding")
    RegisterForModEvent("HookAnimationEnd_petSex", "DoActionOnEnd")
    RegisterForModEvent("PetTracking_Orgasm", "PetOrgasms")
    
    sslBaseAnimation[] anim = new sslBaseAnimation[1]
    sslBaseAnimation[] anims
    string RaceKey
    ;tags = "Billyy, Creature, Dog, Canine, Wolf, Bestiality, CF, Dirty, Loving, Foreplay, Kneeling, Laying, Balljob, Handjob, Blowjob, CumInMouth, Oral, MovingDick, ABC"
    if tags != "None"
        ; RaceKey = GetRaceKey(PetsREF[0].getRace())
        ; messagebox("RaceKey ="+RaceKey)
        ; messagebox("TAGS = "+tags)
        anims = SexLab.GetCreatureAnimationsByRaceTags(actorsCount, PetsREF[0].getRace() , tags, "", True)
        ; messagebox(PetREF.getRace())
    endif
    if animName != "None"
        anim[0] = SexLab.GetCreatureAnimationByName(animName) 
    endif
    ; messagebox(anims)
    ; messagebox(anim[0])
    if anims || anim[0]
        if isUndressingDisabled == true ;if we dont want her undress
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
        if (sceneBed)
            Thread.CenterOnObject(sceneBed)
        ElseIf (sceneOffset && sceneOffset.Length == 6)
            ; MessageBox(sceneOffset)
            Thread.CenterOnCoords(sceneOffset[0], sceneOffset[1], sceneOffset[2],\
                                  sceneOffset[3], sceneOffset[4], sceneOffset[5])
        endif
        ThreadController = sexlab.threadslots.getcontroller(Thread.tid)
        return Thread.tid
    Else
        notification("Shoite! No valid animations found or something went wrong.")
        notification("Trying to start at least something.")
        ; Utility.Wait(1)
        Thread.ClearAnimations()
        PlayerREF.RemoveFromFaction(SexLabAnimatingFaction)
        ; actor[] actors = new actor[3]
        ; actors[0] = PlayerRef
        ; actors[1] = PetsREF[0]
        ; actors[2] = PetsREF[1]
        ; Player is a pet now!
        RaceKey = GetRaceKey(PetsREF[0].GetRace())
        PapyrusUtil.ResizeActorArray(PetsREF, PetsREF.Length+1)
        AddActorToArray(PlayerRef, PetsREF)

        sslBaseAnimation[] anim_backup = SexLab.GetCreatureAnimationsByRaceKey(\
            PetsREF.Length, RaceKey)
        int tid = SexLab.StartSex(PetsREF, anim_backup, Hook="petsSex")
        ThreadController = sexlab.threadslots.getcontroller(tid)
        return tid
    endif  
EndFunction


int Function petSexNPC(Actor PetREF,\
                Actor Human,\
                String animName = "None",\
                String tags = "None",\
                Scene[] scenes = None,\
                String sceneName = "None",\
                Bool isShowSubtitle = False,\
                Bool isUndressingDisabled = False,\
                String endingSceneName = "None",\
                String actionOnEnd = "None"\
                )
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
    if actionOnEnd
        actionOnEndG = actionOnEnd
    else
        actionOnEndG = None
    endif
    if endingSceneName != "None"
        endingSceneNameG = endingSceneName
    endif
    currentPet = PetREF
    currentNPC = Human
    sslThreadModel Thread = SexLab.NewThread() 

    Thread.AddActor(Human) ; 2nd param ForceSilent = bool
    Thread.AddActor(PetREF)
    Thread.SetHook("petSexNPC") 

    SexLab.TrackActor(PetREF, "PetTracking")

    RegisterForModEvent("HookAnimationStart_petSexNPC", "petSexStarted")
    RegisterForModEvent("HookStageStart_petSexNPC", "petSexStageStart")
    RegisterForModEvent("HookStageEnd_petSexNPC", "petSexStageEnd")
    ; RegisterForModEvent("HookAnimationEnd_petSexNPC", "petSexEnded")
    RegisterForModEvent("HookAnimationEnd_petSexNPC", "DoActionOnEnd")
    RegisterForModEvent("PetTracking_Orgasm", "PetOrgasms") 
    
    sslBaseAnimation[] anim = new sslBaseAnimation[1]
    sslBaseAnimation[] anims

    string RaceKey
    ;tags = "Billyy, Creature, Dog, Canine, Wolf, Bestiality, CF, Dirty, Loving, Foreplay, Kneeling, Laying, Balljob, Handjob, Blowjob, CumInMouth, Oral, MovingDick, ABC"
    ; MessageBox(tags)
    if tags != "None"
        ; RaceKey = GetRaceKey(PetREF.getRace())
        ; messagebox("RaceKey ="+RaceKey)
        ; messagebox("TAGS = "+tags)
        ; anims = SexLab.GetCreatureAnimationsByRacekeyTags(2, RaceKey, tags, "", True) : ###############################
        anims = SexLab.GetCreatureAnimationsByRaceTags(2, PetREF.getRace(), tags, "")
        ; messagebox(PetREF.getRace())
    endif
    if animName != "None"
        anim[0] = SexLab.GetCreatureAnimationByName(animName) 
    endif
    ; messagebox(anims+RaceKey)
    ; messagebox(anim[0])
    if anims || anim[0]
        if isUndressingDisabled == true ;if we dont wand Player undress
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
        Human.RemoveFromFaction(SexLabAnimatingFaction)
        PetREF.RemoveFromFaction(SexLabAnimatingFaction)

        Thread.StartThread()
        if (sceneBed)
            Thread.CenterOnObject(sceneBed)
        ElseIf (sceneOffset && sceneOffset.Length == 6)
            ; MessageBox(sceneOffset)
            Thread.CenterOnCoords(sceneOffset[0], sceneOffset[1], sceneOffset[2],\
                                  sceneOffset[3], sceneOffset[4], sceneOffset[5])
        endif
        ThreadController = sexlab.threadslots.getcontroller(Thread.tid)
    Else
        notification("Shoite! No valid animations found or something went wrong.")
        notification("Trying to start at least something.")
        ; Utility.Wait(1)
        Thread.ClearAnimations()
        Human.RemoveFromFaction(SexLabAnimatingFaction)
        PetREF.RemoveFromFaction(SexLabAnimatingFaction)
        actor[] actors = SexLabUtil.MakeActorArray(Human, PetREF)
        ; actor[] actors = new actor[2]
        ; actors[0] = Human
        ; actors[1] = PetREF
        if tags != "None"
            RaceKey = GetRaceKey(PetREF.getRace())
            ; messagebox("RaceKey ="+RaceKey)
            ; messagebox("TAGS = "+tags)
            anims = SexLab.GetCreatureAnimationsByRacekeyTags(2, RaceKey, tags, "", True)
            ; messagebox(PetREF.getRace())
        endif
        if animName != "None"
            anim[0] = SexLab.GetCreatureAnimationByName(animName) 
        endif
        sslBaseAnimation[] anim_backup = SexLab.GetCreatureAnimationsByRaceKey(2, RaceKey)
        int tid = SexLab.StartSex(actors, anim_backup, Hook="petSex")
        ThreadController = sexlab.threadslots.getcontroller(tid)
        MiscUtil.PrintConsole("[Lost Pets] Got TID for SL scene: " + tid)
        return tid
    endif
    MiscUtil.PrintConsole("[Lost Pets] Got TID for SL scene: " + Thread.tid)
    return Thread.tid
EndFunction


; Not really one NPC. Can accept up to 4 additional actors. None of them required.
Function humanSexPlayer1NPC(Actor Human = None,\
                            Actor Human2 = None,\
                            Actor Human3 = None,\
                            Actor Human4 = None,\
                            bool playerGoesFirst = False,\
                            String animName = "None",\
                            String tags = "None",\
                            String tagsExcluded = "",\
                            String sceneName = "None",\
                            Bool isShowSubtitle = False,\
                            Bool isUndressingDisabled = False,\
                            String actionOnEnd = "")
    if isShowSubtitle && sceneName != "None"
        subtitlesG = True
        sceneNameG = sceneName
    else
        subtitlesG = False
    endif
    if actionOnEnd
        actionOnEndG = actionOnEnd
    else
        actionOnEndG = None
    endif
    currentNPC = Human
    sslThreadModel Thread = SexLab.NewThread()
    Thread.SetHook("humanSexNPC")
    RegisterForModEvent("HookAnimationEnd_humanSexNPC", "DoActionOnEnd")
    if playerGoesFirst ;  Holy Jesus, what is that? What the fuck is that?
        Thread.AddActor(PlayerRef)
        if Human
            Thread.AddActor(Human)
        endif
        if Human2
            Thread.AddActor(Human2)
        endif
        if Human3
            Thread.AddActor(Human3)
        endif
        if Human4
            Thread.AddActor(Human4)
        endif
    else
        if Human
            Thread.AddActor(Human)
        endif
        if Human2
            Thread.AddActor(Human2)
        endif
        if Human3
            Thread.AddActor(Human3)
        endif
        if Human4
            Thread.AddActor(Human4)
        endif
        Thread.AddActor(PlayerRef)
    endif

    PlayerREF.RemoveFromFaction(SexLabAnimatingFaction)
    Human.RemoveFromFaction(SexLabAnimatingFaction)
    sslBaseAnimation[] anim = new sslBaseAnimation[1]
    sslBaseAnimation[] anims
    if tags != "None"
        anims = SexLab.GetAnimationsByTags(2, tags, tagsExcluded, True)
    endif
    if animName != "None"
        anim[0] = SexLab.GetAnimationByName(animName) 
    endif
    if isUndressingDisabled == true
        Thread.SetNoStripping(PlayerRef)
        Thread.SetNoStripping(Human)
   endif
   if anim[0]
        Thread.SetAnimations(anim)
    endif
    if anims
        Thread.SetAnimations(anims)
    endif
    Thread.StartThread()
    If (sceneOffset && sceneOffset.Length == 6)
        Notification("Offset presented")
        Thread.CenterOnCoords(sceneOffset[0], sceneOffset[1], sceneOffset[2],\
                                sceneOffset[3], sceneOffset[4], sceneOffset[5])
    endif
    ThreadController = sexlab.threadslots.getcontroller(Thread.tid)
EndFunction


Event DoActionOnEnd(int tid, bool hasplayer)
    if endingSceneNameG
        (lope_SSH as lope_ShowSubtitlesHandler\
        ).ShowSubtitlesNonSexlab(sceneName=endingSceneNameG,\
                        stageId=0,\
                        partner=currentPet,\
                        human=currentNPC)
    endif
    clearBedOffset()
    If (!actionOnEndG)
        return
    EndIf
    String[] actionOnEnd = PapyrusUtil.StringSplit(actionOnEndG)
    ; MessageBox(actionOnEnd)
    if actionOnEnd[0] == "setstage"
        (GetFormFromEditorID(actionOnEnd[1]) as Quest).SetStage(actionOnEnd[2] as Int)
    elseif actionOnEnd[0] == "playscene"
        (GetFormFromEditorID(actionOnEnd[1]) as Scene).Start()
    elseif actionOnEnd[0] == "setcondition"
        Conditions.setVariableAt(actionOnEnd[1], actionOnEnd[2] as Int)
    endif
endevent


int Function getSexlabStage()
    return ThreadController.Stage
EndFunction


Event petSexStarted(int tid, bool hasplayer)
    ; currentStage = 0
    currentStage = ThreadController.Stage - 1
    ThreadController.UpdateTimer(120)
    ; ThreadController.GoToStage(3)
    ; utility.wait(20)
    ; ThreadController.endanimation()
    ; ThreadController.AdvanceStage()
endevent


; Event petsSexStarted(int tid, bool hasplayer)
;     currentStage = 0
;     ThreadController.UpdateTimer(120)
; endevent


; Advances Sexlab stage to next one.
function nextStageSexlab()
    ; Notification("nextStageSexlab()")
    ; currentStage += 1
    currentStage = ThreadController.Stage - 1
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
                        stageId=ThreadController.Stage - 1,\                        
                        partner=currentPet,\
                        human=currentNPC)
    endif
    ThreadController.UpdateTimer(120)
    ; MessageBox("ThreadController.Stage: "+ThreadController.Stage)
endevent


; Event petsSexStageStart(int tid, bool hasplayer)
;     ; messagebox("currentStage - "+currentStage)
;     if scenesArray
;         scenesArray[currentStage].start()
;     endif
;     if subtitlesG
;         ; subt.showString(sceneId=currentStage, partner=currentPet)
;         (lope_SSH as lope_ShowSubtitlesHandler\
;         ).ShowSubtitles(sceneName=sceneNameG,\
;                         stageId=currentStage,\
;                         partner=currentPet)
;     endif
;     ThreadController.UpdateTimer(120)
; endevent


; Event petSexStageEnd(int tid, bool hasplayer)
;     ; currentStage += 1
;     ;
; endevent


; Event petsSexStageEnd(int tid, bool hasplayer)
;     MessageBox(currentStage)
;     ; currentStage += 1
;     ;
; endevent


Event petSexEnding(int tid, bool hasplayer)
    ; MessageBox("sl scene ending")
    (lope_SSH as lope_ShowSubtitlesHandler).ForceEndSubtitles()
endevent

Event petSexEnded(int tid, bool hasplayer)
    ; MOVED TO DOACTIONSONEND
    ; start final scene    
    ; if endingSceneNameG
    ;     (lope_SSH as lope_ShowSubtitlesHandler\
    ;     ).ShowSubtitlesNonSexlab(sceneName=endingSceneNameG,\
    ;                     stageId=0,\
    ;                     partner=currentPet,\
    ;                     human=currentNPC)
    ; endif
    ; clearBedOffset()
endevent


; Event petsSexEnded(int tid, bool hasplayer)
;     ; start final scene
; endevent


Event PetOrgasms(int tid, bool hasplayer)
    ; messagebox("")
    ;
endevent


; Event PetsOrgasms(int tid, bool hasplayer)
;     ;messagebox("pet cumming")
;     ;
; endevent


; Increase relationshiprank of Human (Player if None) with Partner after mating.
function IncreaseRelationship(Actor Partner, Actor Human = None)
    if !Human
        Human = PlayerREF
    endif
    int relations = Partner.GetRelationshipRank(Human)
    if relations < 4
        Partner.SetRelationshipRank(Human, relations + 1)
        Notification("Relationships with " + Partner.GetActorBase().GetName()+" increased")
    endif
endfunction


Function clearBedOffset()
    sceneBed = None
    sceneOffset = None
EndFunction


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

ObjectReference Property sceneBed = None Auto
float[] Property sceneOffset = None Auto

lope_conditionsContainer Property Conditions Auto
