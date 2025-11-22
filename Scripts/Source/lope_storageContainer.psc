Scriptname lope_storageContainer extends Quest  
{Storage container for data.}

import Game
import Debug

import Utility


; Constants for maximum amount of pets with rank  [total 10]
int   Property MAX_RANK_1 = 2 AutoReadOnly             Hidden
int   Property MAX_RANK_2 = 1 AutoReadOnly             Hidden
int   Property MAX_RANK_3 = 1 AutoReadOnly             Hidden
int   Property MAX_RANK_4 = 2 AutoReadOnly             Hidden
int   Property MAX_RANK_5 = 1 AutoReadOnly             Hidden
int   Property MAX_RANK_6 = 2 AutoReadOnly             Hidden
int   Property MAX_RANK_7 = 1 AutoReadOnly             Hidden
float Property nextPOS = 24.0 AutoReadOnly             Hidden

; Not a constant, but should be
int[]             Property MAX_RANKS              Auto Hidden

; Variables
bool              Property isRegisteredForNextPOS Auto Hidden
bool              Property isRegisteredForRadiant Auto Hidden
int               Property HostilesCount          Auto Hidden
ObjectReference   Property movableMarker          Auto Hidden
ObjectReference   Property movableMarkerProxy     Auto Hidden
String            Property previousSoundFileName  Auto Hidden  ; useless

int[]             Property petsRanksHold1         Auto Hidden
int[]             Property petsRanksHold2         Auto Hidden
int[]             Property petsRanksHold3         Auto Hidden
int[]             Property petsRanksHold4         Auto Hidden
int[]             Property petsRanksHold5         Auto Hidden
int[]             Property petsRanksHold6         Auto Hidden
int[]             Property petsRanksHold7         Auto Hidden
int[]             Property petsRanksHold8         Auto Hidden
int[]             Property petsRanksHold9         Auto Hidden
int[]             Property petsMinRelAllHolds     Auto Hidden

ObjectReference[] Property petsAll                Auto
Form[]            Property petsEastmarch          Auto Hidden
Form[]            Property petsFalkreath          Auto Hidden
Form[]            Property petsHaafingar          Auto Hidden
Form[]            Property petsHjaalmarch         Auto Hidden
Form[]            Property petsPale               Auto Hidden
Form[]            Property petsReach              Auto Hidden
Form[]            Property petsRift               Auto Hidden
Form[]            Property petsWhiterun           Auto Hidden
Form[]            Property petsWinterhold         Auto Hidden

Form[]            Property strippedArmor          Auto Hidden
; Why             am       i                      doin this
;Noone            cares    about                  this style
;Thats            damn     stupid                 to   do

; What the fuck? Because I can't assign it on read-only propetry.

; Get Eastmarch Hold location
Location Function EastmarchLoc()
    return GetForm(0x0001676A) as Location
EndFunction
; Get Falkreath Hold location
Location Function FalkreathLoc()
    return GetForm(0x0001676F) as Location
EndFunction
; Get Haafingar Hold location
Location Function HaafingarLoc()
    return GetForm(0x00016770) as Location
EndFunction
; Get Hjaalmarch Hold location
Location Function HjaalmarchLoc()
    return GetForm(0x0001676E) as Location
EndFunction
; Get The Pale Hold location
Location Function PaleLoc()
    return GetForm(0x0001676D) as Location
EndFunction
; Get The Reach Hold location
Location Function ReachLoc()
    return GetForm(0x00016769) as Location
EndFunction
; Get The Rift Hold location
Location Function RiftLoc()
    return GetForm(0x0001676C) as Location
EndFunction
; Get Whiterun Hold location
Location Function WhiterunLoc()
    return GetForm(0x00016772) as Location
EndFunction
; Get Winterhold Hold location
Location Function WinterholdLoc()
    return GetForm(0x0001676B) as Location
EndFunction
Keyword Function locTypeHold()
    return GetForm(0x00016771) as Keyword
EndFunction

; Factions
Faction Function lostPetFaction()
    return GetFormFromFile(0x00000D63, "lost_pets.esp") as Faction
EndFunction
Faction Function CurrentFollowerFaction()
    return GetFormFromFile(0x0005C84E, "Skyrim.esm") as Faction
EndFunction
Faction Function BardAudienceExcludedFaction()
    return GetFormFromFile(0x0010FCB5, "Skyrim.esm") as Faction
EndFunction
Faction Function JobJewelerFaction()
    return GetFormFromFile(0x806A9, "Skyrim.esm") as Faction
EndFunction
Faction Function JobLumberjackFaction()
    return GetFormFromFile(0x51595, "Skyrim.esm") as Faction
EndFunction
Faction Function JobPriestFaction()
    return GetFormFromFile(0x5159A, "Skyrim.esm") as Faction
