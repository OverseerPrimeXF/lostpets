Scriptname lopeSubtitlesActionsAPI extends Quest  

import JsonUtil
import debug

bool increaseRelationships
bool playSexlabScene
bool playSexlabSceneMultipleActors
bool playSexlabSceneNoPlayer
bool spawnHostiles
bool specialOffsets
int isSetCameraTarget
int questStage
int itemAliasToRemove
int deadBodyAlias
form questForm
form playerIdle
form modForm
form sceneToPlay
float rotationAngle
quest actingQuest
string filename = "../lostpets/actions.json"


ObjectReference Property PlayerRef  Auto
lope_ShowSubtitlesHandler Property lope_SSH Auto
lope_sl Property sl Auto
lope_functions Property func Auto
lope_storageContainer Property storage Auto

Event OnUpdate()
    if playerIdle
        (PlayerRef as Actor).PlayIdle(playerIdle as idle)
    endif
EndEvent


function doActions(string jsonPath, int topicLength, actor Partner = None, actor human = None)
    questForm = GetPathFormValue(filename, jsonPath+".quest[0]", None)
    ; messagebox(questForm)
    if questForm != None
        actingQuest = questForm as Quest
    endif
    
    questStage = GetPathIntValue(filename, jsonPath+".questStage[0]", -1)
    ; messagebox(questStage)
    if questStage != -1
        actingQuest.setStage(questStage)
    endif

    playerIdle = GetPathFormValue(filename, jsonPath+".playerIdle[0]", None)
    ; messagebox(playerIdle + jsonPath+".playerIdle")
    if playerIdle != None
        if GetPathBoolValue(filename, jsonPath+".playerIdle[1]", False)
            ; Utility.Wait(topicLength)
            RegisterForSingleUpdate(topicLength)
        else
            (PlayerRef as actor).playIdle(playerIdle as Idle)
        endif
    endif

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

    sceneToPlay = GetPathFormValue(filename, jsonPath+".scene[0]", None)
    ; messagebox(playerIdle + jsonPath+".playerIdle")
    if sceneToPlay != None
        lope_SSH.CurrentScene = (sceneToPlay as Scene)
        (sceneToPlay as Scene).start()
    endif

    specialOffsets = GetPathBoolValue(filename, jsonPath+".sexlabSpecialOffset[0]", False)
    if specialOffsets
        ; string furnType = GetPathStringValue(filename, jsonPath+".sexlabSpecialOffset[0]", "False")
        string furnAliasName = GetPathStringValue(filename, jsonPath+".sexlabSpecialOffset[1]", -1)
        ObjectReference furn = (\
            (questForm as Quest).GetAliasByName(furnAliasName) as ReferenceAlias).GetRef()
        if furnAliasName == "OwnersBed"
            sl.sceneBed = furn
        elseif furnAliasName == "Chair"
            sl.sceneOffset = func.getOffsetArray(furn, furnAliasName)
        endif
    endif

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
        sl.petsSex(PetsREF=Partners,\
                animName=animName,\
                tags=tags,\
                sceneName=sceneName,\
                isShowSubtitle=isShowSubtitle,\
                isUndressingDisabled=isUndressingDisabled,\
                endingSceneName=endingSceneName\
                )
    endif

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
        sl.IncreaseRelationship(Partner)
    endif

    spawnHostiles = GetPathBoolValue(filename, jsonPath+".spawnHostiles[0]", False)
    if spawnHostiles
        func.setHostilesCountPetRel(Partner)
        lope_SSH.hostilesPresented = True
        ObjectReference hostile
        int aliasId = GetPathIntValue(filename, jsonPath+".spawnHostiles[1]", 21)
        ; MessageBox(aliasId+" "+questForm+" "+((questForm as quest).GetAliasById(aliasId) as ReferenceAlias).GetRef())
        int index = 0
        ; MessageBox(storage.HostilesCount)
        While (index < storage.HostilesCount)
            hostile = PlayerRef.PlaceAtMe(\
                ((questForm as quest).GetAliasById(aliasId) as ReferenceAlias).GetActorRef().GetActorBase())
            ; MessageBox(hostile)
            func.MoveActorToRandomPosBehind(hostile as Actor, PlayerRef as Actor, 256.0, 512.0)
            index += 1
        EndWhile
    endif

    itemAliasToRemove = GetPathIntValue(filename, jsonPath+".removeItem[0]", -1)
    If (itemAliasToRemove != -1)
        ; ((questForm as Quest).GetAliasById(itemAliasToRemove) as ReferenceAlias).GetRef()
        PlayerRef.RemoveItem(\
            ((questForm as Quest).GetAliasById(itemAliasToRemove) as ReferenceAlias).GetRef())
    EndIf

    deadBodyAlias = GetPathIntValue(filename, jsonPath+".placeDeadBody[0]", -1)
    If deadBodyAlias != -1
        Actor prey = Partner.PlaceActorAtMe(\
            ((questForm as Quest).GetAliasById(deadBodyAlias) as ReferenceAlias).GetActorRef().GetActorBase())
        prey.Kill()
    EndIf

endfunction
