Scriptname lope_onUpdateRadiant extends ReferenceAlias  

Import PO3_SKSEFunctions


event OnUpdateGameTime()
    if storage.isRegisteredForRadiant
        (GetFormFromEditorID("lope_LostPetsStart") as Quest).SetStage(0)
        Storage.isRegisteredForRadiant = False
    endif
endevent


function registerForRadiant(float time = 24.0)
    ; debug.messagebox("registerForVisit")
    if !Storage.isRegisteredForRadiant
        ; debug.messagebox("registerForRadiant If got TRUE")
        registerForSingleUpdateGameTime(time)
        Storage.isRegisteredForRadiant = True
    endif
endfunction


lope_storageContainer Property Storage Auto