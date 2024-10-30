Scriptname lope_waitor1 extends ReferenceAlias


event OnUpdateGameTime()
    debug.notification("waitor1 ticked")
endevent


function registerForWaiting(float time)
    debug.messagebox("registered waitor")
    registerForSingleUpdateGameTime(time)
endfunction