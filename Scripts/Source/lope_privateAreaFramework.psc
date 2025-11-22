Scriptname lope_privateAreaFramework extends Quest  
{Not really a framework. Checks area for Actors and 
sets packages to them to keep distance from center.}

import Debug

import PO3_SKSEFunctions
import PapyrusUtil
import ActorUtil


int previousActorCount = 0
int currentActorCount = 0


Event OnUpdate()
    getAllUniqueActorsRefInAreaRadius(privacyRadius)
    setKeepDistancePackages()
    if polling
        pollingForNewIntruders()
    else
        removeKeepDistancePackages()
        resetFramework()
    endif
EndEvent


; Register for next check for actors in area.
Function pollingForNewIntruders()
    RegisterForSingleUpdate(pollingInterval)
EndFunction


Function startPollingForIntruders(ObjectReference akCenterPrivacy = None)
    if akCenterPrivacy
        centerPrivacy.ForceRefTo(akCenterPrivacy)
    else
        centerPrivacy.ForceRefTo(PlayerREF)
    endif
    polling = True
    pollingForNewIntruders()
EndFunction


; Scan area in radius and add uniuque to TrackedActors.
Function getAllUniqueActorsRefInAreaRadius(float afRadius)
    previousActorCount = TrackedActors.Length
    ; TemporalActors = FindAllReferencesWithKeyword(\
    ;     centerPrivacy.GetRef(), game.GetForm(0x00013794) as Keyword, afRadius, False)
    TemporalActors = MiscUtil.ScanCellNPCs(centerPrivacy.GetRef(), afRadius)
    ; MessageBox(TemporalActors)
    if TemporalActors.Length > 0
        ; TrackedActors = MergeObjRefArray(TrackedActors, TemporalActors, True)
        TrackedActors = MergeActorArray(TrackedActors, TemporalActors, True)
    endIf
    currentActorCount = TrackedActors.Length
    MessageBox(TrackedActors)
EndFunction


; Add keepDistance package to new actors in TrackedActors.
Function setKeepDistancePackages()
    if currentActorCount == previousActorCount
        return
    endif
    int startingIndex = previousActorCount
    While (startingIndex < TrackedActors.Length)
        AddPackageOverride(TrackedActors[startingIndex] as Actor, keepDistancePackage, 65, 1)
        (TrackedActors[startingIndex] as Actor).EvaluatePackage()
        startingIndex += 1
    EndWhile
EndFunction


; Remove keepDistance package from all actors in TrackedActors.
Function removeKeepDistancePackages()
    int index = 0
    While (index < TrackedActors.Length)
        removePackageOverride(TrackedActors[index] as Actor, keepDistancePackage)
        (TrackedActors[index] as Actor).EvaluatePackage()
        index += 1
    EndWhile
EndFunction


; Set default values to used variables.
Function resetFramework()
    previousActorCount = 0
    currentActorCount = 0
    ; TemporalActors = ObjRefArray(0)
    ; TrackedActors = ObjRefArray(0)

    TemporalActors = ActorArray(0)
    TrackedActors = ActorArray(0)
EndFunction


bool Property polling Auto

Package Property keepDistancePackage  Auto  

; ObjectReference[] Property TemporalActors  Auto 
; ObjectReference[] Property TrackedActors  Auto  

Actor[] Property TemporalActors  Auto 
Actor[] Property TrackedActors  Auto  

ObjectReference Property PlayerREF  Auto 
; ObjectReference Property centerPrivacy  Auto
ReferenceAlias Property centerPrivacy  Auto

float Property privacyRadius = 512.0 AutoReadOnly Hidden
float Property pollingInterval = 3.0 AutoReadOnly Hidden
