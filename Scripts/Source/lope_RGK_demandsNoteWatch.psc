Scriptname lope_RGK_demandsNoteWatch extends ReferenceAlias  


Event OnUpdateGameTime()
    ; Debug.MessageBox(self + "OnUpdateGameTime")
    self.GetOwningQuest().setStage(stage)
EndEvent


Function registerProgression(float timeInDays = 1.0, int receivedStage = 800)
    stage = receivedStage
    RegisterForSingleUpdateGameTime(timeInDays * 24)
    Debug.MessageBox(self + " registered for " + timeInDays + " days with stage of " + stage)
EndFunction


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if self.GetOwningQuest().GetStage() >= 600 && akNewContainer == Game.GetPlayer()
        ; debug.Notification("Don't take note back")
        akOldContainer.addItem(self.GetReference())
    endIf
endEvent


int Property stage Auto