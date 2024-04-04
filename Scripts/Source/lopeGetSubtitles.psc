Scriptname lopeGetSubtitles extends Quest  

Import PapyrusUtil
Import JsonUtil
Import Debug


; string fileNameSet = "../lostpets/setFromScript.json"
 

function showString(Int sceneId, Actor partner = None)
    int topicIdx = 0
    int topicCount
    string fileName = "../lostpets/subtitles.json"
    string[] replic
    string sceneIdFull

    if !JsonUtil.IsGood(fileName)
        messagebox("J'SON of the bitch is fucked up somehow! Return.")
        return
    endif
    ; messagebox(sceneId+" | "+partner)
    ; int sceneId = 0  ; will be string
    ; TODO stageId intead of sceneId
    sceneIdFull = "scene_"+sceneId+"_"
    topicCount = CountStringListPrefix(fileName , PrefixKey="scene_"+sceneId+"_") - 1
    ; messagebox("Prefix = "+sceneIdFull+" | topic count: "+topicCount)
    ; string[] replic = new string[3]
    while topicIdx <= topicCount
        replic = StringListToArray(fileName, sceneIdFull+"topic_"+topicIdx)
        ; messagebox(replic)
        ; sub.WidgetVisible(True)
        if replic[1] == "Pause"
            sub.WidgetVisible(False)
        elseif partner
            sub.showSubtitles(speaker=partner, text=replic[1])
        else
            sub.showSubtitles(name=replic[0], text=replic[1])
        endif
        utility.wait(replic[2] as int)
        topicIdx += 1
    endwhile
    ; sub.WidgetVisible(False)
    topicIdx = 0
    sl.nextStageSexlab()
endfunction


Function countPrefix()
    ; code
    ;JsonUtil.unLoad(fileName)
    MessageBox(CountStringListPrefix("../lostpets/subtitles.json" , PrefixKey="scene_0_"))
EndFunction


lopeSubtitles Property sub  Auto  

lope_sl Property sl  Auto  