EndFunction
Faction Function ThievesGuildFaction()
    return GetFormFromFile(0x29DA9, "Skyrim.esm") as Faction
EndFunction
Faction Function CompanionsFaction()
    return GetFormFromFile(0x48362, "Skyrim.esm") as Faction
EndFunction
Faction Function JobCourtWizardFaction()
    return GetFormFromFile(0x5091E, "Skyrim.esm") as Faction
EndFunction
Faction Function JobApothecaryFaction()
    return GetFormFromFile(0x5091C, "Skyrim.esm") as Faction
EndFunction
Faction Function JobBlacksmithFaction()
    return GetFormFromFile(0x5091D, "Skyrim.esm") as Faction
EndFunction

; Furniture
FormList Function sexlabBedsList()
    return GetFormFromFile(0x000181B1, "SexLab.esm") as FormList
EndFunction
FormList Function allChairsList()
    return GetFormFromFile(0x003BD831, "lost_pets.esp") as FormList
EndFunction
FormList Function allArmchairsList()
    return GetFormFromFile(0x004CDC7B, "lost_pets.esp") as FormList
EndFunction
FormList Function allBenchesList()
    return GetFormFromFile(0x003BD832, "lost_pets.esp") as FormList
EndFunction
FormList Function chairsFrontLeftList()
    return GetFormFromFile(0x003BD833, "lost_pets.esp") as FormList
EndFunction

; Gifts
FormList Function GiftGenericFemale()
    return GetFormFromFile(0x00A248E, "Skyrim.esm") as FormList
EndFunction
FormList Function GiftJeweler()
    return GetFormFromFile(0x00A0E51, "Skyrim.esm") as FormList
EndFunction
FormList Function GiftLumberjackFemale()
    return GetFormFromFile(0x00A0E5A, "Skyrim.esm") as FormList
EndFunction
FormList Function GiftPriest()
    return GetFormFromFile(0x00A248A, "Skyrim.esm") as FormList
EndFunction
FormList Function GiftThief()
    return GetFormFromFile(0x00A248B, "Skyrim.esm") as FormList
EndFunction
FormList Function GiftWarrior()
    return GetFormFromFile(0x00A0E5D, "Skyrim.esm") as FormList
EndFunction
FormList Function GiftWizard()
    return GetFormFromFile(0x00A2489, "Skyrim.esm") as FormList
EndFunction
FormList Function GiftApothecary()
    return GetFormFromFile(0x00A0E4D, "Skyrim.esm") as FormList
EndFunction
FormList Function GiftBlacksmith()
    return GetFormFromFile(0x00A0E4C, "Skyrim.esm") as FormList
EndFunction
; FormList Function sexLabBedsList()
;     return GetFormFromFile(0x000181B1, "Sexlab.esp") as FormList
; EndFunction
Form Function markerNearPlayer()
    return GetFormFromFile(0x0042CE2E, "lost_pets.esp") as Form
EndFunction

; Other Formlists
Formlist Function allPets()
    return GetFormFromFile(0x000FC1FB, "lost_pets.esp") as Formlist
EndFunction

; Topic
Topic Function UniversalTopic()
    return GetFormFromFile(0x007A58B6, "lost_pets.esp") as Topic
EndFunction

;???
Int Function getMaximumPetRelationship()
    ; code
EndFunction
 

; Call it once
Function initializeRanksArrays()
    petsRanksHold1 = CreateIntArray(7, 0)
    petsRanksHold2 = CreateIntArray(7, 0)
    petsRanksHold3 = CreateIntArray(7, 0)
    petsRanksHold4 = CreateIntArray(7, 0)
    petsRanksHold5 = CreateIntArray(7, 0)
    petsRanksHold6 = CreateIntArray(7, 0)
    petsRanksHold7 = CreateIntArray(7, 0)
    petsRanksHold8 = CreateIntArray(7, 0)
    petsRanksHold9 = CreateIntArray(7, 0)

    MAX_RANKS = new int[7]
    MAX_RANKS[0] = MAX_RANK_1
    MAX_RANKS[1] = MAX_RANK_2
    MAX_RANKS[2] = MAX_RANK_3
    MAX_RANKS[3] = MAX_RANK_4
    MAX_RANKS[4] = MAX_RANK_5
    MAX_RANKS[5] = MAX_RANK_6
    MAX_RANKS[6] = MAX_RANK_7

    Trace("[LoPe] Initialized arrays.")
EndFunction


; Useless
Function populateIntArray(int[] array, int value)
    int index = 0
    While (index < array.Length)
        array[index] = value
        index += 1
    EndWhile
EndFunction


; Useless
int Function getHostilesCount()
    return HostilesCount
EndFunction

ObjectReference Property utilCellMarker Auto
