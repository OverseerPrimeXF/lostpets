Scriptname lope_conditionsContainer extends Quest  Conditional

; For empty state
int baseNumber

; >>>"Global" conditions<<<

Int Property iBlockMariaFollowerDialogues = 0  Auto  Conditional

Int Property iBillyFollowMaria = 1  Auto  Conditional

Int Property iRadiantWolfAmbushCompletedCount = 0  Auto  Conditional

; -1 - was no check / default state
; 1 - NOT presented
Int Property iSubtitlesNotPresented = -1  Auto  Conditional

; >>>Player Choises<<<

; 0 - saw before
; 1 - never seen
; 2 - dog lover herself
Int Property iPlayersChoise = -1  Auto  Conditional

; 0 - not tryed
; 1 - tryed
Int Property iTryedAtEvent1 = -1  Auto  Conditional

Int Property iMariaReadBook = 0  Auto  Conditional

Int Property iMariaCanIdleChat = 1  Auto  Conditional

Int Property iMariaEventStage = 0  Auto  Conditional
Int Property iMariaEventStageToWrite = -1  Auto  Conditional

Function WriteMariaEventStage()
    iMariaEventStage = iMariaEventStageToWrite
    iMariaEventStageToWrite = -1
EndFunction

; 0 - player doesn't know/met
; 1 - player know/met
Int Property iPlayerKnowsAboutElara = 0 Auto  Conditional
Int Property iPlayerMetElara = 0 Auto  Conditional
Int Property iMariaMetElara = 0 Auto  Conditional
Int Property iMariaMetAster = 0 Auto  Conditional
Int Property iPlayerMetAster = 0 Auto  Conditional
Int Property iMariaMetSona = 0 Auto  Conditional
Int Property iPlayerMetSona = 0 Auto  Conditional

Int Property iAsterInSceneWithFamiliar = 0 Auto  Conditional
Int Property iAsterMatedWithFamiliar = 0 Auto  Conditional

Int Property iElaraAcceptedDogArena = 0 Auto  Conditional
Int Property iAsterAcceptedDogArena = 0 Auto  Conditional
Int Property iSonaAcceptedDogArena = 0 Auto  Conditional
Int Property iBarkeepHiredDogArena = 0 Auto  Conditional

; Wolf Ambush conditions

Int Property iTimesWolvesAmbushed = 0 Auto  Conditional

; Methods for getting/setting conditional variables by their names

function SetVariableInt(int aiValue)
    baseNumber = aiValue
endfunction


int function GetVariableInt()
    return baseNumber
endfunction


; gets variable by the state name.
; > PlayersChoise
; > TryedAtEvent1
; > AsterInSceneWithFamiliar
int Function getVariableAt(String stateName)
    GotoState(stateName)
    return getVariableInt()
EndFunction


; Sets variable by the state name. Avaliable:
; > PlayersChoise
; > TryedAtEvent1
; > AsterInSceneWithFamiliar
Function setVariableAt(String stateName, int var)
    GotoState(stateName)
    SetVariableInt(var)
EndFunction


State PlayersChoise
    function SetVariableInt(int aiValue)
        iPlayersChoise = aiValue
    endfunction

    int function GetVariableInt()
        return iPlayersChoise
    endfunction
EndState

State TryedAtEvent1
    function SetVariableInt(int aiValue)
        iTryedAtEvent1 = aiValue
    endfunction

    int function GetVariableInt()
        return iTryedAtEvent1
    endfunction
EndState

State AsterInSceneWithFamiliar
    function SetVariableInt(int aiValue)
        iAsterInSceneWithFamiliar = aiValue
        if iAsterInSceneWithFamiliar == 0
            func.BanishCustomFamiliar()
        endif
    endfunction

    int function GetVariableInt()
        return iAsterInSceneWithFamiliar
    endfunction
EndState

; ================================================
; Mods enabled: storage for conditions if found enabled mods.
; ================================================

int Property isFrostyEnabled  = -1 Auto  Conditional
int Property isBestialEssenceEnabled  = -1 Auto  Conditional


; Links

lope_AsterConditions Property AsterConditions Auto
lope_SonaConditions Property SonaConditions Auto
lope_functions Property func Auto