Scriptname lopeSubtitles extends SKI_WidgetBase  
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
    debug.trace("[LoPe] Subtitles widget initialized!")
    Modes = hudModes
EndEvent


function print(String text="", String[] textA=None)
    if text
        debug.messagebox(text)
    elseif textA
        debug.messagebox(textA)
    endif
EndFunction

String Function GetWidgetSource()
    Return "lostpets/lopesubtitle.swf"
EndFunction


String Function GetWidgetType()
    ; Must be the same as scriptname
    Return "lopeSubtitles"
EndFunction


function WidgetVisible(Bool isVisible)
    UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", isVisible)
endfunction


function ShowSubtitles(Actor speaker = None, String name="None", String text)
    WidgetVisible(True)
    if speaker 
        NameText[0] = speaker.getActorBase().getName()
    elseif name != "None"
        NameText[0] = name
    endif
    NameText[1] = text
    ;UI.InvokeString(HUD_MENU, WidgetRoot + ".setCharName", speaker+":")
    ;UI.InvokeString(HUD_MENU, WidgetRoot + ".setCharSpeech", text)
    ;print(textA=NameText)
    UI.InvokeStringA(HUD_MENU, WidgetRoot + ".setSubtitlesText", NameText)
endfunction

String[] Property NameText  Auto
