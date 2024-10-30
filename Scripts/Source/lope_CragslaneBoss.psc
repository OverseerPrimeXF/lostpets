Scriptname lope_CragslaneBoss extends ObjectReference  

Import PO3_SKSEFunctions


Event OnDeath(Actor akKiller)
    ; debug.notification("Cragslane Boss died! "+akKiller.getActorBase().getName()+" killed it.")
    ; xMarkerOldStuff.disable()
    ; xMarkerNewStuff.enable()
    ; Location cragslane = xMarkerNewStuff.GetCurrentLocation()
    ; RemoveKeywordOnForm(cragslane, GetFormFromEditorID("LocTypeClearable")  as Keyword)
    ; RemoveKeywordOnForm(cragslane, GetFormFromEditorID("LocTypeDungeon")    as Keyword)
    ; RemoveKeywordOnForm(cragslane, GetFormFromEditorID("LocTypeBanditCamp") as Keyword)
    ; RemoveKeywordOnForm(cragslane, GetFormFromEditorID("SilverHandTarget")  as Keyword)
    ; debug.messagebox(xMarkerNewStuff.GetCurrentLocation().GetKeywords())
    Quest lope_DogArena_Start = GetFormFromEditorID("lope_DogArena_Start") as Quest
    Quest freeformRiften1     = GetFormFromEditorID("FreeformRiften01")    as Quest
    if freeformRiften1.IsRunning() || freeformRiften1.IsCompleted()
        if Maria.IsInFaction(GetFormFromEditorID("CurrentFollowerFaction") as Faction)\
            && game.GetPlayer().GetCurrentLocation().IsSameLocation(Maria.GetCurrentLocation())
            (lope_DogArena_Start as lope_DogArenaStart_conditions).MariaWasFollowing = 1
        else
            (lope_DogArena_Start as lope_DogArenaStart_conditions).MariaWasFollowing = 0
        endif
        lope_DogArena_Start.setstage(1)
        ; debug.messageBox("butcher dead | " + lope_DogArena_Start + " | " + freeformRiften1)
    endif
endEvent


Actor Property Maria Auto

ObjectReference Property xMarkerOldStuff  Auto  

ObjectReference Property xMarkerNewStuff  Auto  
