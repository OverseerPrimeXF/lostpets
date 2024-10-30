Scriptname lope_DogArenaStart extends Quest  


event OnUpdateGameTime()
    if getStage() == 1
        setStage(10)
    ; elseif getStage() == 61
    ;     setStage(65)
    elseif getStage() == 80 || getStage() == 85
        setStage(200)
    endif
endevent


Function registerForProgression(float game_time)
    registerForSingleUpdateGameTime(game_time)
EndFunction
