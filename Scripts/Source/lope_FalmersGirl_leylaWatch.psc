Scriptname lope_FalmersGirl_leylaWatch extends ReferenceAlias  

Event OnCellLoad()
    ; debug.messageBox(self.getActorReference().getActorBase().getName() + " is loaded!")
    lope_nativeFunctions.makeFriendly(RaldbtharLocation, races)
    if getOwningQuest().GetStage() == 40
        lope_ssh.ShowSubtitlesNonSexlab(\
            "FalmersGirl_firstSexStart", 0, human=self.GetActorRef())
    endif
endEvent

function registerForProgression(float timeInHours, int stage)
    RegisterForSingleUpdateGameTime(timeInHours)
    stageToProgress = stage
endFunction


Event OnUpdateGameTime()
    if stageToProgress != -1
        self.getOwningQuest().setStage(stageToProgress)
    endIf
endEvent

int Property stageToProgress = -1 auto
Location Property RaldbtharLocation Auto
Race[] Property races Auto

lope_ShowSubtitlesHandler Property lope_ssh Auto
