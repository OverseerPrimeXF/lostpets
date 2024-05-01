Scriptname lope_functions extends Quest  
{Randon functions we could need.}

import debug
import Utility
import Math
import PO3_SKSEFunctions


; Returns randon X coordinate in range relatively actor
Float function getRandRelX(Actor RelativeTo, Float minDist, Float maxDist, Bool isBehind = True)
    If isBehind
        return -1 * RandomFloat(minDist, maxDist)*Sin(RelativeTo.GetAngleZ())
    Endif
    return RandomFloat(minDist, maxDist)*Sin(RelativeTo.GetAngleZ())
endfunction


; Returns randon Y coordinate in range relatively actor
Float function getRandRelY(Actor RelativeTo, Float minDist, Float maxDist, Bool isBehind = True)
    If isBehind
        return -1 * RandomFloat(minDist, maxDist)*Cos(RelativeTo.GetAngleZ())
    Endif
    return RandomFloat(minDist, maxDist)*Cos(RelativeTo.GetAngleZ())
endfunction


; Moves Target Actor relatively to RelativeTo Actor in random position behind it.
function MoveActorToRandomPosBehind(Actor Target, Actor RelativeTo, Float minDist=1.0, Float maxDist=1.0)
    Target.MoveTo(RelativeTo,\
                  getRandRelX(RelativeTo, minDist, maxDist),\
                  getRandRelY(RelativeTo, minDist, maxDist)\
    )
endfunction


;Choose random string from given array.
String Function chooseString(String[] array)
    int index = GenerateRandomInt(0, array.Length - 1)
    ; Debug.MessageBox(index)
    return array[index]
EndFunction


Location Function getParentLocWithKeyword(Location childLoc, Keyword parentKeyword)
    bool match = False
    Location gotParent
    while (!match)
        gotParent = GetParentLocation(childLoc)
        ; MessageBox(gotParent+gotParent.GetName())
        match = gotParent.HasKeyword(parentKeyword)
        if match
            return gotParent
        endif
        childLoc = gotParent
    endwhile
EndFunction


Location Function getActorsHold(Actor npc)
    return getParentLocWithKeyword(npc.GetCurrentLocation(), Storage.locTypeHold())
EndFunction


; Terrible
int[] Function getPetHoldRanksArray(Actor pet)
    Location petsHold = getActorsHold(pet)
    ; MessageBox("Pet's hold: "+petsHold.GetName())
    if petsHold == Storage.EastmarchLoc()
        return Storage.petsRanksHold1
    elseif petsHold == Storage.FalkreathLoc()
        return Storage.petsRanksHold2
    elseif petsHold == Storage.HaafingarLoc()
        return Storage.petsRanksHold3
    elseif petsHold == Storage.HjaalmarchLoc()
        return Storage.petsRanksHold4
    elseif petsHold == Storage.PaleLoc()
        return Storage.petsRanksHold5
    elseif petsHold == Storage.ReachLoc()
        return Storage.petsRanksHold6
    elseif petsHold == Storage.RiftLoc()
        return Storage.petsRanksHold7
    elseif petsHold == Storage.WhiterunLoc()
        return Storage.petsRanksHold8
    elseif petsHold == Storage.WinterholdLoc()
        return Storage.petsRanksHold9
    endif
EndFunction


; Returns True if number in array, otherwise returns False
bool Function isIntInArray(int number, int[] intArray)
    if intArray.Find(number) < 0
        return False
    endif
    return True
EndFunction


int Function intSum(int[] array)
    int index = 0
    int sum = 0
    While (index < array.Length)
        sum += array[index]	
        index += 1
    EndWhile
    return sum
EndFunction


; Replaces everythong inside {} to string
string Function StringReplaceInBrackets(string asInput, string asReplaceTo)
    int indexStart = StringUtil.find(asInput, "{")
    int indexEnd = StringUtil.find(asInput, "}")
    if indexStart == indexEnd
        return asInput
    endif
    string startString = StringUtil.Substring(asInput, 0, indexStart)
    string endString = StringUtil.Substring(asInput, indexEnd + 1)
    ; messagebox(startString+asReplaceTo+endString)
    return startString+asReplaceTo+endString
EndFunction


; Shortcut of StringReplaceInBrackets(string asInput, string asReplaceTo)
string Function SRIB(string asInput, string asReplaceTo)
    return StringReplaceInBrackets(asInput, asReplaceTo)
EndFunction


Actor Property PlayerRef  Auto  

lope_storageContainer Property Storage  Auto  
