Scriptname lope_RGK_playerWatch extends ReferenceAlias  


; Event OnPlayerLoadGame()
;     RegisterForKey(42)
; endEvent


; Event OnKeyDown(Int KeyCode)
; 	If KeyCode == 42
; 		debug.MessageBox(self.GetReference().GetCurrentLocation() + " | " + self.GetReference().GetCurrentLocation().GetName())
; 	EndIf
; EndEvent


Event OnSit(ObjectReference akFurniture)
    If (akFurniture == WritingChair.GetReference() && self.GetOwningQuest().GetStage() == 510)
        game.DisablePlayerControls(abMovement=True, abCamSwitch=True)
        game.ForceThirdPerson()
        Utility.Wait(3)
        debug.SendAnimationEvent(game.GetPlayer(), "IdleChairWrite")
        Utility.Wait(4)
        ObjectReference note = game.getPlayer().placeAtMe(blackmail)
        DemandsNote.forceRefTo(note )
        game.GetPlayer().AddItem(note)
        self.GetOwningQuest().SetStage(520)
        game.EnablePlayerControls()
    EndIf
endEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    ; if !akDestContainer
    ;   Debug.Trace("I dropped " + aiItemCount + "x " + akBaseItem + " into the world")
    ; elseif akDestContainer == Game.GetPlayer()
    ;   Debug.Trace("I gave the player " + aiItemCount + "x " + akBaseItem)
    ; else
    ;   Debug.Trace("I gave " + aiItemCount + "x " + akBaseItem + " to another container")
    ; endIf
    ; finish it
    ; Debug.MessageBox("akDestContainer: "+akDestContainer)
    If (akBaseItem != blackmail)
        return
    EndIf
    If (self.GetOwningQuest().getStage() >= 600)
        return
    EndIf
    If (akDestContainer && !akDestContainer.IsInLocation(Markarth))
        game.GetPlayer().AddItem(akItemReference)
        Debug.Notification("You need to leave this note in " + Markarth.GetName())
        return
    ElseIf (!akDestContainer && !self.GetReference().IsInLocation(UnderstoneKeep) && self.GetReference().GetItemCount(akBaseItem) == 0)
        game.GetPlayer().AddItem(akItemReference)
        Debug.Notification("Note need to be dropped at least in " + UnderstoneKeep.GetName())
        return
    ElseIf (akItemReference==DemandsNote.GetReference() && \
        akDestContainer.HasKeyword(ActorTypeNPC) && \
        akDestContainer.IsInLocation(Markarth))
        self.GetOwningQuest().setStage(600)
        Debug.MessageBox("You placed note in " + (akDestContainer as actor).GetActorBase().GetName() + "'s pocket")
        controller.daysToWait = 5
        ; (DemandsNote as lope_RGK_demandsNoteWatch).registerProgression(5, 700)
        akItemReference.Disable()
    ElseIf (!akDestContainer && self.GetReference().IsInLocation(UnderstoneKeep))
        self.GetOwningQuest().setStage(600)
        Debug.MessageBox("You dropped note in " + UnderstoneKeep.GetName())
        akItemReference.BlockActivation(true)
        controller.daysToWait = 7
        ; (DemandsNote as lope_RGK_demandsNoteWatch).registerProgression(7, 700)
    else
        game.GetPlayer().AddItem(akItemReference)
        Debug.Notification("Not the best place to place this note")
    EndIf
endEvent


LocationAlias Property Hideout  Auto  
Location Property Markarth Auto
Location Property UnderstoneKeep Auto
Book Property blackmail Auto

Keyword Property ActorTypeNPC Auto

ReferenceAlias Property WritingChair  Auto  

ReferenceAlias Property DemandsNote  Auto  

lope_RGK_demandsNoteWatch Property demandWatch Auto

lope_RGK_controller Property controller Auto