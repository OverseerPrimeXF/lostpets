Scriptname lope_POS_playerWatch extends ReferenceAlias
{Checks if location is right and starts scene with owner/pet.
POS stands for PetsOwnersScenes, not what you thought.}

import debug


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    ; Debug.Trace("Every object in this cell has loaded its 3d")
    if func.getMinimalPetRelationshipForCurrentHold() < 2
      ; return
    endif
    Location playersLocation = self.getRef().GetCurrentLocation()
    if playersLocation.HasKeyword(LocTypeHouse)  || \
       playersLocation.HasKeyword(LocTypeInn)    || \
       playersLocation.HasKeyword(LocTypeGuild)  || \
       playersLocation.HasKeyword(LocTypeTemple) || \
       playersLocation.HasKeyword(LocTypeCastle) || \
       playersLocation.HasKeyword(LocTypeStore)
        CurrentLocation.ForceLocationTo(playersLocation)
        ; MessageBox(CurrentLocation.GetLocation())
    Else
        MessageBox(self.GetOwningQuest())
        if self.GetOwningQuest().getstage() == 10
            self.GetOwningQuest().setstage(102)
        endif
        lope_SSH.questInitator = None
        CurrentLocation.Clear()
    endif
    if CurrentLocation.GetLocation()
        aliasUtility.SetStage(0)
        Utility.Wait(1)
        if utilityPet.getRef() && utilityOwner.getRef()
            Pet.ForceRefTo(utilityPet.getRef())
            Owner.ForceRefTo(utilityOwner.getRef())
            ; MessageBox(Pet.GetActorRef().GetDisplayName()+" "+Owner.GetActorRef().GetDisplayName())
            OwnersBed.ForceRefTo(lope_nativeFunctions.FindReferencesOfTypeInCellWithOwner(\
                Owner.GetRef(), Storage.sexlabBedsList(), 0))
            ; MessageBox(utilityChair.GetRef())
            chair.ForceRefTo(utilityChair.GetRef())
            string sceneName = "DogApproachOwner"
            lope_SSH.questInitator = self.GetOwningQuest()
            lope_SSH.showSubtitlesNonSexlab(sceneName, 0, Pet.getActorRef(), Owner.GetActorRef())
            self.GetOwningQuest().setstage(10)
        endif
        aliasUtility.stop()
        ; self.GetOwningQuest().SetObjectiveDisplayed(100) ;  debug
    endif
EndEvent

;/ ; This shoite inappropriate for this.
Event OnCellLoad()
    ; Debug.Trace("Every object in this cell has loaded its 3d")
    Location playersLocation = self.getRef().GetCurrentLocation()
    if playersLocation.HasKeyword(LocTypeHouse)  || \
       playersLocation.HasKeyword(LocTypeInn)    || \
       playersLocation.HasKeyword(LocTypeGuild)  || \
       playersLocation.HasKeyword(LocTypeTemple) || \
       playersLocation.HasKeyword(LocTypeStore)
        CurrentLocation.ForceLocationTo(playersLocation)
MessageBox(CurrentLocation.GetLocation())
    Else
        MessageBox(self.GetOwningQuest())
        if self.GetOwningQuest().getstage() == 10
            self.GetOwningQuest().setstage(102)
        endif
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
            string sceneName = "DogApproachOwner"
            lope_SSH.questInitator = self.GetOwningQuest()
            lope_SSH.showSubtitlesNonSexlab(sceneName, 0, Pet.getActorRef(), Owner.GetActorRef())
            self.GetOwningQuest().setstage(10)
        endif
        aliasUtility.stop()
        ; self.GetOwningQuest().SetObjectiveDisplayed(100) ;  debug
    endif
endEvent
/;

Keyword Property LocTypeHouse  Auto  
Keyword Property LocTypeInn  Auto  
Keyword Property LocTypeGuild  Auto  
Keyword Property LocTypeStore  Auto  
Keyword Property LocTypeTemple  Auto
Keyword Property LocTypeCastle  Auto 

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
