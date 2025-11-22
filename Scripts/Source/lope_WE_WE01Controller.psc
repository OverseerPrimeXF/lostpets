Scriptname lope_WE_WE01Controller extends Quest  


Event OnInit()
    RegisterForModEvent("WE01Wolf1_End", "WE01Wolf1SexEnded")
    RegisterForModEvent("WE01Wolf2_End", "WE01Wolf2SexEnded")
endEvent


Event WE01Wolf1SexEnded(Form FormRef, int tid)
    ; Debug.MessageBox("FormRef " + FormRef + " WE01Wolf1SexEnded")
    if getStage() == 50
        ; utility.wait(1)
        SexLab.QuickStart(wolf2.getActorReference(), game.getPlayer())
    elseif getStage() == 75
        setStage(150)
    elseif getStage() == 100
        
    endIf
EndEvent

Event WE01Wolf2SexEnded(Form FormRef, int tid)
    ; Debug.MessageBox("FormRef " + FormRef + " WE01Wolf2SexEnded")
EndEvent


ReferenceAlias Property Wolf1 Auto
ReferenceAlias Property Wolf2 Auto

Sexlabframework Property SexLab Auto