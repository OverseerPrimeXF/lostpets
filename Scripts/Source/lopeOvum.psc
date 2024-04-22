Scriptname lopeOvum extends SKI_WidgetBase  
{No teravytes of code, just what we need.}


Event OnWidgetInit()
    string[] hudModes = new string[15]
    hudModes[0] = "All"
    hudModes[1] = "StealthMode"
    hudModes[2] = "Favor"
    hudModes[3] = "Swimming"
    hudModes[4] = "HorseMode"
    hudModes[5] = "WarHorseMode"
    hudModes[6] = "MovementDisabled"
    hudModes[7] = "InventoryMode"
    hudModes[8] = "BookMode"
    hudModes[9] = "DialogueMode"
    hudModes[10] = "BarterMode"
    hudModes[11] = "TweenMode"
    hudModes[12] = "WorldMapMode"
    hudModes[13] = "CartMode"
    hudModes[14] = "SleepWaitMode"
    ; hudModes[15] = "JournalMode"
    ; hudModes[16] = "VATSPlayback"
    Modes = hudModes
EndEvent


String Function GetWidgetSource()
    Return "lostpets/lopeOvumGif.swf"
EndFunction


String Function GetWidgetType()
    ; Must be the same as scriptname
    Return "lopeOvum"
EndFunction


function WidgetVisible(Bool isVisible)
    UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", isVisible)
endfunction


