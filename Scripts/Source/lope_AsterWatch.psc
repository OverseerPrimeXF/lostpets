Scriptname lope_AsterWatch extends ReferenceAlias  

Import PO3_SKSEFunctions


Event OnInit()
    registerForAnimEvents()
endEvent


Event OnPlayerLoadGame()
    registerForAnimEvents()
endEvent


Event OnUpdate()
    isAsterTurnedManyPages()
    ResetConjuredState()
    CheckIfPlayerDetectedByAster()
endEvent


Event OnUpdateGameTime()
    checkIfTimeForMiddenScene()
endEvent


Function checkIfTimeForMiddenScene()
    if self.getReference().GetCurrentLocation() != (GetFormFromEditorID("WinterholdCollegeMiddenLocation") as Location) || self.GetOwningQuest().GetStage() == 0
        return
    endIf
    currentTimeInMinutes = func.GetCurrentTimeInMinutes()
    ; debug.notification("Current game time in minutes: " + currentTimeInMinutes)
    If (currentTimeInMinutes >= 240 && currentTimeInMinutes < 1200)  ; (func.CompareGameTimeWith(4, 0) >= 0)
        Scene AsterScene = GetFormFromEditorID("lope_AsterDialogues_AsterPetIntimacy01") as Scene
        ; debug.MessageBox("time for aster scene")
        If (!AsterScene.IsPlaying())
            ; debug.MessageBox("familial will  aster scene started")
            AsterScene.Start()
        EndIf
        return
    else
        ; Check every 0.12 hour
        RegisterForSingleUpdateGameTime(0.12)
    endIf
EndFunction


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if (akNewLoc == (GetFormFromEditorID("WinterholdCollegeMiddenLocation") as Location))
        RegisterForSingleUpdateGameTime(0.12)        
    endIf
endEvent


Function registerForPagesTurnCount()
    if registeredForUpdatePagesTurn
        pagesTurned += 1
        return
    endif
    registeredForUpdatePagesTurn = True
    RegisterForSingleUpdate(3.0)
EndFunction


Function isAsterTurnedManyPages()
    If (!registeredForUpdatePagesTurn)
        return
    EndIf
    if pagesTurned >= 3
        AsterConditions.iAsterTurnedManyPages = 1
    else
        AsterConditions.iAsterTurnedManyPages = 0
    endif
    registeredForUpdatePagesTurn = False
EndFunction


function registerForAnimEvents()
    if !RegisterForAnimationEvent(self.getReference(), "IdleChairBook_OnePage")
        debug.notification("Failed to register for IdleChairBook_OnePage")
    endif
    if !RegisterForAnimationEvent(self.getReference(), "IdleFurnitureExit")
        debug.notification("Failed to register for Reset")
    endif
endfunction


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if (akSource == self.getReference())
        if (asEventName == "IdleChairBook_OnePage")
            registerForPagesTurnCount()
            AsterConditions.iAsterTurnedPage = 1
            AsterConditions.iAsterSitting = 1
            debug.MessageBox("Aster turned page")
        elseif (asEventName == "IdleFurnitureExit")
            AsterConditions.iAsterTurnedPage = 0
            AsterConditions.iAsterSitting = 0
            AsterConditions.iAsterTurnedManyPages = 0
        endIf
    endIf
endEvent


Function RegisterForSummonVanish(float time)
    registeredForUpdateConjure = True
    RegisterForSingleUpdate(time)
EndFunction


Function ResetConjuredState()
    if !registeredForUpdateConjure
       return
    endif
    AsterConditions.iAsterCastedSpell = -1
    registeredForUpdateConjure = False
EndFunction


Function registerForPlayerDetectedCheck()
    registeredForPlayerDetectionCheck = True
    RegisterForSingleUpdate(1)
EndFunction


Function unregisterForPlayerDetectedCheck()
    registeredForPlayerDetectionCheck = False
    AsterConditions.iAsterDetectedPlayer = 0
EndFunction


Function CheckIfPlayerDetectedByAster()
    if !registeredForPlayerDetectionCheck
        return
    endif
    If (AsterConditions.Player.IsDetectedBy(Self.GetActorReference()))
        AsterConditions.iAsterDetectedPlayer = 1
        debug.Notification("Aster detected Player")
        ; If (AsterConditions.iAsterDetectedSaidNoticeLine == 0)
        ;     self.GetActorRef().Say(PO3_skseFunctions.GetFormFromEditorID("lope_AsterDialogues_AsterNoticedPlayerTopic") as Topic)
        ;     AsterConditions.iAsterDetectedSaidNoticeLine = 1
        ; EndIf
    else
        AsterConditions.iAsterDetectedPlayer = 0
        debug.Notification("Aster not detected Player")
    EndIf
    RegisterForSingleUpdate(1)
EndFunction


Event OnSpellCast(Form akSpell)
    If (self.GetReference().GetCurrentLocation() != GetFormFromEditorID("WinterholdCollegeMiddenLocation") as Location)
        return
    EndIf
    if akSpell == GetFormFromEditorID("ConjureFamiliar")
        AsterConditions.iAsterCastedSpell = 1
    elseif akSpell == GetFormFromEditorID("ConjureFlameAtronach")
        AsterConditions.iAsterCastedSpell = 3
    endIf
    RegisterForSummonVanish((akSpell as Spell).GetNthEffectDuration(0))
endEvent


bool registeredForUpdatePagesTurn = False
bool registeredForUpdateConjure = False
bool registeredForPlayerDetectionCheck = False
Int pagesTurned = 0
int currentTimeInMinutes

lope_AsterConditions Property AsterConditions  Auto  
lope_conditionsContainer Property Conditions  Auto  
lope_functions Property func  Auto  
