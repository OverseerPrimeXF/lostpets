Scriptname lope_LPFR_watch extends ReferenceAlias  
{lope_LostPets_firstRumor script for checking if pet in sight.}


function registerForPetSight()
    RegisterForSingleLOSGain(Game.GetPlayer(), self.getRef())
endfunction


Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
    MiscUtil.PrintConsole("[Lost Pets] Pet gain LOS from player.")
    ; (SSH as lope_ShowSubtitlesHandler).Foo()
    (SSH as lope_ShowSubtitlesHandler).ShowSubtitlesNonSexlab(\
        "foundLostDog_firstTime", 0,\
        self.GetActorReference(), Maria.GetActorRef())
endEvent


ReferenceAlias Property Maria Auto
lope_ShowSubtitlesHandler Property lope_SSH  Auto  

ReferenceAlias Property SSH  Auto  
