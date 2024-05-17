Scriptname lope_functions extends Quest  
{Randon functions we could need.}

import debug
import Utility
import Math
import PO3_SKSEFunctions
import JsonUtil
import PapyrusUtil
import MiscUtil


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


; Useless as PapyrusUtil provides such function
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


; Replaces averything inside '|' chars
; Fuck this |biden| I'm out! >> Fuck this shit I'm out!
string Function StringReplaceInVerticalBars(string asInput, string asReplaceWhat, string asReplaceTo)
    string[] arrayInput = StringSplit(asInput, "|")
    int index = 0
    While (index < arrayInput.Length)
        if arrayInput[index] == asReplaceWhat
            arrayInput[index] = asReplaceTo
        endif
        index += 1
    EndWhile
    return StringJoin(arrayInput, " ")
EndFunction


Actor[] function GetActorsArrayFromQuestRefAliasIDs(Form afQuest, int[] ids)
    Actor currentActor
    Actor[] actors = PapyrusUtil.ActorArray(ids.Length)
    int index = 0
    While (index < ids.Length)
        currentActor = ((afQuest as Quest).GetAlias(ids[index]) as ReferenceAlias).GetActorRef()
        PO3_SKSEFunctions.AddActorToArray(currentActor, actors)
        index += 1
    EndWhile
    ; MessageBox(actors)
    return actors
endfunction


; Sets hostiles count vased on relationship rank with Pet.
int Function setHostilesCountPetRel(Actor akPet = None)
    int petFactionRank = akPet.GetFactionRank(Storage.lostPetFaction())
    ; MessageBox(petFactionRank)
    if petFactionRank != 2 && petFactionRank != 7
        ; MessageBox("petFactionRank: "+petFactionRank+" but petFactionRank != 2 && petFactionRank != 7")
        Storage.HostilesCount = 0
        return 0
    endif
    int petRelationshipRank = akPet.GetRelationshipRank(PlayerRef as Actor)
    if petRelationshipRank < 4
        petRelationshipRank += 1
    endif
    Storage.HostilesCount = petRelationshipRank
    PrintConsole("[LoPe] Pet raltionshiprank and hostile count: "+petFactionRank+" | "+storage.HostilesCount)
    return petRelationshipRank
EndFunction


Function decreaseHostilesCount(int aiCount = 1)
    if Storage.HostilesCount > 0
        Storage.HostilesCount -= aiCount
    endif
EndFunction


; Gets owned ObjectReference (furniture) by ObjectReference (actor).
ObjectReference Function FindReferencesOfTypeInCellWithOwner(ObjectReference akOwner,\
                                                             formlist akFormlist)
    ObjectReference[] allRefs = FindAllReferencesOfType(akOwner, akFormList, 0)
    int index = 0
    While (index < allRefs.Length)
        if allRefs[index].GetActorOwner() == akOwner.GetBaseObject()
            return allRefs[index]
        endif
        index += 1
    EndWhile
EndFunction


; Obsolete before used.
Function setFacingOffsettedPosition(ObjectReference akActor,\
                                    ObjectReference akRelativeWhat,\
                                    float afOffset)
    akActor.SetPosition(\
        akRelativeWhat.X + afOffset * Math.Sin(akRelativeWhat.GetAngleZ()),\
        akRelativeWhat.Y + afOffset * Math.Cos(PlayerRef.GetAngleZ()),\
        akRelativeWhat.Z)
    akActor.SetAngle(0, 0, akRelativeWhat.GetAngleZ() + 180.0)
EndFunction


float[] Function getOffsetArray(ObjectReference akFurniture, String asFurnitureName)
    Float[] offset = new float[6]
    offset[0] = akFurniture.GetPositionX()
	offset[1] = akFurniture.GetPositionY()
	offset[2] = akFurniture.GetPositionZ()
	offset[3] = akFurniture.GetAngleX()
	offset[4] = akFurniture.GetAngleY()
	offset[5] = akFurniture.GetAngleZ()

    offset[0] = offset[0] + 41 * sin(offset[5])
    offset[1] = offset[1] + 41 * cos(offset[5])
    offset[5] = offset[5] + 180.0
    return offset
EndFunction


Form Function GetFormByName(String asName)
    return GetFormFromEditorID(asName)
EndFunction


Function addKeywordsToAllFormsInJson()
    int actorscount = JsonUtil.PathCount("../lostpets/keywords.json", ".Actors")
    int index = 0
    While (index < actorscount)
        AddKeywordToForm(\
            GetFormFromEditorID(GetPathStringValue("../lostpets/keywords.json", ".Actors.actor"+index+"[0]")),\
            GetFormFromEditorID(GetPathStringValue("../lostpets/keywords.json", ".Actors.actor"+index+"[1]")) as Keyword\
            )
        index += 1
    EndWhile
EndFunction


Actor Property PlayerRef  Auto  

lope_storageContainer Property Storage  Auto  
