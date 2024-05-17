Scriptname lope_POS_playerWatch extends ReferenceAlias
{Checks if location is right and scarts scene with owner/pet}

import debug


; Event OnLocationChange(Location akOldLoc, Location akNewLoc)
;     debug.messagebox(akNewLoc+" "+akNewLoc.getName())
; EndEvent


Event OnCellLoad()
    ; Debug.Trace("Every object in this cell has loaded its 3d")
    Location playersLocation = self.getRef().GetCurrentLocation()
    if playersLocation.HasKeyword(LocTypeHouse) || \
       playersLocation.HasKeyword(LocTypeInn)   || \
       playersLocation.HasKeyword(LocTypeGuild) || \
       playersLocation.HasKeyword(LocTypeTemple) || \
       playersLocation.HasKeyword(LocTypeStore)
        CurrentLocation.ForceLocationTo(playersLocation)
        ; MessageBox(CurrentLocation.GetLocation())
    Else
        CurrentLocation.Clear()
    endif
    if CurrentLocation.GetLocation()
        aliasUtility.SetStage(0)
        Utility.Wait(1)
        if utilityPet.getRef() && utilityOwner.getRef()
            Pet.ForceRefTo(utilityPet.getRef())
            Owner.ForceRefTo(utilityOwner.getRef())
            ; MessageBox(Pet.GetActorRef().GetDisplayName()+" "+Owner.GetActorRef().GetDisplayName())
            OwnersBed.ForceRefTo(func.FindReferencesOfTypeInCellWithOwner(\
                Owner.GetRef(), Storage.sexlabBedsList()))
            ; MessageBox(utilityChair.GetRef())
            chair.ForceRefTo(utilityChair.GetRef())
            string sceneName = "DogApproachOwnerFacRank1"
            lope_SSH.showSubtitlesNonSexlab(sceneName, 0, Pet.getActorRef(), Owner.GetActorRef())
        endif
        aliasUtility.stop()
        ; self.GetOwningQuest().SetObjectiveDisplayed(100) ;  debug
    endif
endEvent


Keyword Property LocTypeHouse  Auto  
Keyword Property LocTypeInn  Auto  
Keyword Property LocTypeGuild  Auto  
Keyword Property LocTypeStore  Auto  
Keyword Property LocTypeTemple  Auto

LocationAlias Property CurrentLocation Auto

Quest Property aliasUtility  Auto  
lope_functions Property func Auto
lope_storageContainer Property Storage Auto
lope_ShowSubtitlesHandler Property lope_SSH Auto

ReferenceAlias Property utilityPet  Auto  
ReferenceAlias Property utilityOwner  Auto  
ReferenceAlias Property utilityChair  Auto  

ReferenceAlias Property Pet  Auto  
ReferenceAlias Property Owner  Auto  
ReferenceAlias Property OwnersBed Auto
ReferenceAlias Property Chair  Auto
