Scriptname lope_DogArena_visitorWatch extends ReferenceAlias  
{Script for tracking visitor at Cragslane Cavern, watches if visitor left arena.}


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    ; Debug.MessageBox(self.GetName() + " | " + visitorsConditions.getInt(self.GetName()) == 0)
    If (akOldLoc == CragslaneCavernLocation && akNewLoc != CragslaneCavernLocation) && visitorsConditions.getInt(self.GetName()) == 0
        ; Debug.MessageBox("Visitor ref " + self.GetName() + " left cragslane")
        self.TryToMoveTo(UtilCellMarker)
        movePetToVisitorAndDisable()
        self.TryToDisable()
    EndIf
endEvent


Function movePetToVisitorAndDisable()
    ReferenceAlias pet = self.GetOwningQuest().GetAliasByName(self.GetName() + "Pet") as ReferenceAlias
    if pet
        pet.TryToMoveTo(self.GetReference())
        pet.TryToDisable()
    endif
EndFunction


Location Property CragslaneCavernLocation  Auto  

ReferenceAlias Property MarkerOutsideCavern  Auto  

ObjectReference Property UtilCellMarker  Auto  

lope_DogArena_VisitorsConditions Property visitorsConditions Auto
