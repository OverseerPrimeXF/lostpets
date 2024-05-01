Scriptname lopeSubtitlesActionsAPI extends Quest  

import JsonUtil
import debug

bool increaseRelationships
bool playSexlabScene
int isSetCameraTarget
int questStage
form questForm
form playerIdle
form modForm
form sceneToPlay
float rotationAngle
string filename = "../lostpets/actions.json"
quest actingQuest

ObjectReference Property PlayerRef  Auto
lope_ShowSubtitlesHandler Property lope_SSH Auto
lope_sl Property sl Auto
lope_functions Property func Auto


Event OnUpdate()
    if playerIdle
        (PlayerRef as Actor).PlayIdle(playerIdle as idle)
    endif
EndEvent


function doActions(string jsonPath, int topicLength, actor Partner = None)
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
        PlayerRef.TranslateTo(\
            PlayerRef.GetPositionX(),\
            PlayerRef.GetPositionY(),\
            PlayerRef.GetPositionZ(),\
            0, 0, PlayerREF.GetAngleZ()+rotationAngle, 36.0, 72.0)
        PlayerRef.SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), PlayerRef.GetAngleZ() - rotationAngle)
    endif

    sceneToPlay = GetPathFormValue(filename, jsonPath+".scene[0]", None)
    ; messagebox(playerIdle + jsonPath+".playerIdle")
    if sceneToPlay != None
        lope_SSH.CurrentScene = (sceneToPlay as Scene)
        (sceneToPlay as Scene).start()
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

    increaseRelationships = GetPathBoolValue(filename, jsonPath+".increaseRelationships[0]", False)
    ; MessageBox(jsonPath+".increaseRelationships[0] "+increaseRelationships)
    if increaseRelationships
        sl.IncreaseRelationship(Partner)
    endif
endfunction  
