Scriptname lope_mariaWatch extends ReferenceAlias  
{ This is mandatory fundamental activity. }

event OnUpdateGameTime()
    If (conditions.playerTookMariasTankard == 1 && !Game.GetPlayer().IsInCombat())
        (PO3_SKSEFunctions.GetFormFromEditorID("lope_MariaMeeting_tankard") as Scene).Start()
        ; debug.messagebox("OnGameTimeUpdate")
    EndIf
endevent


Function registerForTankardRetrieve()
    RegisterForSingleUpdateGameTime(0.5)
EndFunction


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if akBaseItem == MariasTankard
        self.GetRef().GetItemCount(MariasTankard) == 0
        if akDestContainer == Game.GetPlayer()
            ; conditions.playerKeepingTankard = 1
            conditions.playerTookMariasTankard = 1
            conditions.timesMariasTankardTaken += 1
            (PO3_SKSEFunctions.GetFormFromEditorID("lope_MariaMeeting_tankard") as Scene).Start()
            self.GetActorRef().EvaluatePackage()
        endIf
        return
    endif
endEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if akBaseItem == MariasTankard
        self.GetRef().GetItemCount(MariasTankard) >= 1
        if akSourceContainer == Game.GetPlayer()
            conditions.playerKeepingTankard = 0
            conditions.playerTookMariasTankard = 0
            (PO3_SKSEFunctions.GetFormFromEditorID("lope_MariaMeeting_tankardBack") as Scene).Start()
            self.GetActorRef().EvaluatePackage()
        endIf
        return
    endif
endEvent


lope_mariaConditions Property conditions  Auto  
MiscObject Property MariasTankard  Auto  
