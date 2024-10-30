Scriptname lope_DogArenaStart_VeshleWatch extends ReferenceAlias  


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if (akNewLoc == PO3_skseFunctions.getFormFromEditorID("CragslaneCavernLocation") as Location)
        ; Debug.MessageBox(self.getActorRef().getActorBase().getName() + " entered Cragslane")
        CragslaneVeshleStuff.Enable()
        GetOwningQuest().SetStage(35)
    endIf
endEvent


ObjectReference Property CragslaneVeshleStuff Auto
