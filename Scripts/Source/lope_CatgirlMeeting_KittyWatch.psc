Scriptname lope_CatgirlMeeting_KittyWatch extends ReferenceAlias  


event OnCellLoad()
    if GetActorReference().getAV("Paralysis") == 1
        MfgConsoleFunc.SetModifier(self.getActorReference(), 0, 75)
        MfgConsoleFunc.SetModifier(self.getActorReference(), 1, 75)
    endIf
endEvent

Event OnSit(ObjectReference akFurniture)
    if akFurniture != DrunkMarker.getReference()
        return
    endIf
    if self.GetReference().Is3DLoaded()
        utility.wait(0.4)
        MfgConsoleFunc.SetModifier(self.getActorReference(), 0, 75)
        MfgConsoleFunc.SetModifier(self.getActorReference(), 1, 75)
        self.GetActorReference().setAV("Paralysis", 1)
        self.GetActorReference().pushActorAway(self.GetActorReference(), 0)
    endIf
endEvent


Event OnActivate(ObjectReference akActionRef)

    if getOwningQuest().getStage() == 0 && GetActorReference().getAV("Paralysis") == 1
        if utility.randomInt(0, 10) > 3
            debug.notification("She didn't respond")
            return
        endIf
        MfgConsoleFunc.SetModifier(self.getActorReference(), 1, 0)
        MfgConsoleFunc.SetModifier(self.getActorReference(), 0, 0)
        GetActorReference().setAV("Paralysis", 0)
        getOwningQuest().setStage(10)
        (getowningQuest() as lope_catgirlMeeting_controller).drunkTalk = 1
        tryToEvaluatePackage()
    endIf

EndEvent

ReferenceAlias Property DrunkMarker  Auto  
