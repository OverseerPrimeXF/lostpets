Scriptname lope_SE_Haafingar3_playerWatch extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if akOldLoc == BrylingHouse && self.getOwningQuest().getStage() == 500
        self.getOwningQuest().stop()
    endIf
EndEvent

Location Property BrylingHouse  Auto  
