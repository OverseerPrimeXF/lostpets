Scriptname lope_mariaEvents_playerWatch extends ReferenceAlias   
{This handles location change for proper event startup}


Import Debug
Import Utility
Import MiscUtil

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    ; PrintConsole("[LoPe] OnLocationChange generally triggered!")
    ; If owningQuest.GetStage() != 10
    If !lope_functions.isStageInList(owningQuest, stages)
        ; PrintConsole("[LoPe] quest stage is not 10, 210, return.")
        return
    EndIf
    if owningQuest.getStage() == 10
        If !leftOnce && akNewLoc != restLocation.GetLocation()
            ; PrintConsole("[LoPe] Player left rest loc first time.")
            leftOnce = True
            gameTimePlayerLeftRestLoc = GetCurrentGameTime()
        EndIf
        If akNewLoc == restLocation.GetLocation()
            If (isRequiredTimePassed())
                ; MessageBox("Billy fucking drunk Maria!")
                lope_SSH.ShowSubtitlesNonSexlab(\
                    "mariaEvents_"+mariaProgression.totalEventsCount, 0,\
                    Billy.GetActorRef(), Maria.GetActorRef())
                owningQuest.SetObjectiveDisplayed(20)
                owningQuest.SetActive(True)
                owningQuest.setStage(20)
            Else
                leftOnce = False
                gameTimePlayerLeftRestLoc = 0
            EndIf       
        elseif owningQuest.GetStage() == 210
            (owningQuest as lope_mariaEvents_states).houseChoise
        EndIf
    EndIf

endevent


bool function isRequiredTimePassed()
    return (GetCurrentGameTime() - gameTimePlayerLeftRestLoc) * 24 >= neededTimeToPass
endfunction


; temporals
bool leftOnce = False
float gameTimePlayerLeftRestLoc

; links
Quest Property owningQuest Auto
LocationAlias Property restLocation Auto
ReferenceAlias Property Maria Auto
ReferenceAlias Property Billy Auto
lope_ShowSubtitlesHandler Property lope_SSH Auto
lope_MariaProgression Property mariaProgression Auto

; constants
int[] Property stages Auto  ; Yes, this is constant (10, 210) filled in creation kit
float Property neededTimeToPass = 1.0 AutoReadOnly Hidden