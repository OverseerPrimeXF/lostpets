Scriptname lope_functions extends Quest  
{Randon functions we could need.}

import debug
import Utility
import Math

import PO3_SKSEFunctions
import JsonUtil
import PapyrusUtil
import MiscUtil

import lope_nativeFunctions


; Returns random X coordinate in range relatively actor
Float function getRandRelX(Actor RelativeTo, Float minDist, Float maxDist, Bool isBehind = True)
    If isBehind
        return -1 * RandomFloat(minDist, maxDist)*Sin(RelativeTo.GetAngleZ())
    Endif
    return RandomFloat(minDist, maxDist)*Sin(RelativeTo.GetAngleZ())
endfunction


; Returns random Y coordinate in range relatively actor
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


; Disgusting
Form[] Function getPetsArrayForCurrentHold(Actor akActor)
    Location currentActorsHold = getActorsHold(akActor)
    if currentActorsHold == Storage.EastmarchLoc()
        return Storage.petsEastmarch
    elseif currentActorsHold == Storage.FalkreathLoc()
        return Storage.petsFalkreath
    elseif currentActorsHold == Storage.HaafingarLoc()
        return Storage.petsHaafingar
    elseif currentActorsHold == Storage.HjaalmarchLoc()
        return Storage.petsHjaalmarch
    elseif currentActorsHold == Storage.PaleLoc()
        return Storage.petsPale
    elseif currentActorsHold == Storage.ReachLoc()
        return Storage.petsReach
    elseif currentActorsHold == Storage.RiftLoc()
        return Storage.petsRift
    elseif currentActorsHold == Storage.WhiterunLoc()
        return Storage.petsWhiterun
    elseif currentActorsHold == Storage.WinterholdLoc()
        return Storage.petsWinterhold
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


; Returns arrau of actors based on array of reference aliases IDs OR names
Actor[] function GetActorsArrayFromQuestRefAliasIDs(Form afQuest, int[] ids)
    Actor currentActor
    Actor[] actors = PapyrusUtil.ActorArray(ids.Length)
    int index = 0
    While (index < ids.Length)
        if isFloat(ids[index])
            currentActor = ((afQuest as Quest).GetAlias(ids[index]) as ReferenceAlias).GetActorRef()
        Else
            currentActor = ((afQuest as Quest).GetAliasByName(ids[index] as String) as ReferenceAlias).GetActorRef()
        EndIf
        PO3_SKSEFunctions.AddActorToArray(currentActor, actors)
        index += 1
    EndWhile
    ; MessageBox(actors)
    return actors
endfunction


; Sets hostiles count based on relationship rank with Pet.
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


;@Deprecated
; Done via c++ plugin now. lope_nativeFunctions.FindReferencesOfTypeInCellWithOwner
; > Gets owned ObjectReference (furniture) by ObjectReference (actor).
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
    return None  ; If nothing found
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


; Returns array with absolute coordinates to place SL scene.
float[] Function getOffsetArray(ObjectReference akFurniture, String asFurnitureName)
    Float[] offset = new float[6]
    offset[0] = akFurniture.GetPositionX()
	offset[1] = akFurniture.GetPositionY()
	offset[2] = akFurniture.GetPositionZ()
	offset[3] = akFurniture.GetAngleX()
	offset[4] = akFurniture.GetAngleY()
	offset[5] = akFurniture.GetAngleZ()
    ; if asFurnitureName == "Chair"
    ;     offset[0] = offset[0] + 41 * sin(offset[5])
    ;     offset[1] = offset[1] + 41 * cos(offset[5])
    ;     offset[5] = offset[5] + 180.0
    ; elseif asFurnitureName == "OwnersBed"
    ;     offset[2] = offset[2] + 45.0
    ; endif
    ; change every check to ifinlist
    if asFurnitureName == "Bedroll"
        offset[2] = offset[2] + 10.0
    elseif Storage.sexLabBedsList().HasForm(akFurniture.GetBaseObject()) 
        PrintConsole("[Lost Pets] Furniture identified as bed!")
        offset[2] = offset[2] + 45.0
    elseif asFurnitureName == "Chair"
        offset[0] = offset[0] + 41 * sin(offset[5])
        offset[1] = offset[1] + 41 * cos(offset[5])
        offset[5] = offset[5] + 180.0
    elseif asFurnitureName == "OwnersBed"
        offset[2] = offset[2] + 45.0
    elseif asFurnitureName == "LostPetMarker"
        offset[2] = offset[2]
    endif
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
            GetFormFromEditorID(GetPathStringValue("../lostpets/keywords.json", ".Actors.actor"+index+"[1]")) as Keyword)
        index += 1
    EndWhile
    PrintConsole("[LoPe] Keyword for Actors distribution finished.")
