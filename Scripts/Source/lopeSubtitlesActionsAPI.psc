Scriptname lopeSubtitlesActionsAPI extends Quest  

import debug

import JsonUtil
import PO3_SKSEFunctions


bool increaseRelationships
bool playSexlabScene
bool playSexlabSceneMultipleActors
bool playSexlabSceneNoPlayer
bool spawnHostiles
bool specialOffsets
bool evaluatePackage
int isSetCameraTarget
int questStage
int itemAliasToRemove
int deadBodyAlias
int needPrivacy
int setPlayerHeadTrack
int playerAIControlled
int setExpression
int setPCDialogueAllowed
form questForm
form playerIdle
form npcIdle
form modForm
form sceneToPlay
float rotationAngle
quest actingQuest
string filename = "../lostpets/actions.json"
string questEditorID
string setSpecificTarget
string setPackageOverride
string removePackageOverride
; string placeMarkerOn
string moveMarkerTo
string setFacingTarget
string clearFacingTarget
string setActorFaction
string undressRefAlias
string redressRefAlias
string sceneToPlayByEditorID
Actor npcActor

ObjectReference Property PlayerRef  Auto
lope_ShowSubtitlesHandler Property lope_SSH Auto
lope_sl Property sl Auto
lope_functions Property func Auto
lope_storageContainer Property storage Auto
lope_privateAreaFramework Property privateAreaFramework Auto
sslActorLibrary Property ActorLib Auto
lope_strippingUtility Property stripUtil Auto

Event OnUpdate()
    if playerIdle
        (PlayerRef as Actor).PlayIdle(playerIdle as idle)
    endif
    if npcIdle
        npcActor.playIdle(npcIdle as Idle)
    endif
EndEvent


