Scriptname lope_storageContainer extends Quest  
{Storage container for data.}
import Game
import Debug

import Utility


; Constants for maximum amount of pets with rank    10
int Property MAX_RANK_1 = 2 AutoReadOnly        Hidden
int Property MAX_RANK_2 = 1 AutoReadOnly        Hidden
int Property MAX_RANK_3 = 1 AutoReadOnly        Hidden
int Property MAX_RANK_4 = 2 AutoReadOnly        Hidden
int Property MAX_RANK_5 = 1 AutoReadOnly        Hidden
int Property MAX_RANK_6 = 2 AutoReadOnly        Hidden
int Property MAX_RANK_7 = 1 AutoReadOnly        Hidden

; Not a constant, but should be
int[] Property MAX_RANKS    Auto                Hidden

; Mutables
int               Property HostilesCount   Auto Hidden
int[]             Property petsRanksHold1  Auto Hidden
int[]             Property petsRanksHold2  Auto Hidden
int[]             Property petsRanksHold3  Auto Hidden
int[]             Property petsRanksHold4  Auto Hidden
int[]             Property petsRanksHold5  Auto Hidden
int[]             Property petsRanksHold6  Auto Hidden
int[]             Property petsRanksHold7  Auto Hidden
int[]             Property petsRanksHold8  Auto Hidden
int[]             Property petsRanksHold9  Auto Hidden

ObjectReference[] Property petsAll         Auto
Form[]            Property petsEastmarch   Auto Hidden
Form[]            Property petsFalkreath   Auto Hidden
Form[]            Property petsHaafingar   Auto Hidden
Form[]            Property petsHjaalmarch  Auto Hidden
Form[]            Property petsPale        Auto Hidden
Form[]            Property petsReach       Auto Hidden
Form[]            Property petsRift        Auto Hidden
Form[]            Property petsWhiterun    Auto Hidden
Form[]            Property petsWinterhold  Auto Hidden

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
Faction Function lostPetFaction()
    return GetFormFromFile(0x00000D63, "lost_pets.esp") as Faction
EndFunction
FormList Function sexlabBedsList()
    return GetFormFromFile(0x000181B1, "SexLab.esm") as FormList
EndFunction
FormList Function allChairsList()
    return GetFormFromFile(0x003BD831, "lost_pets.esp") as FormList
EndFunction
FormList Function allBenchesList()
    return GetFormFromFile(0x003BD832, "lost_pets.esp") as FormList
EndFunction
FormList Function chairsFrontLeftList()
    return GetFormFromFile(0x003BD833, "lost_pets.esp") as FormList
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
    ;/
    petsRanksHold1 = new int[7]
    populateIntArray(petsRanksHold1, 0)
    petsRanksHold2 = new int[7]
    populateIntArray(petsRanksHold2, 0)
    petsRanksHold3 = new int[7]
    populateIntArray(petsRanksHold3, 0)
    petsRanksHold4 = new int[7]
    populateIntArray(petsRanksHold4, 0)
    petsRanksHold5 = new int[7]
    populateIntArray(petsRanksHold5, 0)
    petsRanksHold6 = new int[7]
    populateIntArray(petsRanksHold6, 0)
    petsRanksHold7 = new int[7]
    populateIntArray(petsRanksHold7, 0)
    petsRanksHold8 = new int[7]
    populateIntArray(petsRanksHold8, 0)
    petsRanksHold9 = new int[7]
    populateIntArray(petsRanksHold9, 0)
    /;
    MAX_RANKS = new int[7]
    MAX_RANKS[0] = MAX_RANK_1
    MAX_RANKS[1] = MAX_RANK_2
    MAX_RANKS[2] = MAX_RANK_3
    MAX_RANKS[3] = MAX_RANK_4
    MAX_RANKS[4] = MAX_RANK_5
    MAX_RANKS[5] = MAX_RANK_6
    MAX_RANKS[6] = MAX_RANK_7
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