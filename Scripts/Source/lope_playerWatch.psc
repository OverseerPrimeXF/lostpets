Scriptname lope_playerWatch extends ReferenceAlias  

event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    ; debug.messagebox(akBaseItem + " | " + aiItemCount  + " | " + akItemReference  + " | " + akDestContainer)
    if akBaseItem == Gold001  && aiItemCount == 10 && self.getRef().getCurrentLocation().hasKeyword(InnKWD)
        ; Holy crap, that [\/] worked
        ObjectReference bed = (Innkeeper.getRef() as RentRoomScript).bed
        TavernBed.forceRefTo(bed)
        ; Debug.messagebox(TavernBed.getRef())
        if PetVisit.IsObjectiveDisplayed(50)
            PetVisit .setObjectiveCompleted(50)
            ; To be able to fire it again
            PetVisit .setObjectiveCompleted(50, False)
        endif
    endif
endevent


MiscObject Property Gold001  Auto  

Quest Property PetVisit  Auto  

Keyword Property InnKWD  Auto  

ReferenceAlias Property TavernBed  Auto  

ReferenceAlias Property Innkeeper  Auto  
