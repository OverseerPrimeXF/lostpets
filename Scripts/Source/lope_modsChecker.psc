Scriptname lope_modsChecker extends ReferenceAlias  
{Checks if other mods installed. Checks some statuses and quest stages if enabled.}


Function getModsEnabled()
    ; Check if Frosty installed and enabled
    if Game.GetModByName("frosty_sapient_spider.esp") != 255
        Conditions.isFrostyEnabled = 1
    else
        Conditions.isFrostyEnabled = 0
    endIf
    ; Check if Bestial Essence installed and enabled
    if Game.GetModByName("BesEss.esp") != 255
        Conditions.isBestialEssenceEnabled = 1
    else
        Conditions.isBestialEssenceEnabled = 0
    endIf
EndFunction


Function getFrostyQuests()
    If (Conditions.isFrostyEnabled == 1)
        ; Get quest for eggs carrying
    EndIf
EndFunction


Function getBesEssQuests()    
    If (Conditions.isBestialEssenceEnabled == 1)
        ; Get quest
    EndIf
EndFunction


Event OnInit()
    getModsEnabled()
endEvent


Event OnPlayerLoadGame()
    getModsEnabled()
endEvent


lope_conditionsContainer Property Conditions  Auto  

lope_storageContainer Property Storage  Auto  
