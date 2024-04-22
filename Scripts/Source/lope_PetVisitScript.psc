Scriptname lope_PetVisitScript extends Quest  

float timeStartWalk = 0.0
float timeEndingWalk = 0.0


float function getHours(Float time)
    return (time * 24)
endfunction


function setStartTime()
    timeStartWalk = Utility.GetCurrentGameTime()
endfunction


function setEndingTime()
    timeEndingWalk = Utility.GetCurrentGameTime()
endfunction


function setWalkedTime()
    setEndingTime()
    walkTime.setvalue(getHours(timeEndingWalk - timeStartWalk))
    ; Debug.messagebox("walkTime : "+walkTime.getValue())
endfunction


GlobalVariable Property walkTime  Auto  
