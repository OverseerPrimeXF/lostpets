Scriptname lope_LostPetsController extends Quest  
{Z}
import Debug

import PO3_SKSEFunctions
import MiscUtil



String sceneName = "FoundLostDogFacRank"

function registerNextTimeUpdate()
    RegisterForSingleUpdate(1)
EndFunction


Event OnUpdate()
    If getstage() == 100
        If playerRef.GetDistance(Pet.getReference()) <= 1024
            Debug.Notification(Pet.GetActorReference().getActorBase().getName()+" somewhere nearby.")
            setobjectivecompleted(100)
            setstage(110)
            ; PlayerFoundPet.start()
            sceneName += Pet.getActorRef().GetFactionRank(LostPetsFaction)
            ; MessageBox("EditorID of marker: "+GetFormEditorID(PetMarker.GetRef().GetBaseObject()))
            ; MessageBox(MarkersInColdPlace.ToArray()+"\n"+PetMarker.GetRef().GetBaseObject())
            if MarkersInColdPlace.HasForm(PetMarker.getRef().GetBaseObject())
                PrintConsole("[LoPe] Marker is in cold place!")
                sceneName += "Cold"
            endif
            PrintConsole("[LoPe] Scene name:"+sceneName)
            (lope_SSH as lope_ShowSubtitlesHandler).showSubtitlesNonSexlab(\
                sceneName, 0, Pet.getActorRef())
        Else 
            registerNextTimeUpdate()
        EndIf
    EndIf
EndEvent


; [OBSOLETE] Return formlist with avaliable lost pet places for Owner's hold.;Doesnt worked, changed
FormList function setFormList()
    Actor OwnersActor = Owner.GetActorReference()
    debug.messagebox("Owner's location: "+OwnersActor .getcurrentlocation().getname())

    If OwnersActor.IsInLocation(Holds[0])
        return LostPet_PossiblePlaces_Holds[0]
    elseIf OwnersActor.IsInLocation(Holds[1])
        return LostPet_PossiblePlaces_Holds[1]
    elseIf OwnersActor.IsInLocation(Holds[2])
        return LostPet_PossiblePlaces_Holds[2]
    elseIf OwnersActor.IsInLocation(Holds[3])
        return LostPet_PossiblePlaces_Holds[3]
    elseIf OwnersActor.IsInLocation(Holds[4])
        return LostPet_PossiblePlaces_Holds[4]
    elseIf OwnersActor.IsInLocation(Holds[5])
        return LostPet_PossiblePlaces_Holds[5]
    elseIf OwnersActor.IsInLocation(Holds[6])
        return LostPet_PossiblePlaces_Holds[6]
    elseIf OwnersActor.IsInLocation(Holds[7])
        return LostPet_PossiblePlaces_Holds[7]
    elseIf OwnersActor.IsInLocation(Holds[8])
        return LostPet_PossiblePlaces_Holds[8]
    endIf    
EndFunction


ObjectReference function getPetMarker(ReferenceAlias OwnerActorExt=None,\
                                      ReferenceAlias[] LostPet_MarkersExt=None)
    Actor OwnersActor    
    if !OwnerActorExt
        OwnersActor = Owner.GetActorReference()
    else
        OwnersActor  = OwnerActorExt.GetActorReference()
    endif
    ; debug.messagebox("Owner's location: "+OwnersActor .getcurrentlocation().getname())
    int arrayLength = Holds.length - 1
    if arrayLength != LostPet_Markers.length - 1
        Debug.MessageBox("Holy shoite! Arrays at lope_LostPetsController aren't same length :(!")
        return None
    endif

    while arrayLength > 0
        If OwnersActor.IsInLocation(Holds[arrayLength])
            if LostPet_MarkersExt
                return LostPet_MarkersExt[arrayLength].getReference()
            endif
            return LostPet_Markers[arrayLength].getReference()
        endif
        arrayLength  -= 1
    endwhile

    ;/If OwnersActor.IsInLocation(Holds[0])
        return LostPet_Markers[0].getReference()
    elseIf OwnersActor.IsInLocation(Holds[1])
        return LostPet_Markers[1].getReference()
    elseIf OwnersActor.IsInLocation(Holds[2])
        return LostPet_Markers[2].getReference()
    elseIf OwnersActor.IsInLocation(Holds[3])
        return LostPet_Markers[3].getReference()
    elseIf OwnersActor.IsInLocation(Holds[4])
        return LostPet_Markers[4].getReference()
    elseIf OwnersActor.IsInLocation(Holds[5])
       return LostPet_Markers[5].getReference()
    elseIf OwnersActor.IsInLocation(Holds[6])
        return LostPet_Markers[6].getReference()
    elseIf OwnersActor.IsInLocation(Holds[7])
        return LostPet_Markers[7].getReference()
    elseIf OwnersActor.IsInLocation(Holds[8])
        return LostPet_Markers[8].getReference()
    endIf/;
