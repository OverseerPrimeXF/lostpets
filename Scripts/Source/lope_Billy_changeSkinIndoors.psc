Scriptname lope_Billy_changeSkinIndoors extends ReferenceAlias  


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    ; debug.messageBox(Billy.GetActorBase().GetName()+"'s location changed!")
    if (self.GetRef().IsInInterior())
        Billy.SetRace(huskyNaked)
    else
        if billy.GetActorBase().getrace() != huskyArmored
            Billy.SetRace(huskyArmored)
        endif
    endIf
endEvent


Actor Property Billy Auto

Race Property huskyNaked  Auto  

Race Property huskyArmored  Auto  
