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
        
        wolf01.Enable()
        wolf02.Enable()

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
        if wolf01.GetRelationshipRank(PlayerRef as Actor) == 0
            (PlayerRef as Actor).SetDontMove()
        endif
        register(3)
    ElseIf questStage == 105
        setobjectivedisplayed(110)
        (lope_SSH as lope_ShowSubtitlesHandler).ShowSubtitlesNonSexlab("WolfAmbushStart", 0, wolf01)
        ; PlayerFoundPet.start()
    elseif questStage == 150
        ; WolfEnc01.getRef().Disable()
        ; WolfEnc02.getRef().Disable()
        ReturnWolvesToUtilCell()
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


Function ReturnWolvesToUtilCell()
    if wolf01 && wolf02
        wolf01.MoveTo(utilCell)
        wolf02.MoveTo(utilCell)
    endif
EndFunction


ReferenceAlias Property Marker  Auto  

ObjectReference Property PlayerRef  Auto  

ReferenceAlias Property WolfEnc01  Auto  

lope_functions Property myFuncs  Auto  

ReferenceAlias Property WolfEnc02  Auto  

Sound Property WolfHowl  Auto  

ReferenceAlias Property lope_SSH  Auto  

ObjectReference Property utilCell  Auto  
