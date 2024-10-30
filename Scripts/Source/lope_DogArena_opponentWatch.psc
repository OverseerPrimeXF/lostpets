Scriptname lope_DogArena_opponentWatch extends ReferenceAlias  

import Debug

import PO3_SKSEFunctions


Bool aboutToFight = False
Bool Property fighting = False Auto


Event OnInit()
    Utility.Wait(0.2)
    If (!self.GetReference())
        return
    EndIf
    ; Debug.MessageBox("wolf inited")
    If (self.GetActorReference().GetRace() == GetFormFromEditorID("DogCompanionRace") as Race)
        if RegisterForAnimationEvent(self.GetRef(), "NPCDogAggroWarning")
            debug.Trace("[LoPe] opponent registered for: NPCDogAggroWarning")
        else
            debug.Trace("[LoPe] unable registered for: NPCDogAggroWarning")
        endif
    EndIf
    if RegisterForAnimationEvent(self.GetRef(), "IdleStop")
        debug.Trace("[LoPe] opponent registered for: IdleStop")
    else
        debug.Trace("[LoPe] unable registered for:  idlestop")
    endif
    ; if RegisterForAnimationEvent(self.GetRef(), "weaponDraw")
    ;     MessageBox("weapon draw wolf")
    ; endif
    unregisterForPreFightWarn()  ; temporarly disabled
EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    ; Debug.MessageBox(asEventName)
    if (akSource == self.GetReference()) && (asEventName == "NPCDogAggroWarning")
        aboutToFight = True
        ; self.GetActorReference().DrawWeapon()
    elseif (akSource == self.GetReference()) && (asEventName == "IdleStop") && (aboutToFight && !fighting)
        Utility.Wait(0.3)

        self.GetActorReference().PlayIdle(GetFormFromEditorID("DogIdleWarn") as Idle)
    endIf
endEvent


Function unregisterForPreFightWarn()
    If (self.GetActorReference().GetRace() == GetFormFromEditorID("DogCompanionRace") as Race)
        UnregisterForAnimationEvent(self.GetReference(), "NPCDogAggroWarning")
    endif
EndFunction


ReferenceAlias Function getRefAli(String refAliasName)
    return (self.GetOwningQuest().GetAliasByName(refAliasName) as ReferenceAlias)
EndFunction


Event OnEnterBleedout()
    self.GetActorRef().PlayIdle(GetFormFromEditorID("DogKnockdown") as Idle)
    getRefAli("Loser").ForceRefTo(self.GetReference())
    getRefAli("Loser").GetActorRef().StopCombat()
    If getRefAli("Opponent1").GetReference() == self.GetReference()
        getRefAli("Winner").ForceRefTo(getRefAli("Opponent2").GetReference())
        getRefAli("WinnersMaster").ForceRefTo(getRefAli("Master2").GetReference())
        getRefAli("LosersMaster").ForceRefTo(getRefAli("Master1").GetReference())
    else
        getRefAli("Winner").ForceRefTo(getRefAli("Opponent1").GetReference())
        getRefAli("WinnersMaster").ForceRefTo(getRefAli("Master1").GetReference())
        getRefAli("LosersMaster").ForceRefTo(getRefAli("Master2").GetReference())
    EndIf
    GetOwningQuest().SetStage(100)
    utility.Wait(3)
    getRefAli("Loser").GetActorRef().PlayIdle(GetFormFromEditorID("DogIdleStop") as Idle)
    Utility.Wait(1)
    ; utility.Wait(2)
    getRefAli("Loser").GetActorRef().Resurrect()
    getRefAli("Loser").GetActorRef().StopCombat()
endEvent