EndFunction


String Function getActorsSpecialKeyword(Actor akActor)
    String[] kwds = PathStringElements("../lostpets/keywords.json", ".Keywords")
    int index = 0
    While (index < kwds.Length)
        if akActor.HasKeyword(GetFormFromEditorID(kwds[index]) as Keyword)
            return kwds[index]
        endif
        index += 1
    EndWhile
    return None  ; If akActor don't have keyword
EndFunction


String Function getPathToSceneNPC(String asSceneName, actor akHuman, actor akPartner,\
                                  bool includeActorName = False,\
                                  int compareRelationshipsWithPlayer = 0)
    String result = "." + asSceneName
    int lostPetFacRank = akPartner.GetFactionRank(storage.lostPetFaction())
    ; MessageBox(lostPetFacRank)
    If (!akPartner.HasKeyword(GetFormFromEditorID("lope_SimpleSceneActor") as Keyword))
        if lostPetFacRank >= 1
            result += ("FacRank" + lostPetFacRank)
        endif
        if compareRelationshipsWithPlayer == 1
            result += (".relationshipRank" + PlayerRef.GetRelationshipRank(akPartner))
        else
            result += (".relationshipRank" + akHuman.GetRelationshipRank(akPartner))
        endif
        if includeActorName
            result += ("."+GetFormEditorID(akHuman))
        endif
    Else
        result += ".relationshipRank0"
    EndIf
    if !jsonUtil.IsPathObject("../lostpets/subtitles.json", result)
        PrintConsole("[LoPe] Invalid path: "+result)
        Conditions.iSubtitlesNotPresented = 1
        return "none"
    endif
    ; MessageBox(akPartner.GetActorBase().GetName()+" | "+result)
    return result
EndFunction


; Totally same as in StartupRoutine, but walks only pets in current hold.
int Function getMinimalPetRelationshipForCurrentHold()
    Form[] petsInHold = getPetsArrayForCurrentHold(PlayerRef as Actor)
    Int minRelatonship = 4
    Int petRelationship
    int index = 0
    While (index < petsInHold.Length)
        petRelationship = (petsInHold[index] as Actor).GetRelationshipRank(PlayerRef as Actor)
        ; MessageBox((petsInHold[index] as Actor).GetActorBase().GetName() + " realtionships rank is : " + petRelationship)
        if petRelationship < minRelatonship
            minRelatonship = petRelationship
            ; MessageBox("petRelationship < minRelatonship! new min: " + minRelatonship)
        endif
        index += 1
    EndWhile
    return minRelatonship
EndFunction


ReferenceAlias function getQuestRefAliasByName(form questForm, string refAliName)
    return ((questForm as Quest).GetAliasByName(refAliName) as ReferenceAlias)
endfunction


Actor Function getActorFromQuestRefAliasByName(form questForm, string refAliName)
    return ((questForm as Quest).GetAliasByName(refAliName) as ReferenceAlias).GetActorRef()
EndFunction


Package Function getPackageFromEditorID(String editorID)
    return GetFormFromEditorID(editorID) as Package
EndFunction


;/ObjectReference Function placeMarkerNearActor(Actor akActor = None,\
                                              float afOffsetX = 0.0,\
                                              float afOffsetY = -100.0)
    if !akActor
        akActor = PlayerREF
    endif
    if !storage.movableMarker
        storage.movableMarker = akActor.PlaceAtMe(Storage.markerNearPlayer())
    endif
    ; MessageBox(storage.movableMarker)
    storage.movableMarker.MoveTo(akActor,\
                                 akActor.GetPositionX() + afOffsetX,\
                                 akActor.GetPositionY() + afOffsetY,\
                                 akActor.GetPositionZ())
    return storage.movableMarker
EndFunction/;


