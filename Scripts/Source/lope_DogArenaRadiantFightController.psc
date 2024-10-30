Scriptname lope_DogArenaRadiantFightController extends Quest  


Event OnUpdate()
    If (GetStage() != 5)
        return
    EndIf
    If (checkIfBothOpponentsOnArena())
        setStage(10)
    EndIf
endEvent


bool Function checkIfBothOpponentsOnArena()
    If (Opponent01.GetReference().GetDistance(arenaCenter) <= 120\
        && Opponent02.GetReference().GetDistance(arenaCenter) <= 120)
        return True
    else
        RegisterForSingleUpdate(1)
        return False
    EndIf
EndFunction


Function registerForCheck()
    RegisterForSingleUpdate(1)
EndFunction


Function SetSourceQuestByName(String source)
    sourceQuest = PO3_SKSEFunctions.GetFormFromEditorID(source) as Quest
EndFunction


Function SetSourceQuestByQuest(Quest source)
    sourceQuest = source
EndFunction


Function SetAliasAtSourceQuest(String refAliasNameAtSource, ReferenceAlias refAliasLocal)
    ; Quest source = PO3_SKSEFunctions.GetFormFromEditorID(sourceQuest) as Quest
    (sourceQuest.GetAliasByName(refAliasNameAtSource) as ReferenceAlias).ForceRefTo(refAliasLocal.GetReference())
EndFunction


Function SetStageOfSourceQuest(int stage)
    sourceQuest.SetStage(stage)
EndFunction


Function PlayScene(Scene scn)
    ; SetStage(2)
    ; Debug.MessageBox("this quest: " + po3_sksefunctions.GetFormEditorID(self))
    ; Debug.MessageBox(IsRunning() + "playing scene" + scn)
    scn.Start()
EndFunction


ObjectReference Property arenaCenter  Auto  

ReferenceAlias Property Opponent01  Auto  

ReferenceAlias Property Opponent02  Auto  

Quest sourceQuest  
