Scriptname lope_WolfAmbushController extends Quest  

Import Debug

Bool HowlingHasFinished = False
Int questStage
Actor  wolf01
Actor  wolf02


event onUpdate()
    If questStage  == 100 && playerRef.GetDistance(Marker.getReference()) <= 512
        setstage(105)
        Debug.Notification("No sight of pet here...")
        setobjectivecompleted(100)

        wolf01 = WolfEnc01.getActorReference()
        wolf02 = WolfEnc02.getActorReference()
        

        PlayerREF.placeatme(wolf01)
        ; WolfEnc01.ForceRefTo(wolf01)
        WolfEnc01.TryToEvaluatePackage()
        myFuncs.MoveActorToRandomPosBehind(wolf01, PlayerREF as actor, 512, 1024)

        PlayerREF.placeatme(wolf02)
        ; WolfEnc02.ForceRefTo(wolf02)
        WolfEnc02.TryToEvaluatePackage()
        myFuncs.MoveActorToRandomPosBehind(wolf02, PlayerREF as actor, 512, 1024)

        WolfHowl.Play(Wolf01)
        WolfHowl.Play(Wolf02)

        setobjectivedisplayed(105)
        questStage = 105
        Game.ForceThirdPerson()
        ; Game.DisablePlayerControls()
        (PlayerRef as Actor).SetDontMove()
        register(3)
    ElseIf questStage == 105
        setobjectivedisplayed(110)
        (lope_SSH as lope_ShowSubtitlesHandler).ShowSubtitlesNonSexlab("WolfAmbushStart", 0, None)
        ; PlayerFoundPet.start()
    elseif questStage == 150
        WolfEnc01.getRef().Disable()
        WolfEnc02.getRef().Disable()
    ElseIf questStage == 100
        register(1)
    EndIf
endevent


function register(Float time)
    ; debug.messagebox("registered")
    RegisterForSingleUpdate (time)
endfunction


function registerAndGetStage(Float time)
    questStage = getstage()
    RegisterForSingleUpdate (time)
endfunction


ReferenceAlias Property Marker  Auto  

ObjectReference Property PlayerRef  Auto  

ReferenceAlias Property WolfEnc01  Auto  

lope_functions Property myFuncs  Auto  

ReferenceAlias Property WolfEnc02  Auto  

Sound Property WolfHowl  Auto  

ReferenceAlias Property lope_SSH  Auto  