ObjectReference Function moveMarkerRefAliasToActor(Actor akTarget,\
                                                   ReferenceAlias akMarker,\
                                                   ReferenceAlias akMarkerProxy = None,\
                                                   float afOffsetX = 100.0,\
                                                   float afOffsetY = 40.0)
    If (!akMarker.GetRef())
        MessageBox("[LoPe] moveMarkerRefAliasToActor: akMarker is None")
        return None
    EndIf
    ObjectReference orMarker = akMarker.getRef()
    If (akMarkerProxy)
        ObjectReference orMarkerProxy = akTarget.PlaceAtMe(storage.markerNearPlayer())
        orMarkerProxy.MoveTo(akTarget as ObjectReference,\
                                 afOffsetY * Math.Sin(akTarget.GetAngleZ()+90.0),\
                                 afOffsetY * Math.Cos(akTarget.GetAngleZ()+90.0),\
                                 0)
        akMarkerProxy.ForceRefTo(orMarkerProxy)
    EndIf
    if !storage.movableMarker
        storage.movableMarker = akMarker.GetRef()
    endif
    orMarker.MoveTo(akTarget as ObjectReference,\
                                 afOffsetX * Math.Sin(akTarget.GetAngleZ()),\
                                 afOffsetX * Math.Cos(akTarget.GetAngleZ()),\
                                 0)
    return storage.movableMarker
EndFunction


Function ownerIncreaseRelationsWithPlayer(Actor akOwner, Actor akPet)
    if akPet.GetRelationshipRank(PlayerREF) == 2 && akOwner.GetRelationshipRank(PlayerREF) < 1
        akOwner.SetRelationshipRank(PlayerREF, 1)
        return
    endif
    if akPet.GetRelationshipRank(PlayerREF) == 4 && akOwner.GetRelationshipRank(PlayerREF) < 2
        akOwner.SetRelationshipRank(PlayerREF, 2)
        return
    endif
EndFunction


int Function showChoisesBox(String json, String path)
    Int result = lope_SkyMessage.ShowArray(\
        GetPathStringValue(json, path+".choise_title"),\
        PathStringElements(json, path+".choises"), True) as Int
    If (GetPathBoolValue(json, path+".write_to_conditions[0]"))
        ; (GetFormFromEditorID("lope_playerChoise") as GlobalVariable).SetValueInt(result)
        Conditions.setVariableAt(GetPathStringValue(json, path+".write_to_conditions[1]"), result)
    EndIf
    return result
EndFunction


string Function getPreviousChoises(String choiseName)
    string choises = ""
    string[] choisesNames = papyrusUtil.StringSplit(choiseName)
    int index = 0
    While (index < choisesNames.Length)
        choises += Conditions.getVariableAt(choisesNames[index])
        index += 1
    EndWhile
    return choises
EndFunction


; Set Player to be able to be driven by AI in scenes, disable controls, FALSE to reverse.
Function setPlayerReadyForAIScene(Bool isAIDriven)
    if isAIDriven
        Game.DisablePlayerControls(abLooking = false, abCamSwitch = true, abSneaking = true)
        PlayerRef.SetAnimationVariableInt("IsNPC", 1)
        Game.SetPlayerAIDriven()
        PlayerRef.SetActorValue("SpeedMult", 100)
        Game.ForceThirdPerson()
        Game.ShowFirstPersonGeometry(False)
    else
        Game.SetPlayerAIDriven(False)
        PlayerRef.SetAnimationVariableInt("IsNPC", 0)
        Game.ShowFirstPersonGeometry(True)
        Game.EnablePlayerControls()
        PlayerRef.SetActorValue("SpeedMult", 100)
        ; MessageBox("player ai controlled no more!")
    endif
EndFunction


Function setPlayerExpression(int set1Clear0, int expression, int strength)
    if set1Clear0
        PlayerRef.SetExpressionOverride(expression, strength)
    else
        PlayerRef.ClearExpressionOverride()
    endif
EndFunction


Function setPCDialogueAllowed(bool allow, Form questForm, string[] RefAliasNames)
    int index = 0
    While (index < RefAliasNames.Length)
        getActorFromQuestRefAliasByName(questForm, RefAliasNames[index]).AllowPCDialogue(allow)
        index += 1
    EndWhile
EndFunction


