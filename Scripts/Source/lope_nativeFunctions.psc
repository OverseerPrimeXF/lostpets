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

Function SetActorCollision(Actor akActor, bool disable) global native

int[] Function excludeElementsInt(int[] fromExclude, int[] whatExclude) global native

; float Function makeActorSay(ObjectReference akSpeaker, Topic topicToSay) global native