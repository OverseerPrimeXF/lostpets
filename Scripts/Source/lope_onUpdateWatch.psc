Scriptname lope_onUpdateWatch extends Quest  
{Contians (almost) everything what need to be done on update or gametime update}

Import PO3_SKSEFunctions

Quest Property lope_PetVisit  Auto  


function registerForVisit()
    ; debug.messagebox("registerForVisit")
    if isRegisteredForVisit.getValueInt() == 0 && lope_PetVisit.IsStopped()
        ; debug.messagebox("registerForVisit If got TRUE")
        registerForSingleUpdateGameTime(24.0)
        IsRegisteredForVisit.setValue(1)
    endif
endfunction


function registerForRadiant()
    ; debug.messagebox("registerForVisit")
    if !Storage.isRegisteredForRadiant
        ; debug.messagebox("registerForRadiant If got TRUE")
        registerForSingleUpdateGameTime(24.0)
        Storage.isRegisteredForRadiant = True
    endif
endfunction


event OnUpdateGameTime()
    if lope_PetVisit.IsStopped() && isRegisteredForVisit.getValueInt() == 1
        lope_PetVisit.setstage(0)
        isRegisteredForVisit.setValue(0)
    endif
    if storage.isRegisteredForNextPOS
        (GetFormFromEditorID("lope_PetsOwnersScenes") as Quest).SetStage(0)
        Storage.isRegisteredForNextPOS = False
    endif
    if storage.isRegisteredForRadiant
        (GetFormFromEditorID("lope_LostPetsStart") as Quest).SetStage(0)
        Storage.isRegisteredForRadiant = False
    endif
endevent


Quest Property lope_Radiant0  Auto  

lope_storageContainer Property Storage Auto

GlobalVariable Property IsRegisteredForVisit  Auto  