Function giveGiftToPlayer(Actor speaker)
    FormList speakersGifts
    if speaker.IsInFaction(Storage.JobApothecaryFaction())
        speakersGifts = Storage.GiftApothecary()
    elseif speaker.IsInFaction(Storage.JobBlacksmithFaction())
        speakersGifts = Storage.GiftBlacksmith()
    elseif speaker.IsInFaction(Storage.JobCourtWizardFaction())
        speakersGifts = Storage.GiftWizard()
    elseif speaker.IsInFaction(Storage.CompanionsFaction())
        speakersGifts = Storage.GiftWarrior()
    elseif speaker.IsInFaction(Storage.ThievesGuildFaction())
        speakersGifts = Storage.GiftThief()
    elseif speaker.IsInFaction(Storage.JobLumberjackFaction())
        speakersGifts = Storage.GiftLumberjackFemale()
    elseif speaker.IsInFaction(Storage.JobJewelerFaction())
        speakersGifts = Storage.GiftJeweler()
    elseif speaker.IsInFaction(Storage.JobPriestFaction())
        speakersGifts = Storage.GiftPriest()
    else
        speakersGifts = Storage.GiftGenericFemale()
    endif

    ; int randomInt = GenerateRandomInt(0, speakersGifts.GetSize() - 1)
    ; MessageBox(GetFormEditorID(speakersGifts))
    ; MessageBox(randomInt)
    
    ; MessageBox(GetFormEditorID(speakersGifts.GetAt(randomInt))+" at index "+randomInt)
    ObjectReference item = PlayerRef.PlaceAtMe(\
        getRandomFormWithKeywordsFromList(speakersGifts, false), abInitiallyDisabled = True)
    PlayerRef.AddItem(item, 1)
EndFunction


bool Function isStageInList(Quest qst, Int[] stages) global
    ; MessageBox(qst+" | "+stages)
    if stages.Find(qst.GetStage()) > -1
        return True
    endif
    return False
EndFunction


ObjectReference[] Function findPairedChairs()
    ObjectReference[] allFurniture = ScanCellObjects(40, PlayerREF as ObjectReference)
    ; ObjectReference[] allFurniture = FindAllReferencesOfType(\
    ;     PlayerREF as ObjectReference, Storage.allChairsList(), 2048)
    ; PapyrusUtil.MergeObjRefArray(allFurniture, FindAllReferencesOfType(\
    ;     PlayerREF as ObjectReference, Storage.allArmchairsList(), 2048))

    Form baseObject
    ObjectReference[] pairedObjects
    ObjectReference[] result = new ObjectReference[2]
    int index = 0
    While (index < allFurniture.Length)
        baseObject = allFurniture[index].GetBaseObject()
        if Storage.allChairsList().HasForm(baseObject) || Storage.allarmchairsList().HasForm(baseObject)
            pairedObjects = FindAllReferencesOfType(\
                allFurniture[index], baseObject, afRadius=256)
            If (pairedObjects.Length > 1)
                result[0] = allFurniture[index]
                result[1] = pairedObjects[1]
                return result
            EndIf
        endif
        index += 1
    EndWhile
EndFunction


; Gets player's housecarl if it's on current cell, returns None if not found
Actor Function getHousecarlFromCurrentCell()
    Actor[] housecarl = ScanCellNPCsByFaction(GetFormFromEditorID("PlayerHousecarlFaction") as Faction, PlayerRef)
    If (housecarl.Length > 0 && housecarl[0].IsEnabled())
        return housecarl[0]
    EndIf
    return None
EndFunction


; Returns current minimal relationship if all pets in current hold relationships increased.
; Returns -1 if not.
; Needed for hold special event.
int Function isAllPetsInHoldRelationsIncreased()
    int petLowestRelationshipAtStart = (\
        GetFormFromEditorID("lope_petLowestRelationship") as GlobalVariable).GetValueInt()
    int  petLowestRelationshipAfter = getMinimalPetRelationshipForCurrentHold()
    ; MessageBox("global: " + petLowestRelationshipAtStart + "\nnew: " + petLowestRelationshipAfter)
    if petLowestRelationshipAtStart < petLowestRelationshipAfter
        return petLowestRelationshipAfter
    endif
    return -1
EndFunction


