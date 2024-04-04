Scriptname lope_playerWatch extends ReferenceAlias  

event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    ; debug.messagebox(akBaseItem + " | " + aiItemCount  + " | " + akItemReference  + " | " + akDestContainer)
    if akBaseItem == Gold001  && aiItemCount == 10 && PetVisit.IsObjectiveDisplayed(50)
        PetVisit .setObjectiveCompleted(50)
        ; To be able to fire it again
        PetVisit .setObjectiveCompleted(50, False)
    endif
endevent


MiscObject Property Gold001  Auto  

Quest Property PetVisit  Auto  
