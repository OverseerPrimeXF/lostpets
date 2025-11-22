Scriptname lope_SE_Haafingar3_Door01Alias extends ReferenceAlias  


Event onActivate(ObjectReference akActionRef)
    If Bryling.isInLocation(House) && self.getReference().IsLocked()
        UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Lockpicking Menu")
        debug.messageBox("You knocked into the door, door unlocks.")
        self.getReference().Lock(False)
        If self.getowningQuest().getStage() == 5
            Bryling.moveTo(HouseCenter)
            Irnskar.tryToDisable()
            Falk.tryToDisable()
        EndIf
    EndIf
endEvent


Location Property house  Auto  

Actor Property Bryling  Auto  

ObjectReference Property HouseCenter  Auto  

ReferenceAlias Property Falk  Auto  

ReferenceAlias  Property Irnskar Auto  
