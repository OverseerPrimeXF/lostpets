Scriptname lope_DogArenaStart_PlayerWatch extends ReferenceAlias  


Event OnSit(ObjectReference akFurniture)
    If (akFurniture == BarStool)
      ; Debug.MessageBox("Player sat down.")
      (PO3_SKSEFunctions.GetFormFromEditorID("lope_DogArena_Start_barStoolSitting") as Scene).Start()
    EndIf
endEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    If (getOwningQuest().getStage() == 70) && akNewLoc.HasKeyword(LocTypeCity)
        
    EndIf
    If Courier.GetReference().IsEnabled() && (getOwningQuest().getStage() == 80)
        ; Debug.MessageBox("Courier moved!")
        Courier.getReference().moveto(CourierMarker)
        Courier.getReference().disable()
    EndIf
endEvent


Scene Property writingScene Auto
ReferenceAlias Property Courier Auto
Keyword Property LocTypeCity Auto
ObjectReference Property CourierMarker Auto
ObjectReference Property BarStool  Auto  
