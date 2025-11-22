Scriptname lope_DogArena_arenaUpdater extends ReferenceAlias  
{Script for making arena visitors come to and leave from arena}


; Int VISITORS_COUNT = 8
String FILE_NAME = "../lostpets/dog_arena_visitors_schedule.json"


Function Initializer()
    ; visitorsOnArena = PapyrusUtil.IntArray(4)
EndFunction


Event OnInit()
    Initializer()
endEvent


Function update()
    ; Empty update function, stop activities on arena
    return
EndFunction


Event onUpdateGameTime()
    update()    
EndEvent


State Running

    ; State on script for running updates on Arena (id player in CragslaneCavernLocation)
    Event OnBeginState()
        UpdateCurrentTime(isStateInit=True)
    EndEvent

    Function update()
        UpdateCurrentTime()
        CheckFightJustEnded()
        UpdateVisitors()
        TryToStartRadiantFight()
        RegisterForNextCheck()
    EndFunction

EndState


String Function GetVisitorName(Int visitorsID)
    ; Visitor ID starts from 1
    If (visitorsID < 10)
        return ("Visitor0" + visitorsID)
    EndIf
    return ("Visitor" + visitorsID)
EndFunction


ReferenceAlias Function GetVisitorByID(Int visitorsID)
    return GetOwningQuest().GetAliasByName(GetVisitorName(visitorsID)) as ReferenceAlias
EndFunction


ReferenceAlias Function GetVisitorByName(String visitorsName)
    return GetOwningQuest().GetAliasByName(visitorsName) as ReferenceAlias
EndFunction


ReferenceAlias Function GetVisitorsPetByName(String visitorsName)
    return GetOwningQuest().GetAliasByName(visitorsName + "Pet") as ReferenceAlias
EndFunction


Int[] Function GetVisitorIDsFromFile(Int week_day, Int day_hour, String direction)
    ; int[] visitors = JsonUtil.PathIntElements(\
    ;     FILE_NAME, ".week_day_" + week_day + ".hour_" + day_hour + "." + direction)
    ; Debug.MessageBox(".week_day_" + week_day + ".hour_" + day_hour + "." + direction + ": " + visitors)
    return JsonUtil.PathIntElements(\
        FILE_NAME, ".week_day_" + week_day + ".hour_" + day_hour + "." + direction)
EndFunction


Function SetVisitorsPetEnabledAndMoveToOwner(String name, ReferenceAlias owner, bool enabled = True)
    ReferenceAlias pet = GetVisitorsPetByName(name)
    If (!pet)
        return
    EndIf
    if enabled
        pet.TryToEnable()
        pet.TryToMoveTo(owner.GetReference())
    else
        ; Is not necessary here
        pet.TryToMoveTo(owner.GetReference())
        pet.TryToDisable()
    endIf
EndFunction


Function SetFactionForOwnerAndPet(ReferenceAlias Visitor, Bool left = False)
    ReferenceAlias pet = GetVisitorsPetByName(visitor.GetName())
    if left
        visitor.TryToAddToFaction(lope_DogArenaLeftVisitor)
        pet.TryToAddToFaction(lope_DogArenaLeftVisitor)
        Debug.MessageBox(visitor.GetName() + " and " + pet.GetName() + " are concidered as left")
    else
        visitor.TryToRemoveFromFaction(lope_DogArenaLeftVisitor)
        pet.TryToRemoveFromFaction(lope_DogArenaLeftVisitor)
        Debug.MessageBox(visitor.GetName() + " and " + pet.GetName() + " are concidered as came")
    endif
EndFunction


Function UpdateVisitors()
    visitorsCameIDs = GetVisitorIDsFromFile(currentDayOfWeek, currentTimeInMinutes / 60, "came")
    
    if visitorsCameIDs
        ; Debug.MessageBox(visitorsCameIDs)
        visitorsOnArena = PapyrusUtil.MergeIntArray(visitorsOnArena, visitorsCameIDs, true)
        int index = 0
        While (index < visitorsCameIDs.Length)
            visitorName = GetVisitorName(visitorsCameIDs[index])
            If (visitorsConditions.getInt(visitorName) == 0)
                MiscUtil.PrintConsole("[Lost Pets] DogArena: processing visitor: " + visitorName + " came to arena.")
                ; Move npc only once, why the heck Papyrus has no 'continue' in loop?
                visitor = GetVisitorByName(visitorName)
                visitor.TryToEnable()
                ; visitor.TryToAddToFaction(lope_DogArenaLeftVisitor)
                SetFactionForOwnerAndPet(visitor)
                visitor.TryToMoveTo(markerOutsideArena.GetReference())
                visitorsConditions.setInt(visitorName, 1)
                SetVisitorsPetEnabledAndMoveToOwner(visitorName, visitor)
            EndIf
            index += 1
        EndWhile
    endIf

    if !radiantFightRunning && !radiantFightJustEnded
        visitorsLeftIDs = GetVisitorIDsFromFile(currentDayOfWeek, currentTimeInMinutes / 60, "left")
    ElseIf !radiantFightRunning && radiantFightJustEnded
        visitorsLeftIDs = visitorsLeftIDs  ; do nothing with visitors left array
    else
        visitorsLeftIDs = papyrusUtil.MergeIntArray(\
            visitorsLeftIDs, GetVisitorIDsFromFile(currentDayOfWeek, currentTimeInMinutes / 60, "left"), True)
    endif

    if visitorsLeftIDs
        If (!radiantFightRunning)
            visitorsOnArena = lope_nativeFunctions.excludeElementsInt(visitorsOnArena, visitorsLeftIDs)
            ; Debug.MessageBox(visitorsLeftIDs)
            int index = 0
            While (index < visitorsLeftIDs.Length)
                visitorName = GetVisitorName(visitorsLeftIDs[index])
                If (visitorsConditions.getInt(visitorName) == 1)
                    MiscUtil.PrintConsole("[Lost Pets] DogArena: processing visitor: " + visitorName + " has left arena.")
                    visitor = GetVisitorByName(visitorName)
                    ; visitor.TryToRemoveFromFaction(lope_DogArenaLeftVisitor)                    
                    SetFactionForOwnerAndPet(visitor, True)
                    visitorsConditions.setInt(visitorName, 0)
                EndIf
                index += 1
            EndWhile
        else
            ; do stuff
        EndIf
    endIf
    ; Debug.MessageBox(visitorsOnArena)
