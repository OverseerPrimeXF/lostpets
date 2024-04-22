Scriptname lopeSubtitlesActionsAPI extends Quest  

import JsonUtil
import debug

int isSetCameraTarget
int questStage
form questForm
form playerIdle
form modForm
float rotationAngle
string filename = "../lostpets/actions.json"

ObjectReference Property PlayerRef  Auto


function doActions(string jsonPath, quest actingQuest = None)
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
        (PlayerRef as actor).playIdle(playerIdle as Idle)
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

endfunction  
