Scriptname lope_ShowSubtitlesHandler extends ReferenceAlias 
{Handles subtitles displaying while playeing SL animation}
;/We do it here because using utility.wait*() as causing
great faults while any of animation is playing.
Lots of commeted stuff here, but I don't give a crap./;


Import Debug
import utility

Import JsonUtil
Import PO3_SKSEFunctions

Import lope_nativeFunctions


Event  OnInit()
    doInit()
    While (IsInMenuMode())
        Wait(1)
    EndWhile
    Storage.initializeRanksArrays()
    startup.setPetsArrays()
    Trace("[LoPe] Set pets arrays.")
    ; func.addKeywordsToAllFormsInJson()
    ; Trace("[LoPe] Keywords for actors are distibuted")
endEvent


Event OnPlayerLoadGame()
    doInit()
endEvent

; Moved to onUpdateWatch in Packages
;Event OnUpdateGameTime()
;    if storage.isRegisteredForNextPOS
;        (GetFormFromEditorID("lope_PetsOwnersScenes") as Quest).SetStage(0)
;        Storage.isRegisteredForNextPOS = False
;    endif
;endEvent

Function RegisterCustomRaces()
    sslCreatureAnimationSlots.AddRaceID("Foxes", "lope_foxPetRace")
    sslCreatureAnimationSlots.AddRaceID("Canines", "lope_ShepherdRace")
    MiscUtil.PrintConsole("[Lost Pets] Added custom races to SL index")
EndFunction


Function doInit()
    RegisterForModEvent("lope_ShowSubtitles", "OnShowSubtitles")
    RegisterForModEvent("lope_ShowSubtitlesNonSexlab", "OnShowSubtitlesNonSexlab")    
    ; RegisterForModEvent("lope_ShowOvumGif", "OnShowOvumGif")
    MiscUtil.PrintConsole("[Lost Pets] Registered events for subtitles handler")
    RegisterCustomRaces()
endFunction


event OnShowOvumGif(String eventName, String pathName)
    ; not really working like it should be
    UI.OpenCustomMenu("exported/widgets/lostpets/" + pathName)
    Utility.WaitMenuMode(10)
    UI.CloseCustomMenu()
    return
endevent


event OnShowSubtitles(String eventName,\
                      String sceneName,\
                      int stageId,\
                      Form partner,\
                      Form human,\
                      Int compareWithPlayer)
    int topicIdx = 0
    int sceneCount
    int stageCount
    int topicCount
    string choise = -1
    ; string sceneNameL = sceneName
    string fileName = "../lostpets/subtitles.json"
    string sceneFullPath ;  = "."+sceneName
    string topicFullPath
    string[] replic
    Actor currentSpeaker = None

    ; sceneFullPath += ".relationshipRank" + (partner as Actor).GetRelationshipRank(human as Actor)
    ; sceneCount = PathCount(filename, "."+sceneName) - 1
    sceneFullPath = func.getPathToSceneNPC(\
        sceneName, human as Actor, partner as Actor, human as Actor != PlayerActor, compareWithPlayer)
    sceneCount = PathCount(filename, sceneFullPath) - 1
    if sceneCount > 0
        sceneCount = RandomInt(0, sceneCount)
    endif
    sceneFullPath += ".scene" + sceneCount + ".stage" + stageId
    ; topicCount = PathCount(fileName, sceneFullPath) - 1
    MiscUtil.PrintConsole("[LoPe] full sexlab scene path: " + sceneFullPath)
    ; while topicIdx <= topicCount  ; test
    forceEndSubt = False
    while True  ; hell no
        If (forceEndSubt)
            forceEndSubt = False
            sub.WidgetVisible(False)
            ; moveAllFilesBack()
            return
        EndIf
        topicFullPath = sceneFullPath + ".topic"+topicIdx
        if choise == -1
            replic = PathStringElements(fileName, topicFullPath)
        else
            replic = PathStringElements(fileName, topicFullPath + ".choise" + choise)
        endif        
        if replic.Length == 0
            sub.WidgetVisible(False)
            topicIdx = 0
            sl.nextStageSexlab()
            ; moveAllFilesBack()
            return
        endif
        if questInitator && !questInitator.IsRunning()
            ; If quest iniator is ended don't show subt.
            sub.WidgetVisible(False)
            questInitator = None
            ; moveAllFilesBack()
            return
        endif
        if (sl.getSexlabStage() - 1) > stageId
            If (currentSpeaker)
                lope_nativeFunctions.MakeActorShutup(currentSpeaker)
                ; MessageBox(topicFullPath)
                ; moveToWorked(topicFullPath)
                ; moveAllFilesBack()
            EndIf
            return
        endif
        ; replic = PathStringElements(fileName, sceneFullPath+".topic"+topicIdx)
        if replic[0] == "Choise"
            choise = func.showChoisesBox("../lostpets/actions.json", replic[1])
            ; MessageBox(choise)
        elseif replic[0] == "GetPreviousChoises"
            choise = func.getPreviouschoises(replic[1])
        elseif replic[0] == "ResetChoise"
            choise = -1
        elseif replic[0] == "DistanceLT"
            while PlayerActor.GetDistance(human as Actor) > (replic[1] as Int)
                ; MessageBox(human as Actor + " on distance of player: "+ PlayerActor.GetDistance(human as Actor))
                Utility.Wait(0.5)
            endwhile
        ElseIf replic[1] == "Pause"
            sub.WidgetVisible(False)
        ElseIf (replic[0]=="Player")
            currentSpeaker = PlayerActor as Actor
            sub.showSubtitles(\
                speaker=currentSpeaker,\
                text=func.SRIB(replic[1], (partner as actor).getactorbase().getName()))
        ElseIf (replic[0]=="Human" || replic[0]=="Owner")
            currentSpeaker = human as Actor
            sub.showSubtitles(\
                speaker=currentSpeaker,\
                text=func.SRIB(replic[1], (partner as actor).getactorbase().getName()))
        elseif partner && replic[0]=="Pet"
            currentSpeaker = partner as Actor
            sub.showSubtitles(\
                speaker=currentSpeaker,\
                text=func.SRIB(replic[1], PlayerActor)\
                )
        else
            sub.showSubtitles(name=replic[0], text=replic[1])
        endif
        if replic.length == 4
            ; get package or apply actor to 
            act.doActions(replic[3], replic[2] as int, partner as Actor)
        endif
        ; utility.wait(replic[2] as int)
        Utility.Wait(func.PlayTopicVoice(replic[2], topicFullPath, replic[1]) as Float)        
        if (sl.getSexlabStage() - 1) > stageId
            If (currentSpeaker)
                lope_nativeFunctions.MakeActorShutup(currentSpeaker)
            EndIf
            return
        endif
        currentSpeaker = None
        topicIdx += 1
        sub.WidgetVisible(False)
        Utility.Wait(0.2)
        If (!isFloat(replic[2]))  ; we pretend if we didn't have actorbase in replic[2] we didn't have voicefile either
            ; MoveVoiceFilesBack(topicFullPath)
            ; moveToWorked(topicFullPath)
        EndIf
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "InventoryMenu")
    endwhile
    sub.WidgetVisible(False)
    topicIdx = 0
    choise = -1
    sl.nextStageSexlab()
    ; notification("sl.nextStageSexlab()")
