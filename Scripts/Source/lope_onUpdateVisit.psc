Scriptname lope_onUpdateVisit extends ReferenceAlias  


event OnUpdateGameTime()
    if lope_PetVisit.IsStopped() && isRegisteredForVisit.getValueInt() == 1
        lope_PetVisit.setstage(0)
        isRegisteredForVisit.setValue(0)
    endif
endevent


function registerForVisit()
    ; debug.messagebox("registerForVisit")
    if isRegisteredForVisit.getValueInt() == 0 && lope_PetVisit.IsStopped()
        ; debug.messagebox("registerForVisit If got TRUE")
        registerForSingleUpdateGameTime(24.0)
        IsRegisteredForVisit.setValue(1)
    endif
endfunction


Quest Property lope_PetVisit  Auto
GlobalVariable Property IsRegisteredForVisit  Auto 