EndFunction


ObjectReference Function GetRandomMarker(FormList PossiblePlaces)
    int formSize = PossiblePlaces.getSize() - 1
    ;debug.messagebox("formSize  "+formSize)
    Int index = utility.RandomInt(0, formSize)
    ;debug.messagebox("index "+index )
    ; debug.messagebox("GetRandomMarker without as objectref returned "+PossiblePlaces.GetAt(index))
    ; debug.messagebox("GetRandomMarker returned "+PossiblePlaces.GetAt(index) as ObjectReference)
    Return PossiblePlaces.GetAt(index) as ObjectReference 
EndFunction


Function SetPetMarkerAlias(ObjectReference Marker, ReferenceAlias LostPetMarkerExternal=None)
    if LostPetMarkerExternal
        LostPetMarkerExternal.ForceRefTo(Marker)
    else
        LostPetMarker.ForceRefTo(Marker)
    endif
EndFunction


Function SetPetLocationAlias(ObjectReference Marker)
    LostPetLocation.ForceLocationTo(Marker.GetCurrentLocation())
EndFunction


bool Function SetRandomPetFactionRank(Actor aPet, Faction fPetFaction)
    ; MessageBox("Pet to set rank: "+aPet+aPet.GetActorBase().GetName())
    if aPet.GetFactionRank(fPetFaction) > 0
        PrintConsole("[LoPe] Pet already has a rank: "+aPet.GetFactionRank(fPetFaction))
        ; Trace("[LoPe] Pet already has a rank!")
        return False
    endif
    int[] petHoldRanks = func.getPetHoldRanksArray(aPet)
    ; PrintMessage("petHoldRanks before loop: "+petHoldRanks)
    if func.intSum(petHoldRanks) == func.intSum(Storage.MAX_RANKS)
        PrintConsole("[LoPe] Maximum of ranked pets are reached!")
        return False
    endif
    int generatedRank
    int iterationLimit = 14
    While (iterationLimit > 0)
        PrintConsole("[LoPe] iteration on rank set: "+iterationLimit+\
                     " generated rank: "+generatedRank)
        generatedRank = GenerateRandomInt(1, 7)
        if petHoldRanks[generatedRank - 1] == 0
            petHoldRanks[generatedRank - 1] = 1
            aPet.SetFactionRank(fPetFaction, generatedRank)
            ; MessageBox("!petHoldRanks"+petHoldRanks)
            return True
        elseif petHoldRanks[generatedRank - 1] < Storage.MAX_RANKS[generatedRank - 1]
            petHoldRanks[generatedRank - 1] = petHoldRanks[generatedRank - 1] + 1
            aPet.SetFactionRank(fPetFaction, generatedRank)
            ; MessageBox("petHoldRanks<MAX_RANKS"+petHoldRanks)
            return True
        endif
        iterationLimit -= 1
    EndWhile
    if iterationLimit <= 0
        PrintConsole("[LoPe] Iteration limit reached without luck of rank assignment, "+\
            "giving up and setting random one.")
        aPet.SetFactionRank(fPetFaction, generatedRank)
    endif
EndFunction


Function spawnHostilesBehind()
    if Storage.HostilesCount > 0

    endif
EndFunction


; Debug method
Function waveHand(Actor akActor)
    akActor.playIdle(zIdle_waveHand)
EndFunction


ReferenceAlias Property Owner  Auto  

FormList[] Property LostPet_PossiblePlaces_Holds  Auto  

Location[] Property Holds  Auto  

ReferenceAlias Property LostPetMarker  Auto  

LocationAlias Property LostPetLocation  Auto  

ReferenceAlias[] Property LostPet_Markers  Auto  

ReferenceAlias Property Pet  Auto  

ObjectReference Property PlayerRef  Auto  
Scene Property PlayerFoundPet  Auto  

ReferenceAlias Property PlayerSpeaker  Auto  

Idle Property zIdle_waveHand  Auto  

ReferenceAlias Property lope_SSH  Auto  

Faction Property LostPetsFaction  Auto  

ReferenceAlias Property PetMarker  Auto  

FormList Property MarkersInColdPlace  Auto  

lope_functions Property func  Auto  

lope_storageContainer Property Storage  Auto  
