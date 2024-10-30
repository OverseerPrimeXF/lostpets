Scriptname lope_SE_Haafingar4_baitAlias extends ReferenceAlias  


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akOldContainer && !akNewContainer
        ; Bait is dropped, checking if we are in the right area (if snow tree nearby).
        snowTree = nextSnowTree
        nextSnowTree = func.getInColdPlace()
        if (!nextSnowTree || (snowTree && snowTree.GetDistance(PlayerREF) < 512) || snowTree==nextSnowTree)
            Debug.Notification("No sight of foxes in the area.")
            return  ; Not in the right area, don't do anything yet.
        endif
        ; If (snowTree==nextSnowTree || snowTree.GetDistance(PlayerREF) < 512)
        ;     Debug.Notification("No sight of foxes in the area.")
        ;     return
        ; EndIf
    elseif akNewContainer && !akOldContainer
        ; Picked up, usesless for us.
        return
    else
        ; Switched continers, usesless for us too.
        return
    endIf
    ; debug.messagebox("It just works.")
    Utility.WaitGameTime(0.05)
    if baitTryedTimes < 3
        Debug.Notification("No sight of fox yet.")
        baitTryedTimes += 1
        return
    endif    
    Fluffpaw.TryToEnable()
    Fluffpaw.GetRef().MoveTo(snowTree)
    FluffpawBaitScene.Start()
    self.GetOwningQuest().SetObjectiveCompleted(30)
    self.GetOwningQuest().SetObjectiveDisplayed(100)
    self.GetOwningQuest().setStage(100)
endEvent


Event OnEquipped(Actor akActor)
    ; debug.MessageBox("Bait dropped!")
    game.GetPlayer().DropObject(self.GetRef().GetBaseObject())
    game.DisablePlayerControls(abMenu = True)
    game.EnablePlayerControls()
EndEvent


int baitTryedTimes = 0
ObjectReference snowTree
ObjectReference nextSnowTree
ObjectReference Property PlayerREF  Auto
lope_functions Property func  Auto  
ReferenceAlias Property Fluffpaw Auto
Scene Property FluffpawBaitScene Auto