EndFunction


; Checks if all visitors are on arena (near arena center).
; Returns False if at least one visitor is not on arena.
bool Function IsAllVisitorsOnArena()
    If (visitorsOnArena.Length < 1)
        return False
    EndIf
    int index = 0
    Float distance
    While (index < visitorsOnArena.Length)
        distance = GetVisitorByID(visitorsOnArena[index]).GetReference().GetDistance(self.GetReference())
        MiscUtil.PrintConsole("visitor id: " + visitorsOnArena[index] + " " + distance + " units from arena center.")
        If !(distance < 1536 && distance > 1)
            return False
        EndIf
        index += 1
    EndWhile
    return True
EndFunction


Function UpdateCurrentTime(Bool isStateInit = False)
    currentTimeInMinutes = func.GetCurrentTimeInMinutesGV()
    currentDayOfWeek = func.GetDayOfWeek()
    ; if isStateInit || (0 <= CurrentTimeInMinutes && CurrentTimeInMinutes < 60)  ; why the hell papyrus cannot 0 < var < 60?
    ;     ; Check at start of new day
    ;     currentDayOfWeek = func.GetDayOfWeek()
    ; endif
EndFunction


Quest Function GetRadiantFightQuest()
    return PO3_SKSEFunctions.GetFormFromEditorID("lope_DogArena_fightRadiant") as Quest
EndFunction


Bool Function TryToStartRadiantFight()
    Quest radiantFight = GetRadiantFightQuest()
    If (radiantFight.IsRunning())
        return False  ; fight already running, return False
    EndIf
    If (radiantFightJustEnded)
        return False  ; wait bit more for next fight, return False
    EndIf
    If (!IsAllVisitorsOnArena())
        return False  ; visitors are not avaliable, return False
    EndIf
    radiantFight.SetStage(0)
    return True
EndFunction


; returns True if running, False if is not running
bool Function GetRadiantFightRunning()
    ; Bool isRFRunning = (PO3_SKSEFunctions.GetFormFromEditorID("lope_DogArena_fightRadiant") as Quest).IsRunning()
    ; Debug.Notification("lope_DogArena_fightRadiant running: " + isRFRunning)
    return GetRadiantFightQuest().IsRunning()
EndFunction


Bool Function CheckFightJustEnded()
    ; bool newFightState = GetRadiantFightRunning()
    radiantFightRunning = GetRadiantFightRunning()
    radiantFightJustEnded = (previousFightState != radiantFightRunning)
    previousFightState = radiantFightRunning
    return radiantFightJustEnded
EndFunction


Function StopRadiantFight()
    Quest RadiantFight = GetRadiantFightQuest()
    If (RadiantFight.IsRunning())
        RadiantFight.Stop()
    EndIf
    If (sexAfterFightTID > -1)
        sslThreadController tc = sexlab.threadslots.getcontroller(sexAfterFightTID)
        ; debug.MessageBox(tc)
        If (tc)
            tc.EndAnimation()
        EndIf
    EndIf
    sexAfterFightTID = -1
EndFunction


Function SetScriptRunning(bool isScriptRunning = True)
    ; Debug.MessageBox("SetScriptRunning " + isScriptRunning)
    MiscUtil.PrintConsole("[Lost Pets] DogArena: SetScriptRunning - " + isScriptRunning as String)
    if isScriptRunning
        ; Debug.MessageBox("DogArenaUpdater running")
        GotoState("Running")
        RegisterForSingleUpdateGameTime(0.167)
    else
        ; Debug.MessageBox("DogArenaUpdater stopped")
        GotoState("")
        UnregisterForUpdateGameTime()
        StopRadiantFight()        
    endif
EndFunction


Function RegisterForNextCheck()
    If (getState() == "Running")        
        RegisterForSingleUpdateGameTime(0.167)
    EndIf
EndFunction


Function debug()
    debug.MessageBox("visitorsCameIDs "+visitorsCameIDs +"\nvisitorsLeftIDs "+ visitorsLeftIDs+"\nvisitorsOnArena "+visitorsOnArena)
EndFunction


Bool radiantFightRunning
Bool previousFightState = False
Bool radiantFightJustEnded

int currentTimeInMinutes = 0
int currentDayOfWeek = 0

Int[] visitorsCameIDs
Int[] visitorsLeftIDs
int[] Property visitorsOnArena Auto

ReferenceAlias visitor

Int Property sexAfterFightTID Auto

SexLabFramework Property SexLab Auto

ReferenceAlias Property markerOutsideArena Auto

String visitorName

Faction Property lope_DogArenaLeftVisitor Auto

lope_functions Property func Auto

lope_DogArena_VisitorsConditions Property visitorsConditions Auto
