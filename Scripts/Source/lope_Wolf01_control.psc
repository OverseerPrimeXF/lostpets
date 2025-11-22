Scriptname lope_Wolf01_control extends Quest  Conditional


Bool Property IsFollowing01  Auto  Conditional

Bool Property IsWaiting01  Auto  Conditional


function Follow(Actor pet = None)
    Wolf01.getActorReference().setPlayerTeammate(True)
    Wolf01.getActorReference().setActorValue("WaitingForPlayer", 0)
    IsFollowing01 = True
    IsWaiting01 = False
    Wolf01.tryToEvaluatePackage()
endfunction

function Wait(Actor pet = None)
    IsWaiting01 = True
    Wolf01.getActorReference().setActorValue("WaitingForPlayer", 1)
    Wolf01.tryToEvaluatePackage()
endfunction

function WaitStop(Actor pet = None)
    IsWaiting01 = False
    Wolf01.getActorReference().setActorValue("WaitingForPlayer", 0)
    Wolf01.tryToEvaluatePackage()
endfunction

function Dismiss(Actor pet = None)
    Wolf01.getActorReference().setPlayerTeammate(False)
    IsFollowing01 = False
    IsWaiting01 = False
    Wolf01.getActorReference().setActorValue("WaitingForPlayer", 0)
    Wolf01.tryToEvaluatePackage()
endfunction


Function RandomStuff(Actor pet = None)

    ; Faction[] all_factions = _barbas.GetFactions(-127, 127)
    ; String factions_string = ""
    ; int index = 0
    ; While (index < all_factions.Length)
    ;     factions_string += PO3_SKSEFunctions.GetFormEditorID(all_factions[index]) + " = " + _barbas.GetFactionRank(all_factions[index]) + "\n"
    ;     index += 1
    ; EndWhile

    ; Debug.MessageBox(factions_string)

EndFunction

Function SetHome(Actor pet = None)
    home_marker01.TryToMoveTo(pet)
EndFunction

ReferenceAlias Property Wolf01 Auto

ReferenceAlias Property home_marker01 Auto