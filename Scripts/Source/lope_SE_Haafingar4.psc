Scriptname lope_SE_Haafingar4 extends Quest  


Event OnUpdateGameTime()
    If (getStage() == 2)
        (WICourier as WICourierScript).addAliasToContainer(NoteFromElisif)
        SetStage(5)
    EndIf
EndEvent


Function registerForNHours(float time)
    RegisterForSingleUpdateGameTime(time)
    SetStage(2)
EndFunction


ReferenceAlias Property NoteFromElisif  Auto
ReferenceAlias Property Elisif  Auto
Quest Property WICourier  Auto  