endevent


; Non Sexalb version of subtitles, just showes plain subtitles.
event OnShowSubtitlesNonSexlab(String eventName,\
                               String sceneName,\
                               int stageId,\
                               Form partner,\
                               Form human,\
                               Int compareWithPlayer)
    int topicIdx = 0
    int sceneCount
    int stageCount
    int topicCount
    ; string sceneNameL = sceneName
    string fileName = "../lostpets/subtitles.json"
    ; string sceneFullPath = "."
    string sceneFullPath ; = "."+sceneName
    string choise = -1
    string topicFullPath
    string[] replic

    ; sceneFullPath += ".relationshipRank" + (partner as Actor).GetRelationshipRank(human as Actor)
    sceneFullPath = func.getPathToSceneNPC(\
        sceneName, human as Actor, partner as Actor, human as Actor != PlayerActor, compareWithPlayer)
    if sceneFullPath == "none"
        MessageBox("Special scene is not provided, approach pet.")
        return
    endif
        sceneCount = PathCount(filename, sceneFullPath) - 1
    if sceneCount > 0
        sceneCount = RandomInt(0, sceneCount)
    endif
    ; sceneFullPath += sceneName+".scene"+sceneCount
    ; stageCount = PathCount(fileName, sceneFullPath)

    sceneFullPath += ".scene" + sceneCount
    sceneFullPath += ".stage" + stageId
    topicCount = PathCount(fileName, sceneFullPath) - 1
    MiscUtil.Printconsole("[LoPe] full scene path: " + sceneFullPath)
    ; while topicIdx <= topicCount
    while True  ; hell no
        topicFullPath = sceneFullPath + ".topic"+topicIdx
        ; MessageBox(topicFullPath)
        if choise == -1
            replic = PathStringElements(fileName, topicFullPath)
        else
            topicFullPath += (".choise" + choise)
            replic = PathStringElements(fileName, topicFullPath)
        endif
        if replic.Length == 0
            sub.WidgetVisible(False)
            topicIdx = 0
            sl.nextStageSexlab()
            CurrentScene = None
            
            moveAllFilesBack()
            return
        endif
        if questInitator && !questInitator.IsRunning()
            ; If quest iniator is ended don't show subs.
            sub.WidgetVisible(False)
            questInitator = None
            CurrentScene = None
            moveAllFilesBack()
            return
        endif
        ; replic = PathStringElements(fileName, sceneFullPath+".topic"+topicIdx)
        ; messagebox(replic)
        ; sub.WidgetVisible(True)
        if replic[0] == "Choise"
            choise = func.showChoisesBox("../lostpets/actions.json", replic[1])
            ; MessageBox(choise)
        elseif replic[0] == "GetPreviousChoises"
            choise = func.getPreviouschoises(replic[1])
            MiscUtil.PrintConsole("[Lost Pets] got player's choises:" + choise)
        elseif replic[0] == "ResetChoise"
            choise = -1
        elseif replic[1] == "Pause"
            sub.WidgetVisible(False)
        elseif (replic[0]=="Player")
            sub.showSubtitles(speaker=PlayerActor as actor, text=replic[1])
        ElseIf (replic[0]=="Human" || replic[0]=="Owner")
            sub.showSubtitles(speaker=human as actor, text=replic[1])
        elseif partner && replic[0]=="Pet"
            sub.showSubtitles(speaker=partner as actor, text=replic[1])
        else
            sub.showSubtitles(name=replic[0], text=replic[1])
        endif
        if replic.length == 4
            ; get package or apply actor to 
            act.doActions(replic[3], replic[2] as int, partner as Actor, human as Actor)
            if CurrentScene
                ; MessageBox("currents scene: " + CurrentScene)
                while CurrentScene.IsPlaying()
                    utility.wait(0.5)
                endwhile
            endif
            if hostilesPresented
                ; MessageBox("HostilesCount > 0")
                while Storage.HostilesCount > 0
                    utility.wait(0.5)
                endwhile
            endif
        endif
        if !CurrentScene || !hostilesPresented
            ; utility.wait(lope_nativeFunctions.playFuz(replic[2]) as Int)
            utility.wait(func.PlayTopicVoice(replic[2], topicFullPath, replic[1]) as Float)
        else
            CurrentScene = None
            hostilesPresented = False
        endif
        topicIdx += 1
        sub.WidgetVisible(False)
        Utility.Wait(0.2)
        If (!isFloat(replic[2]))
            ; MoveVoiceFilesBack(topicFullPath)  ; we pretend if we haven't actorbase in replic[2] we don't have voicefile
            moveToWorked(topicFullPath)
        EndIf
        CurrentScene = None
    endwhile
    sub.WidgetVisible(False)
    topicIdx = 0
    ; questInitator = None
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
        messagebox("Subtitles.json of the bitch is fucked up somehow! Return.")
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