Quest Function getSpecialQuest(Location hold, int currentRelationship)
    String questEditorID = "lope_LostPets_specialEvents_" + \
        getSubstring(GetFormEditorID(hold), "Hold") + currentRelationship
    PrintConsole("[Lost Pets] SpecialEvent EditorID should be: " + questEditorID)
    return GetFormFromEditorID(questEditorID) as Quest
EndFunction


; Returns nearest snow tree, needed for checking if we are in snow area.
ObjectReference Function getInColdPlace()
    return game.FindClosestReferenceOfAnyTypeInListFromRef(\
        GetFormFromEditorID("lope_objectsInSnowArea") as FormList, PlayerRef, 2000)
EndFunction


; The one method to play voice line for subtitles
; Args:
; >String actorRefAliasName,\
; >String questEditorID,\
; >String voiceFile
;
; Returns:
; >String wav length in seconds OR String actorBaseEditorID
String Function PlayTopicVoice(String actorBaseEditorID,\
                               String topicFullPath,\
                               String replicText)
    If (isFloat(actorBaseEditorID))
        return actorBaseEditorID
    EndIf
    Actor speaker
    If (actorBaseEditorID != "Pet")
        speaker = game.FindClosestReferenceOfTypeFromRef(GetFormFromEditorID(actorBaseEditorID), PlayerRef, 2048) as Actor
    Else
        speaker = game.FindClosestReferenceOfAnyTypeInListFromRef(Storage.allPets(), PlayerRef, 2048) as Actor
    EndIf
    if speaker
        MakeActorShutup(speaker)
    endif

    ;String seconds = renameVoiceFiles(topicFullPath, replicText)
    String seconds = placeVoiceFile(topicFullPath)

    speaker.Say(Storage.UniversalTopic())
    return seconds
EndFunction


; Debug purpose only.
Function FindByBaseActorAndDisable()
    ObjectReference foundOne = game.FindClosestReferenceOfAnyTypeInListFromRef(Storage.allPets(),\
                                                                               PlayerRef, 2048)
    MessageBox(foundOne)
    ; found[0].disable()
EndFunction


Function SummonCustomFamiliar(ObjectReference place, ObjectReference who)
    ; Activator SummonFX = GetFormFromEditorID("SummonTargetFXActivator") as Activator
    who.MoveTo(place, 0, 0, 10)
    who.PlaceAtMe(GetFormFromEditorID("SummonTargetFXActivator") as Activator)
EndFunction


Function BanishCustomFamiliar()
    ; Activator SummonFX = GetFormFromEditorID("SummonTargetFXActivator") as Activator
    Conditions.AsterConditions.akFamiliar.PlaceAtMe(GetFormFromEditorID("SummonTargetFXActivator") as Activator)
    Conditions.AsterConditions.akFamiliar.MoveTo(Storage.utilCellMarker, 0, 0, 10)
EndFunction


ObjectReference Function SummonFamiliar()
    ObjectReference familiar = PlayerRef.PlaceAtMe(GetFormFromEditorID("lope_SummonFamiliar"))
    familiar.PlaceAtMe(GetFormFromEditorID("SummonTargetFXActivator") as Activator)
    ; MessageBox((GetFormFromEditorID("lope_SummonFamiliar") as ActorBase) == (familiar as Actor).GetActorBase())
    return familiar
EndFunction


Function BanishFamiliar(ObjectReference familiar)
    familiar.PlaceAtMe(GetFormFromEditorID("SummonTargetFXActivator") as Activator)
    familiar.Disable()
    familiar.DeleteWhenAble()
EndFunction


; Compares current game time with given.
; Returns -2 if hour less
; Returns -1 if hour equeal and minute less
; Returns 0 if time equal
; Returns 1 if hour equal and minute bigger
; Returns 2 if hour bigger
; Likely useless
int Function CompareGameTimeWith(int hour = 0, int minute = 0)
    String[] time = StringSplit(StringSplit(GameTimeToString(GetCurrentGameTime()), " ")[1], ":")
    If (time[0] as Int) < hour
        return -2
    EndIf
    If (time[0] as Int) == hour
        If (time[1] as Int) < minute
            return -1
        EndIf
    EndIf
    If ((time[0] as Int) == hour && (time[1] as Int) == minute)
        return 0
    EndIf
    If (time[0] as Int) == hour
        If (time[1] as Int) > minute
            return 1
        EndIf
    EndIf
    If (time[0] as Int) > hour
        return 2
    EndIf
