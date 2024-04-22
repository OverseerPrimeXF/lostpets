Scriptname lope_ShowSubtitlesHandler extends ReferenceAlias 
{Handles subtitles displaying while playeing SL animation}
;/We do it here because using utility.wait*() as causing
great faults while any of animation is playing./;


Import Debug
import utility

Import JsonUtil


Event  OnInit()
    doInit()
endEvent


Event OnPlayerLoadGame()
    doInit()
endEvent


Function doInit()
    RegisterForModEvent("lope_ShowSubtitles", "OnShowSubtitles")
    RegisterForModEvent("lope_ShowSubtitlesNonSexlab", "OnShowSubtitlesNonSexlab")
    debug.trace("[Lost Pets] Registering events for subtitles handler")
endFunction


event OnShowSubtitles(String eventName, String sceneName, int stageId, Form partner)
    int topicIdx = 0
    int sceneCount
    int stageCount
    int topicCount
    string sceneNameL = sceneName
    string fileName = "../lostpets/subtitles.json"
    string sceneFullPath = "."
    string[] replic

    sceneCount = PathCount(filename, "."+sceneName) - 1
    if sceneCount > 0
        sceneCount = RandomInt(0, sceneCount)
    endif
    sceneFullPath += sceneName+".scene"+sceneCount
    stageCount = PathCount(fileName, sceneFullPath)
    sceneFullPath += ".stage"+stageId
    topicCount = PathCount(fileName, sceneFullPath) - 1

    while topicIdx <= topicCount
        replic = PathStringElements(fileName, sceneFullPath+".topic"+topicIdx)
        ; notification(sceneFullPath+".topic"+topicIdx)
        ; sub.WidgetVisible(True)
        if replic[1] == "Pause"
            sub.WidgetVisible(False)
        ElseIf (replic[0]=="Player")
            sub.showSubtitles(speaker=game.GetPlayer() as actor, text=replic[1])
        elseif partner && replic[0]=="Pet"
            sub.showSubtitles(speaker=partner as actor, text=replic[1])
        else
            sub.showSubtitles(name=replic[0], text=replic[1])
        endif
        if replic.length == 4
            ; get package or apply actor to 
            act.doActions(replic[3])
        endif
        utility.wait(replic[2] as int)
        topicIdx += 1
    endwhile
    sub.WidgetVisible(False)
    topicIdx = 0
    sl.nextStageSexlab()
    notification("sl.nextStageSexlab()")
endevent


; Non Sexalb version of subtitles, just showes plain subtitles.
event OnShowSubtitlesNonSexlab(String eventName, String sceneName, int stageId, Form partner)
    int topicIdx = 0
    int sceneCount
    int stageCount
    int topicCount
    string sceneNameL = sceneName
    string fileName = "../lostpets/subtitles.json"
    string sceneFullPath = "."
    string[] replic

    sceneCount = PathCount(filename, "."+sceneName) - 1
    if sceneCount > 0
        sceneCount = RandomInt(0, sceneCount)
    endif
    sceneFullPath += sceneName+".scene"+sceneCount
    stageCount = PathCount(fileName, sceneFullPath)
    sceneFullPath += ".stage"+stageId
    topicCount = PathCount(fileName, sceneFullPath) - 1

    while topicIdx <= topicCount
        replic = PathStringElements(fileName, sceneFullPath+".topic"+topicIdx)
        ; messagebox(replic)
        ; sub.WidgetVisible(True)
        if replic[1] == "Pause"
            sub.WidgetVisible(False)
        ElseIf (replic[0]=="Player")
            sub.showSubtitles(speaker=game.GetPlayer() as actor, text=replic[1])
        ; elseif partner && replic[0]=="Pet"
        ;     sub.showSubtitles(speaker=partner as actor, text=replic[1])
        else
            sub.showSubtitles(name=replic[0], text=replic[1])
        endif
        if replic.length == 4
            ; get package or apply actor to 
            act.doActions(replic[3], getowningquest())
        endif
        utility.wait(replic[2] as int)
        topicIdx += 1
    endwhile
    sub.WidgetVisible(False)
    topicIdx = 0
    ; sl.nextStageSexlab()
endevent


; Obsolete
event __OnShowSubtitlesOld(String eventName, String sceneName, int stageId, Form partner)
    int topicIdx = 0
    int topicCount
    int sceneId
    string sceneNameL = sceneName
    string fileName = "../lostpets/subtitles.json"
    string stageIdFull
    string[] replic

    if !JsonUtil.IsGood(fileName)
        ; messagebox("J'SON of the bitch is fucked up somehow! Return.")
        return
    endif
    ; messagebox(stageId+" | "+partner)
    ; int stageId = 0  ; will be string
    sceneId = CountStringListPrefix(fileName, PrefixKey="scene_"+sceneNameL+"_") - 1
    if sceneId > 0
        sceneId = RandomInt(0, sceneId)
    endif

    stageIdFull = "scene_"+sceneName+"_"+sceneId+"_stage_"+stageId+"_"
    topicCount = CountStringListPrefix(fileName , PrefixKey=stageIdFull) - 1
    ; messagebox("Prefix = "+stageIdFull+" | topic count: "+topicCount)
    ; string[] replic = new string[3]
    while topicIdx <= topicCount
        replic = StringListToArray(fileName, stageIdFull+"topic_"+topicIdx)
        ; messagebox(replic)
        ; sub.WidgetVisible(True)
        if replic[1] == "Pause"
            sub.WidgetVisible(False)
        ElseIf (replic[0]=="Player")
            sub.showSubtitles(speaker=game.GetPlayer() as actor, text=replic[1])
        elseif partner && replic[0]=="Pet"
            sub.showSubtitles(speaker=partner as actor, text=replic[1])
        else
            sub.showSubtitles(name=replic[0], text=replic[1])
        endif
        utility.wait(replic[2] as int)
        topicIdx += 1
    endwhile
    sub.WidgetVisible(False)
    topicIdx = 0
    sl.nextStageSexlab()
