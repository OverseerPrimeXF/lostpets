Scriptname lope_AsterDialogues_PlayerWatch extends ReferenceAlias  


; Event OnLocationChange(Location akOldLoc, Location akNewLoc)
;     if akNewLoc == Midden
;         RegisterForSingleLOSGain(Aster, self.GetReference())
;     elseif akOldLoc == Midden && akNewLoc != Midden
;         UnregisterForLOS(Aster, self.GetReference())
;     endif
; endEvent


Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
    if akViewer == Aster && akTarget == self.getReference()
        RegisterForSingleLOSLost(Aster, self.GetReference())
        Debug.notification("Aster got LOS to you")
        ; AsterWatch.registerForPlayerDetectedCheck()
        ; If (func.isCurrentGameTimeLessThan(4, 0))
        ;     return
        ; EndIf
        ; If (PO3_skseFunctions.GetFormFromEditorID("lope_AsterDialogues_AsterPetIntimacy01") as Scene).IsPlaying()
        ;     return
        ; EndIf
        ; If (Self.GetActorReference().IsDetectedBy(Aster) || self.GetReference().GetDistance(Aster) <= 384)
        ;     Aster.Say(PO3_skseFunctions.GetFormFromEditorID("lope_AsterDialogues_AsterNoticedPlayerTopic") as Topic)
        ; else
        ;     Aster.Say(PO3_skseFunctions.GetFormFromEditorID("lope_AsterDialogues_AsterNoticedPlayerNotDetectedTopic") as Topic)
        ; EndIf
    endif
endEvent


Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
    if akViewer == Aster && akTarget == self.getReference()
        RegisterForSingleLOSGain(Aster, self.GetReference())
        Debug.notification("Aster lost LOS to you")
        ; AsterWatch.unregisterForPlayerDetectedCheck()
        ; If (!func.isCurrentGameTimeLessThan(4, 0))
        ;     return
        ; EndIf
        ; If (PO3_skseFunctions.GetFormFromEditorID("lope_AsterDialogues_AsterPetIntimacy01") as Scene).IsPlaying()
        ;     return
        ; EndIf
        ; If (!Self.GetActorReference().IsDetectedBy(Aster)\
        ;     || self.GetReference().GetDistance(Aster) >= 384)
        ;     Aster.Say(PO3_skseFunctions.GetFormFromEditorID("lope_AsterDialogues_AsterStopSeePlayerTopic") as Topic)
        ; EndIf
    endif
endEvent


Actor Property Aster  Auto  

Location Property Midden  Auto  

lope_AsterWatch Property AsterWatch  Auto  

lope_functions Property func  Auto  
