Scriptname lope_MeekosMasterBury extends ObjectReference  


Event OnActivate(ObjectReference akActionRef)
    ; Utility.WaitMenuMode(0.1)
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "ContainerMenu")
    debug.MessageBox("You buried Meeko's dead master")
    Grave.Enable()
    self.Disable()
    MeekoQuest.SetObjectiveCompleted(55)
    MeekoQuest.SetStage(60)
EndEvent


ObjectReference Property Grave  Auto  
Quest Property MeekoQuest  Auto  
