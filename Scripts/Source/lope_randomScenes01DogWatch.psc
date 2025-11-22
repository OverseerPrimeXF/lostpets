Scriptname lope_randomScenes01DogWatch extends ReferenceAlias  


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Debug.MessageBox("dog left location!")
    if (self.getOwningQuest().getStage() == 50)
        self.getOwningQuest().setStage(100)
    endIf
endEvent
