Scriptname lope_WaitOMatic extends Quest  


event OnUpdateGameTime()
    debug.notification("wait'O'Matic ticked")
endevent


function registerForWaiting(float time)
    registerForSingleUpdateGameTime(time)
endfunction