function ShowSubtitles(String sceneName, Int stageId, Actor partner = None, Actor human = None, Int compareWithPlayer = 0)
    ; MessageBox("ShowSubtitles called")
    if human == None
        human = PlayerActor
    endif
    compareWithPlayer = compareWithPlayerG
    SendEvent("lope_ShowSubtitles", sceneName, stageId, partner, human, compareWithPlayer)
endfunction 


function ShowSubtitlesNonSexlab(String sceneName, Int stageId, Actor partner = None, Actor human = None, Int compareWithPlayer = 0)
	; MessageBox("ShowSubtitlesNonSexlab called")
    if human == None
        human = PlayerActor
    endif
    compareWithPlayerG = compareWithPlayer
    SendEvent("lope_ShowSubtitlesNonSexlab", sceneName, stageId, partner, human, compareWithPlayer)
endfunction


Function Foo()
    debug.messagebox("foo!")
EndFunction


Function ShowOvumGif(String pathName)
    SendOvumEvent("lope_ShowOvumGif", pathName)
EndFunction


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


function SendEvent(String eventName, String sceneName, Int stageId, Form Partner, Form Human, Int compareWithPlayer)
    {Fire a custom tracking event}
    ; MessageBox("SendEvent called")
    int handle = ModEvent.Create(eventName)
    if (handle)
        Debug.trace("[lope] Sent event to start subtitles!")
        ModEvent.PushString(handle, eventName)
        ModEvent.PushString(handle, sceneName)
        ModEvent.PushInt(handle, stageId)
        ModEvent.PushForm(handle, Partner)
        ModEvent.PushForm(handle, human)
        ModEvent.PushInt(handle, compareWithPlayer)
        ModEvent.Send(handle)
    Else
        debug.messagebox("[LoPe] Subtitles SendEvent: All fucked!")
    endif
endFunction


function SendOvumEvent(String eventName, String swfPathName)
    int handle = ModEvent.Create(eventName)
    if (handle)
        Debug.trace("[lope] Sent event to start subtitles!")
        ModEvent.PushString(handle, eventName)
        ModEvent.PushString(handle, swfPathName)
        ModEvent.Send(handle)
    Else
        debug.messagebox("[LoPe] Subtitles SendEvent: All fucked!")
    endif
endFunction


Function ForceEndSubtitles()
    forceEndSubt = True
EndFunction


int compareWithPlayerG = 0

bool  property forceEndSubt = False auto

lopeSubtitles Property sub  Auto  

lope_sl Property sl  Auto  

lopeSubtitlesActionsAPI Property act Auto  
 
lope_LostPetsStartupRoutine Property startup Auto  

lope_storageContainer Property Storage Auto 

lope_functions Property func Auto

Scene Property CurrentScene = None Auto 
Bool Property hostilesPresented = False Auto  

Quest Property questInitator Auto

Actor Property PlayerActor Auto
