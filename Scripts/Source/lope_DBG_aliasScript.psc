Scriptname lope_DBG_aliasScript extends ReferenceAlias  


ObjectReference snowTree


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akOldContainer && !akNewContainer
        ; Bait is dropped, checking if we are in the right area (if snow tree nearby).
        snowTree = func.getInColdPlace()
        if !snowTree
            return  ; Not in the right area, don't do anything yet.
        endif
    elseif akNewContainer && !akOldContainer
        ; Picked up, usesless for us.
        return
    else
        ; Switched continers, usesless for us too.
        return
    endIf
    debug.messagebox("It just works")
endEvent


lope_functions Property func  Auto  
