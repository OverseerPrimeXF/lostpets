Scriptname lope_LostPetsStartupRoutine extends Quest  

import Debug
import Utility


Event OnInit()
    ; setPetsArrays()
    ; Trace("[LoPe] Set pets arrays.")
endevent


; Get minimal relationship rank with pet in same hold.
Int Function getMinimalRelationships()
    ; ObjectReference[] allPets = storage.PetsAll
    Int minRelatonship = 4
    Int petRelationship
    Int index = storage.PetsAll.Length - 1
    ObjectReference Pet
    Location playerLocation = PlayerRef.GetCurrentLocation()
    While (index >= 0)
        Pet = (storage.PetsAll[index]) as ObjectReference
        If (playerLocation.HasCommonParent(Pet.GetEditorLocation(), LocTypeHold))
            petRelationship = (Pet as actor).GetRelationshipRank(PlayerRef as Actor)
            if petRelationship < minRelatonship
                minRelatonship = petRelationship
            endif
        EndIf
        index -= 1
    EndWhile
    ; MessageBox(minRelatonship)
    return minRelatonship
EndFunction


; Populate pet<Hold> arrays in Storage with all pets in this holds.
Function setPetsArrays()
    int index = storage.PetsAll.Length - 1
    ObjectReference Pet
    While (index >= 0)
        Pet = (storage.PetsAll[index]) as ObjectReference
        If (Storage.EastmarchLoc().HasCommonParent(Pet.GetEditorLocation(), LocTypeHold))
            Storage.petsEastmarch = ResizeFormArray(\
                Storage.petsEastmarch, Storage.petsEastmarch.Length + 1)
            Storage.petsEastmarch[Storage.petsHaafingar.Length - 1] = Pet
        elseIf (Storage.FalkreathLoc().IsChild(Pet.GetCurrentLocation()))
            Storage.petsFalkreath = ResizeFormArray(\
                Storage.petsFalkreath, Storage.petsFalkreath.Length + 1)
            Storage.petsFalkreath[Storage.petsFalkreath.Length - 1] = Pet
        elseif (Storage.HaafingarLoc().IsChild(Pet.GetCurrentLocation()))
            Storage.petsHaafingar = ResizeFormArray(\
                Storage.petsHaafingar, Storage.petsHaafingar.Length + 1)
            Storage.petsHaafingar[Storage.petsHaafingar.Length - 1] = Pet
        elseIf (Storage.HjaalmarchLoc().IsChild(Pet.GetCurrentLocation()))
            Storage.petsHjaalmarch = ResizeFormArray(\
                Storage.petsHjaalmarch, Storage.petsHjaalmarch.Length + 1)
            Storage.petsHjaalmarch[Storage.petsHjaalmarch.Length - 1] = Pet
        elseIf (Storage.PaleLoc().IsChild(Pet.GetCurrentLocation()))
            Storage.petsPale = ResizeFormArray(\
                Storage.petsPale, Storage.petsPale.Length + 1)
            Storage.petsPale[Storage.petsPale.Length - 1] = Pet
        elseIf (Storage.ReachLoc().IsChild(Pet.GetCurrentLocation()))
            Storage.petsReach = ResizeFormArray(\
                Storage.petsReach, Storage.petsReach.Length + 1)
            Storage.petsReach[Storage.petsReach.Length - 1] = Pet
        elseIf (Storage.RiftLoc().IsChild(Pet.GetCurrentLocation()))
            Storage.petsRift = ResizeFormArray(\
                Storage.petsRift, Storage.petsRift.Length + 1)
            Storage.petsRift[Storage.petsRift.Length - 1] = Pet
        elseIf (Storage.WhiterunLoc().IsChild(Pet.GetCurrentLocation()))
            Storage.petsWhiterun = ResizeFormArray(\
                Storage.petsWhiterun, Storage.petsWhiterun.Length + 1)
            Storage.petsWhiterun[Storage.petsWhiterun.Length - 1] = Pet
        elseIf (Storage.WinterholdLoc().IsChild(Pet.GetCurrentLocation()))
            Storage.petsWinterhold = ResizeFormArray(\
                Storage.petsWinterhold, Storage.petsWinterhold.Length + 1)
            Storage.petsWinterhold[Storage.petsWinterhold.Length - 1] = Pet
        endif
        index -= 1
    endwhile
    ; MessageBox(Storage.petsHaafingar)
EndFunction


Keyword Property LocTypeHold  Auto  

ObjectReference Property PlayerRef  Auto  

lope_storageContainer Property Storage  Auto  
