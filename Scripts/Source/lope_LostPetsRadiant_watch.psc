Scriptname lope_LostPetsRadiant_watch extends ReferenceAlias  
{For final scene ending on location change.}


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if (self.getOwningQuest().getStage() == 300)
        MiscUtil.printConsole("[Lost Pets] Player left location of scene, stopping scene.")
        finalScene.stop()
    endIf
endEvent


Scene Property finalScene Auto