EndFunction


bool Function isCurrentGameTimeLessThan(int hour = 0, int minute = 0)
    return CompareGameTimeWith(hour, minute) < 0
endFunction


Int Function GetPassedGameDays() Global
	return GetCurrentGameTime() as Int
EndFunction


Int Function GetPassedGameDaysGV()
    ; MessageBox(GameDaysPassed.GetValue())
	return GameDaysPassed.GetValueInt()
EndFunction


int Function GetCurrentTimeInMinutes() Global
    return ((Utility.GetCurrentGameTime() - Math.Floor(Utility.GetCurrentGameTime())) * 1440) as int
EndFunction


; They say using global variable much faster than method GetCurrentGameTime()
int Function GetCurrentTimeInMinutesGV()
    return ((GameDaysPassed.GetValue() - GameDaysPassed.GetValueInt()) * 1440) as int
EndFunction


; Returns the current ingame day of the week as int.
;> 0 - Sundas (Sunday)
;> 1 - Morndas (Monday)
;> 2 - Tirdas (Tuesday)
;> 3 - Middas (Wednesday)
;> 4 - Turdas (Thursday)
;> 5 - Fredas (Friday)
;> 6 - Loredas (Saturday)
Int Function GetDayOfWeek()
	return GetPassedGameDaysGV() % 7
EndFunction


; Dog Arena helper: rotates opponent markers around arena center.
Function rotateOpponentMarkers(ObjectReference center, ObjectReference marker1, ObjectReference marker2)
    Float randomAngle = GenerateRandomFloat(0, 90)
    Float distance = 110
    marker1.MoveTo(center, distance * Math.Sin(randomAngle), distance * Math.Cos(randomAngle), 0, false)
    marker1.SetAngle(0, 0, marker1.GetAngleZ() + marker1.GetHeadingAngle(center))

    marker2.MoveTo(center, (-1) * distance * Math.Sin(randomAngle), (-1) * distance * Math.Cos(randomAngle), 0, false)
    marker2.SetAngle(0, 0, marker2.GetAngleZ() + marker2.GetHeadingAngle(center))
EndFunction


Function setOpponentsHeadingEachOther(Actor opponent1, Actor opponent2, bool isHeading = True)
    If (!isHeading)
        opponent1.ClearLookAt()
        opponent2.ClearLookAt()
        return
    EndIf
    opponent1.SetLookAt(opponent2, true)
    opponent2.SetLookAt(opponent1, true)
EndFunction


; debug only
Int[] Function getRandomValues(int min = 1, int max = 99)
    int index = 0
    int rnd = 0
    int[] numbers = IntArray(4, 0)
    While (index < max)
        rnd = RandomInt(1, 99) / 33
        if rnd == 0
            numbers[0] = numbers[0] + 1
        elseif rnd == 1
            numbers[1] = numbers[1] + 1
        elseif rnd == 2
            numbers[2] = numbers[2] + 1
        elseif rnd == 3
            numbers[3] = numbers[3] + 1
        endif
        index += 1
    EndWhile
    return numbers
EndFunction


Function ParalyseActor(Actor akToParalyse, bool paralyse = True)
    If (paralyse)
        akToParalyse.SetActorValue("Paralysis", 1)
        If (akToParalyse.Is3DLoaded())
            akToParalyse.PushActorAway(akToParalyse, 0)
        EndIf
    else
        akToParalyse.SetActorValue("Paralysis", 0)
    EndIf    
EndFunction


Function PushActor(Actor akActor, float x = 1.0, float y = 0.0, float z = 1.0, float force = 300.0)
    If (akActor.Is3DLoaded())
        akActor.PushActorAway(akActor, 0.0)
    EndIf
    akActor.ApplyHavokImpulse(x, y, z, force)
EndFunction


; Not implemented yet
Function ShowOvumGif()
    UI.OpenCustomMenu("lostpets/lopeOvumGif")
    Utility.Wait(3)
    UI.CloseCustomMenu()
EndFunction


Actor Property PlayerRef  Auto  

GlobalVariable Property GameDaysPassed Auto

lope_storageContainer Property Storage  Auto  
lope_conditionsContainer Property Conditions  Auto  