; Heavy as your mom 😂.
function doActions(string jsonPath, int topicLength, actor Partner = None, actor human = None)

    playerAIControlled = GetPathIntValue(filename, jsonPath+".playerAIControlled[0]", -1)
    if playerAIControlled != -1
        func.setPlayerReadyForAIScene(playerAIControlled as bool)
    endif

    questForm = GetPathFormValue(filename, jsonPath+".quest[0]", None)
    ; messagebox(questForm)
    if questForm != None
        actingQuest = questForm as Quest
    endif

    questEditorID = GetPathStringValue(filename, jsonPath+".questEditorID[0]", "None")
    ; messagebox(questEditorID)
    if questEditorID != "None"
        questForm = GetFormFromEditorID(questEditorID)
        actingQuest = questForm as Quest
    endif

    evaluatePackage = GetPathBoolValue(filename, jsonPath+".evaluatePackage[0]", False)
    if evaluatePackage
        String[] actorAliases = jsonUtil.PathStringElements(filename, jsonPath+".evaluatePackage[1]")
        int index = 0
        While (index < actorAliases.Length)
            func.getActorFromQuestRefAliasByName(questForm, GetPathStringValue(filename, jsonPath+".evaluatePackage[1]")).EvaluatePackage()
            index += 1
        EndWhile
        ; Actor target = func.getActorFromQuestRefAliasByName(questForm, GetPathStringValue(filename, jsonPath+".evaluatePackage[1]"))
        ; target.EvaluatePackage()
        ; MessageBox(target)
    endif
    
    questStage = GetPathIntValue(filename, jsonPath+".questStage[0]", -1)
    ; messagebox(questStage)
    if questStage != -1
        ; MessageBox(actingQuest + " | " + questStage)
        actingQuest.setStage(questStage)
    endif

    playerIdle = GetPathFormValue(filename, jsonPath+".playerIdle[0]", None)
    ; messagebox(playerIdle + jsonPath+".playerIdle")
    if playerIdle != None
        Game.ForceThirdPerson()
        if GetPathBoolValue(filename, jsonPath+".playerIdle[1]", False)
            ; Utility.Wait(topicLength)
            RegisterForSingleUpdate(topicLength)
        else
            (PlayerRef as actor).playIdle(playerIdle as Idle)
        endif
    endif

    npcIdle = GetPathFormValue(filename, jsonPath+".npcIdle[0]", None)
    if npcIdle != None
        npcActor = func.getActorFromQuestRefAliasByName(\
            questForm, GetPathStringValue(\
                filename, jsonPath+".npcIdle[1]", None))
        if GetPathBoolValue(filename, jsonPath+".npcIdle[2]", False)
            ; Utility.Wait(topicLength)
            RegisterForSingleUpdate(topicLength)
        else
            npcActor.playIdle(npcIdle as Idle)
        endif
    endif

    ;/placeMarkerOn = GetPathStringValue(filename, jsonPath+".placeMarkerOn[0]")
    If (placeMarkerOn)
        ObjectReference marker = func.placeMarkerNearActor(\
            func.getActorFromQuestRefAliasByName(questForm, placeMarkerOn))
        string aliasName = GetPathStringValue(filename, jsonPath+".placeMarkerOn[1]")
        if aliasName
            func.getQuestRefAliasByName(questForm, aliasName).ForceRefTo(marker)
        endif
    EndIf/;

    moveMarkerTo = GetPathStringValue(filename, jsonPath+".moveMarkerTo[0]")
    If (moveMarkerTo)
        func.moveMarkerRefAliasToActor(\
            func.getActorFromQuestRefAliasByName(questForm, moveMarkerTo),\
                func.getQuestRefAliasByName(questForm,\
                    GetPathStringValue(filename, jsonPath+".moveMarkerTo[1]")),\
                func.getQuestRefAliasByName(questForm,\
                    GetPathStringValue(filename, jsonPath+".moveMarkerTo[2]")),\
                    -80, 80)
    EndIf

    setFacingTarget = GetPathStringValue(filename, jsonPath+".setFacingTarget[0]", "")
    ; fixit
    If (setFacingTarget != "")
        ; MessageBox(func.getActorFromQuestRefAliasByName(questForm, setFacingTarget))
        ; MessageBox(func.getQuestRefAliasByName(questForm,\
        ;     GetPathStringValue(filename, jsonPath+".setFacingTarget[1]")).GetRef())
        string targetString =  GetPathStringValue(filename, jsonPath+".setFacingTarget[1]")
        ObjectReference target
        if targetString == "Player"
            target = PlayerRef
        else
            target = func.getQuestRefAliasByName(questForm, targetString).GetRef()
        endif
        func.getActorFromQuestRefAliasByName(questForm, setFacingTarget).SetLookAt(\
            target, true)
    EndIf

    clearFacingTarget = GetPathStringValue(filename, jsonPath+".clearFacingTarget[0]")
    If (clearFacingTarget)
        func.getActorFromQuestRefAliasByName(questForm, clearFacingTarget).ClearLookAt()
    EndIf

    rotationAngle = GetPathIntValue(filename, jsonPath+".rotate[0]", -1)
    ; isSetCameraTarget = GetPathIntValue(filename, jsonPath+".rotate[1]", 0)
    ; MessageBox(rotationAngle)
    if rotationAngle != -1
        ; PlayerRef.TranslateTo(\
        ;     PlayerRef.GetPositionX(),\
        ;     PlayerRef.GetPositionY(),\
        ;     PlayerRef.GetPositionZ()+400.0,\
        ;     0, 0, playerref.getanglex()+180.0, 0.0, 180.0)
        PlayerRef.SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), PlayerRef.GetAngleZ() - rotationAngle)
    endif

    setSpecificTarget = GetPathStringValue(filename, jsonPath+".setSpecificFurnitureTarget[0]", None)
    if setSpecificTarget
        ((questForm as Quest).GetAliasByName("TargetFurniture") as ReferenceAlias).ForceRefTo(\
        ((questForm as Quest).GetAliasByName(setSpecificTarget) as ReferenceAlias).getRef())
    endif

    setPackageOverride = GetPathStringValue(filename, jsonPath+".addAliasPackageOverride[0]", None)
    if setPackageOverride
        Actor targetActor = func.getActorFromQuestRefAliasByName(questForm, setPackageOverride)
        ; MessageBox(func.getPackageFromEditorID(\
        ;    GetPathStringValue(filename, jsonPath+".addAliasPackageOverride[1]", None)))
        ActorUtil.AddPackageOverride(\
            targetActor,\
            func.getPackageFromEditorID(\
                GetPathStringValue(filename, jsonPath+".addAliasPackageOverride[1]", None)), 65, 1)
        targetActor.EvaluatePackage()
        ; MessageBox(targetActor)
    endif

    removePackageOverride = GetPathStringValue(filename, jsonPath+".removeAliasPackageOverride[0]", None)
    if removePackageOverride
        Actor targetActor = func.getActorFromQuestRefAliasByName(questForm, setPackageOverride)
        ActorUtil.RemovePackageOverride(\
            targetActor,\
            func.getPackageFromEditorID(\
                GetPathStringValue(filename, jsonPath+".removeAliasPackageOverride[1]", None)))
        targetActor.EvaluatePackage()
    endif

    sceneToPlay = GetPathFormValue(filename, jsonPath+".scene[0]", None)
    if sceneToPlay != None
        ; messagebox(GetFormEditorID(sceneToPlay))
        lope_SSH.CurrentScene = (sceneToPlay as Scene)
        (sceneToPlay as Scene).start()
    endif

    sceneToPlayByEditorID = GetPathStringValue(filename, jsonPath+".sceneEditorID[0]","")
    If (sceneToPlayByEditorID)
        sceneToPlay = GetFormFromEditorID(sceneToPlayByEditorID)
        lope_SSH.CurrentScene = (sceneToPlay as Scene)
        (sceneToPlay as Scene).start()
    EndIf

    specialOffsets = GetPathBoolValue(filename, jsonPath+".sexlabSpecialOffset[0]", False)
    if specialOffsets
        ; string furnType = GetPathStringValue(filename, jsonPath+".sexlabSpecialOffset[0]", "False")
        string furnAliasName = GetPathStringValue(filename, jsonPath+".sexlabSpecialOffset[1]", -1)
        string furnType = GetPathStringValue(filename, jsonPath+".sexlabSpecialOffset[2]", "None")
        ObjectReference furn = (\
            (questForm as Quest).GetAliasByName(furnAliasName) as ReferenceAlias).GetRef()
        ; sl.sceneOffset = func.getOffsetArray(furn, furnAliasName)
        if furnType == "None"
            sl.sceneOffset = func.getOffsetArray(furn, furnAliasName)
        else
            sl.sceneOffset = func.getOffsetArray(furn, furnType)
        endif
    endif

    ; fuck
    playSexlabScene = GetPathBoolValue(filename, jsonPath+".sexlabScene[0]", False)
    if playSexlabScene
        String[] animNamesFromJson = PathStringElements(filename, jsonPath+".sexlabScene[1]")
        String animName = func.chooseString(\
            PathStringElements(filename, jsonPath+".sexlabScene[1]"))
        String tags = GetPathStringValue(filename, jsonPath+".sexlabScene[2]")
        String sceneName = GetPathStringValue(filename, jsonPath+".sexlabScene[3]")
        Bool isShowSubtitle = GetPathBoolValue(filename, jsonPath+".sexlabScene[4]")
        Bool isUndressingDisabled = GetPathBoolValue(filename, jsonPath+".sexlabScene[5]")
        String endingSceneName = GetPathStringValue(filename, jsonPath+".sexlabScene[6]")
        sl.petSex(PetREF=Partner,\
                animName=animName,\
                tags=tags,\
                sceneName=sceneName,\
                isShowSubtitle=isShowSubtitle,\
                isUndressingDisabled=isUndressingDisabled,\
                endingSceneName=endingSceneName\
                )
    endif

    ; the
    playSexlabSceneMultipleActors = GetPathBoolValue(filename, jsonPath+".sexlabSceneMultipleActors[0]", False)
    if playSexlabSceneMultipleActors
        Actor[] Partners = func.GetActorsArrayFromQuestRefAliasIDs(questForm,\
            PathIntElements(filename, jsonPath+".sexlabSceneMultipleActors[1]"))
        String[] animNamesFromJson = PathStringElements(filename, jsonPath+".sexlabSceneMultipleActors[2]")
        String animName = func.chooseString(\
            PathStringElements(filename, jsonPath+".sexlabSceneMultipleActors[2]"))
        String tags = GetPathStringValue(filename, jsonPath+".sexlabSceneMultipleActors[3]")
        String sceneName = GetPathStringValue(filename, jsonPath+".sexlabSceneMultipleActors[4]")
        Bool isShowSubtitle = GetPathBoolValue(filename, jsonPath+".sexlabSceneMultipleActors[5]")
        Bool isUndressingDisabled = GetPathBoolValue(filename, jsonPath+".sexlabSceneMultipleActors[6]")
        String endingSceneName = GetPathStringValue(filename, jsonPath+".sexlabSceneMultipleActors[7]")
        ; MessageBox("human="+human+" | partner="+partner)
        sl.petsSex(PetsREF=Partners,\
                human=human,\
                animName=animName,\
                tags=tags,\
                sceneName=sceneName,\
                isShowSubtitle=isShowSubtitle,\
                isUndressingDisabled=isUndressingDisabled,\
                endingSceneName=endingSceneName\
                )
    endif

    ; DRY
    playSexlabSceneNoPlayer = GetPathBoolValue(filename, jsonPath+".sexlabSceneNoPlayer[0]", False)
    if playSexlabSceneNoPlayer
        String[] animNamesFromJson = PathStringElements(filename, jsonPath+".sexlabSceneNoPlayer[1]")
        String animName = func.chooseString(\
            PathStringElements(filename, jsonPath+".sexlabSceneNoPlayer[1]"))
        String tags = GetPathStringValue(filename, jsonPath+".sexlabSceneNoPlayer[2]")
        String sceneName = GetPathStringValue(filename, jsonPath+".sexlabSceneNoPlayer[3]")
        Bool isShowSubtitle = GetPathBoolValue(filename, jsonPath+".sexlabSceneNoPlayer[4]")
        Bool isUndressingDisabled = GetPathBoolValue(filename, jsonPath+".sexlabSceneNoPlayer[5]")
        String endingSceneName = GetPathStringValue(filename, jsonPath+".sexlabSceneNoPlayer[6]")
        sl.petSexNPC(PetREF=Partner,\
            human=human,\
            animName=animName,\
            tags=tags,\
            sceneName=sceneName,\
            isShowSubtitle=isShowSubtitle,\
            isUndressingDisabled=isUndressingDisabled,\
            endingSceneName=endingSceneName\
        )
    endif

    increaseRelationships = GetPathBoolValue(filename, jsonPath+".increaseRelationships[0]", False)
    ; MessageBox(jsonPath+".increaseRelationships[0] "+increaseRelationships)
    if increaseRelationships
        sl.IncreaseRelationship(Partner, Human)
    endif

    spawnHostiles = GetPathBoolValue(filename, jsonPath+".spawnHostiles[0]", False)
    if spawnHostiles
        func.setHostilesCountPetRel(Partner)
        lope_SSH.hostilesPresented = True
        ObjectReference hostile
        int aliasId = GetPathIntValue(filename, jsonPath+".spawnHostiles[1]", 21)
        int index = 0
        While (index < storage.HostilesCount)
            hostile = PlayerRef.PlaceAtMe(\
                ((questForm as quest).GetAliasById(aliasId) as ReferenceAlias).GetActorRef().GetActorBase())
            func.MoveActorToRandomPosBehind(hostile as Actor, PlayerRef as Actor, 256.0, 512.0)
            index += 1
        EndWhile
    endif

    itemAliasToRemove = GetPathIntValue(filename, jsonPath+".removeItem[0]", -1)
    If (itemAliasToRemove != -1)
        ; ((questForm as Quest).GetAliasById(itemAliasToRemove) as ReferenceAlias).GetRef()
        PlayerRef.RemoveItem(\
            ((questForm as Quest).GetAliasById(itemAliasToRemove) as ReferenceAlias).GetRef().GetBaseObject())
    EndIf

    deadBodyAlias = GetPathIntValue(filename, jsonPath+".placeDeadBody[0]", -1)
    If deadBodyAlias != -1
        Actor prey = Partner.PlaceActorAtMe(\
            ((questForm as Quest).GetAliasById(deadBodyAlias) as ReferenceAlias).GetActorRef().GetActorBase())
        prey.Kill()
    EndIf

    needPrivacy = GetPathIntValue(filename, jsonPath+".needPrivacy[0]", -1)
    If (needPrivacy != -1)
        If (needPrivacy == 1)
            ; string centerPrivacy = GetPathStringValue(filename, jsonPath+".needPrivacy[1]", "")
            ; if centerPrivacy
            ;     func.getQuestRefAliasByName(questForm,"CenterPrivacy").ForceRefTo(\
            ;         func.getQuestRefAliasByName(questForm, centerPrivacy).GetRef())
            ; endif
            string centerPrivacy = GetPathStringValue(filename, jsonPath+".needPrivacy[1]", "")
            privateAreaFramework.startPollingForIntruders(\
                 func.getQuestRefAliasByName(questForm, centerPrivacy).GetRef())
        ElseIf (needPrivacy == 0)
            privateAreaFramework.polling = False
        EndIf
    EndIf

    setPlayerHeadTrack = GetPathIntValue(filename, jsonPath+".playerHeadtrack[0]", -1)
    if setPlayerHeadTrack != -1
        If (setPlayerHeadTrack == 1)
            PlayerRef.SetAnimationVariableInt("IsNPC", 1)
            String whoLookOn = GetPathStringValue(filename, jsonPath+".playerHeadtrack[1]", "")
            If (whoLookOn != "")
                (PlayerREF as Actor).SetLookAt(func.getQuestRefAliasByName(questForm, whoLookOn).GetRef())
            EndIf
        elseif (setPlayerHeadTrack == 0)
            PlayerRef.SetAnimationVariableInt("IsNPC", 0)
            (PlayerREF as Actor).ClearLookAt()
        EndIf        
    endif

    setExpression = GetPathIntValue(filename, jsonPath+".setExpression[0]", -1)
    If (setExpression != -1)
        func.setPlayerExpression(\
            setExpression,\
            GetPathIntValue(filename, jsonPath+".setExpression[1]", 7),\
            GetPathIntValue(filename, jsonPath+".setExpression[2]", 0)\
        )
    EndIf

    setPCDialogueAllowed = GetPathIntValue(filename, jsonPath+".setPCDialogueAllowed[0]", -1)
    if setPCDialogueAllowed != -1
        func.setPCDialogueAllowed(\
            setPCDialogueAllowed as Bool, questForm,\
            PathStringElements(filename, jsonPath+".setPCDialogueAllowed[1]"))
    endif

    setActorFaction = GetPathStringValue(filename, jsonPath+".setActorFaction[0]", None)
    If (setActorFaction)
        Actor varActor = func.getActorFromQuestRefAliasByName(questForm, setActorFaction)
        Faction varFaction = GetFormFromEditorID(\
            GetPathStringValue(filename, jsonPath+".setActorFaction[1]", None)) as Faction
        if GetPathIntValue(filename, jsonPath+".setActorFaction[2]") == 1
            varActor.AddToFaction(varFaction)
            int varRank = GetPathIntValue(filename, jsonPath+".setActorFaction[3]", -2)
            if varRank > -2
                varActor.SetFactionRank(varFaction, varRank)
            endif
        else
            varActor.RemoveFromFaction(varFaction)
        endif
    EndIf

    undressRefAlias = GetPathStringValue(filename, jsonPath+".undressRefAlias[0]", "")
    if undressRefAlias
        ; storage.strippedArmor = ActorLib.StripActor(func.getActorFromQuestRefAliasByName(questForm, undressRefAlias),\
        ;     DoAnimate=False)
        ; MessageBox(func.getActorFromQuestRefAliasByName(questForm, undressRefAlias))
        stripUtil.strip_actor(func.getActorFromQuestRefAliasByName(questForm, undressRefAlias), True)
    endif

    redressRefAlias = GetPathStringValue(filename, jsonPath+".redressRefAlias[0]", "")
    if redressRefAlias
        ; MessageBox(storage.strippedArmor)
        ; ActorLib.UnstripActor(func.getActorFromQuestRefAliasByName(questForm, redressRefAlias),\
        ;     storage.strippedArmor)
        ; storage.strippedArmor = None
        stripUtil.unstrip_actor(func.getActorFromQuestRefAliasByName(questForm, redressRefAlias))
    endif
endfunction
