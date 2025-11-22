Scriptname lope_strippingUtility extends Quest  
{Strips and unstrips actors with animation, tracks up to 4 stripped actors.}


Import papyrusUtil


Event OnInit()
    strippedActors = new Actor[4]
    strippedActorsIDs = new Int[4]
EndEvent


Function strip_actor(Actor akActor, Bool doAnimate = True)
    ; debug.messageBox(akActor)
    if strippedActors.Find(akActor) > -1
        return
    endif    
    setClothesArray(\
        addActorToArray(akActor=akActor),\
        SexLab.StripActor(ActorREF=akActor, doAnimate=doAnimate, leadIn=True))
EndFunction


Function unstrip_actor(Actor akActor, Bool doAnimate = True)
    int index = strippedActors.Find(akActor)
    If (index < 0)
        return
    EndIf
    SexLab.UnstripActor(ActorREF=akActor, Stripped=getClothesArray(index))
    strippedActors[index] = None
EndFunction


Form[] Function getClothesArray(int index)
    ; scary and horrible
    if index == 0
        return Actor00Clothes
    elseif index == 1
        return Actor01Clothes
    elseif index == 2
        return Actor02Clothes
    elseif index == 3
        return Actor03Clothes
    endif
EndFunction


Function setClothesArray(int index, form[] clothes)
    ; scary and horrible
    if index == 0
        Actor00Clothes = clothes
        return 
    elseif index == 1
        Actor01Clothes = clothes
        return 
    elseif index == 2
        Actor02Clothes = clothes
        return 
    elseif index == 3
        Actor03Clothes = clothes
        return 
    endif
EndFunction


int Function addActorToArray(Actor akActor)
    int index = 0
    While (index < strippedActors.Length)
        If (strippedActors[index] == None)
            strippedActors[index] = akActor
            return index
        EndIf
        index += 1
    EndWhile
    return -1
EndFunction


Actor[] strippedActors = None
Int[] strippedActorsIDs = None
Form[] Actor00Clothes
Form[] Actor01Clothes
Form[] Actor02Clothes
Form[] Actor03Clothes

SexLabFramework Property SexLab  Auto  