Scriptname lope_DogArena_PlayerWatch extends ReferenceAlias  


Import PO3_SKSEFunctions


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    ; Debug.MessageBox("Player's old location: " + GetformEditorID(akOldLoc) + "\n Player's new location: " + GetformEditorID(akNewLoc))
    if (akNewLoc == CragslaneCavernLocation)
        MiscUtil.PrintConsole("[Lost Pets] Player changed location: new location is CragslaneCavernLocation")
        arenaUpdater.SetScriptRunning()
    endIf
    if (akOldLoc == CragslaneCavernLocation)
        MiscUtil.PrintConsole("[Lost Pets] Player left location: new location is " + akNewLoc)
        arenaUpdater.SetScriptRunning(False)
    endIf
endEvent


Actor Property PlayerREF Auto

Location Property CragslaneCavernLocation Auto

lope_DogArena_arenaUpdater Property arenaUpdater Auto
