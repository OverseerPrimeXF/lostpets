Scriptname lope_DogArenaStart_ElaraWatch extends ReferenceAlias  


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if (akNewLoc == PO3_skseFunctions.getFormFromEditorID("CragslaneCavernLocation") as Location\
       && CragslaneOldStuff.IsEnabled())
        ; Debug.MessageBox(self.getActorRef().getActorBase().getName() + " entered Cragslane")
        CragslaneOldStuff.Disable()
        CragslaneNewStuff.Enable()
        DASConditions.ElaraMadeFirstPreparations = 1
        If (DASConditions.iNumberOfObjectivesDisplayed == 0)
            getOwningQuest().setStage(25)
        EndIf
        ; getOwningQuest().setStage(25)
    endIf
endEvent


ObjectReference Property CragslaneOldStuff Auto
ObjectReference Property CragslaneNewStuff Auto

lope_DogArenaStart_conditions Property DASConditions Auto
