Scriptname lope_LostPetsController extends Quest  

function registerNextTimeUpdate()
    RegisterForSingleUpdate(1)
EndFunction


Event OnUpdate()
    If getstage() == 100
        If playerRef.GetDistance(Pet.getReference())<= 1024
            Debug.Notification(Pet.GetActorReference().getActorBase().getName()+" somewhere nearby.")
            setobjectivecompleted(100)
            setstage(110)
            PlayerFoundPet.start()
        Else 
            registerNextTimeUpdate()
        EndIf
    EndIf
EndEvent


;[OBSOLETE] Return formlist with avaliable lost pet places for Owner's hold.;Doesnt worked, changed
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
                                                                 ReferenceAlias[] LostPet_MarkersExt=None\
                                           )
    Actor OwnersActor    
    if !OwnerActorExt
        OwnersActor = Owner.GetActorReference()
    else
        OwnersActor  = OwnerActorExt.GetActorReference()
    endif

    ;debug.messagebox("Owner's location: "+OwnersActor .getcurrentlocation().getname())

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
    ;debug.messagebox("GetRandomMarker without as objectref returned "+PossiblePlaces.GetAt(index))
    ;debug.messagebox("GetRandomMarker returned "+PossiblePlaces.GetAt(index) as ObjectReference)
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


function waveHand(Actor akActor)
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