endEvent


function ShowSubtitles(String sceneName, Int stageId, Actor partner = None)
	SendEvent("lope_ShowSubtitles", sceneName, stageId, partner)
endfunction 


function ShowSubtitlesNonSexlab(String sceneName, Int stageId, Actor partner = None)
	SendEvent("lope_ShowSubtitlesNonSexlab", sceneName, stageId, partner)
endfunction 


; Debug use only
Function countPrefix(Form FormtoSet)
    ; code
    ;JsonUtil.unLoad(fileName)
    ; PapyrusUtil.StringSplit("12,3", ",")
    ;MessageBox(CountStringListPrefix("../lostpets/subtitles.json" , PrefixKey="scene_dogTagsAnal_0_"))
    ; string[] val = new string[3]
    ; val[0] = "Dog"
    ; val[1] = "Fucks player fast"
    ; val[2] = "3"
    ; JsonUtil.SetPathStringArray("../lostpets/testz.json", ".dogTagsAnal.scene_0.Stage_0", val)
    ; JsonUtil.SetPathStringArray("../lostpets/testz.json", ".dogTagsAnal.scene_0.Stage_1", val)
    ; JsonUtil.SetPathStringArray("../lostpets/testz.json", ".dogTagsAnal.scene_0.Stage_2", val)

    ; JsonUtil.SetPathStringArray("../lostpets/testz.json", ".dogTagsAnal.scene_1.Stage_0", val)
    ; JsonUtil.SetPathStringArray("../lostpets/testz.json", ".dogTagsAnal.scene_1.Stage_1", val)
    ; JsonUtil.SetPathStringArray("../lostpets/testz.json", ".dogTagsAnal.scene_1.Stage_2", val)


    ; messagebox(PathStringElements("../lostpets/testz.json", ".dogTagsAnal.scene_1.Stage_2"))
    ; MessageBox("stages in scene"+PathCount("../lostpets/testz.json", ".dogTagsAnal.scene_1"))
    ; MessageBox("scenes in sceneName"+PathCount("../lostpets/testz.json", ".dogTagsAnal"))
    ; int topicIdx = 0
    ; int sceneCount
    ; int stageCount
    ; string sceneNameL = "dogTagsAnal"
    ; string fileName = "../lostpets/subtitles.json"
    ; string sceneFullPath = "."
    ; string[] replic
    ; int stageId = 0
    ; actor partner = None

    ; sceneCount = PathCount(filename, "."+sceneNameL) - 1
    ; if sceneCount > 0
    ;     sceneCount = RandomInt(0, sceneCount)
    ; endif
    ; sceneFullPath += sceneNameL+".scene"+sceneCount
    ; stageCount = PathCount(fileName, sceneFullPath)
    ; sceneFullPath += ".stage"+stageId

    ; MessageBox(sceneFullPath)

    ; while topicIdx <= stageCount
    ;     messagebox(sceneFullPath+".topic"+topicIdx)
    ;     replic = PathStringElements(fileName, sceneFullPath+".topic"+topicIdx)
    ;     ; messagebox(replic)
    ;     ; sub.WidgetVisible(True)
    ;     if replic[1] == "Pause"
    ;         sub.WidgetVisible(False)
    ;     ElseIf (replic[0]=="Player")
    ;         sub.showSubtitles(speaker=game.GetPlayer() as actor, text=replic[1])
    ;     elseif partner && replic[0]=="Pet"
    ;         sub.showSubtitles(speaker=partner as actor, text=replic[1])
    ;     else
    ;         sub.showSubtitles(name=replic[0], text=replic[1])
    ;     endif
    ;     utility.wait(replic[2] as int)
    ;     topicIdx += 1
    ; endwhile
    ; sub.WidgetVisible(False)
    ; topicIdx = 0
    ; JsonUtil.SetPathFormValue("../lostpets/testz.json", ".dogTagsAnal.scene_1.Stage_0", FormtoSet)
    Form idleWave = JsonUtil.GetPathFormValue("../lostpets/testz.json", ".dogTagsAnal.scene_1.Stage_0")
    Game.GetPlayer().PlayIdle(idleWave as Idle)
EndFunction


function SendEvent(String eventName, String sceneName, Int stageId, Form Partner)
    {Fire a custom tracking event}
    int handle = ModEvent.Create(eventName)
    if (handle)
        Debug.trace("[lope] Sent event to start subtitles!")
        ModEvent.PushString(handle, eventName)
        ModEvent.PushString(handle, sceneName)
        ModEvent.PushInt(handle, stageId)
        ModEvent.PushForm(handle, Partner)
        ModEvent.Send(handle)
    Else
        debug.messagebox("All fucked!")
    endif
endFunction


lopeSubtitles Property sub  Auto  

lope_sl Property sl  Auto  


lopeSubtitlesActionsAPI Property act  Auto  
