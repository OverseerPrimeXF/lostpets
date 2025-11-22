Scriptname lope_nativeFunctions hidden


string function playFuz(String path_to_file) global native

string function renameVoiceFiles(String path_to_file, String replicText) global native

function MoveVoiceFilesBack(String previous_path_to_file) global native

string function getSubstring(String input, string searchStr="", int pos1=0, int pos2=0) global native

string function stringReplace(String input, string whatReplace, string replacement) global native

; Checks if given string is float number.
bool Function isFloat(String string_to_check) global native

Form Function getRandomFormWithKeywordsFromList(Formlist kwds, bool match_all)  global native

; gets all game form ids and writes to lope_debug file, no CTD
Function getAllFormsEditorIDs() global native

Function MakeActorShutup(Actor akActor) global native

int[] Function excludeElementsInt(int[] fromExclude, int[] whatExclude) global native

Actor[] Function makeFriendly(Location aLocation, Race[] aRaces) Global native

ObjectReference Function FindReferencesOfTypeInCellWithOwner(ObjectReference center, Form formlist, float radius) Global native

; @Deprecated
Function setFriendly(Location loc, Race[] races) Global
    return
    Actor[] allActorsOnLoc = makeFriendly(loc, races)
    int index = 0
    While (index < allActorsOnLoc.Length)
        Actor item = allActorsOnLoc[index]
        ; item.SetActorValue("Aggression", 0)
        Debug.MessageBox(item.GetActorBase().GetName() + "'s aggression is: " + item.GetActorValue("Aggression"))
        index += 1
    EndWhile
EndFunction

; @Deprecated
Function moveToWorked(String path) global native
; @Deprecated
Function moveAllFilesBack() global native

String Function placeVoiceFile(String path) global native  ; it just works.

; Function testLocRefType() global native  ; crap.

; float Function makeActorSay(ObjectReference akSpeaker, Topic topicToSay) global native