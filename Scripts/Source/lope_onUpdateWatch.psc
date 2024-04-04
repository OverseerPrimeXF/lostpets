Scriptname lope_onUpdateWatch extends Quest  

Quest Property lope_PetVisit  Auto  


function registerForVisit()
    ; debug.messagebox("registerForVisit")
    if isRegisteredForVisit.getValueInt() == 0 && lope_PetVisit.IsStopped()
        ; debug.messagebox("registerForVisit If got TRUE")
        registerForSingleUpdateGameTime(24.0)
        IsRegisteredForVisit.setValue(1)
    endif
endfunction


event OnUpdateGameTime()
    if lope_PetVisit.IsStopped() && isRegisteredForVisit.getValueInt() == 1
        lope_PetVisit.setstage(0)
        isRegisteredForVisit.setValue(0)
    endif
endevent


Quest Property lope_Radiant0  Auto  

GlobalVariable Property IsRegisteredForVisit  Auto  
