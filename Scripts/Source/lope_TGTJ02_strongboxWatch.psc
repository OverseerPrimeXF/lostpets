Scriptname lope_TGTJ02_strongboxWatch extends ReferenceAlias  


event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    ; debug.messagebox(akBaseItem + " | " + aiItemCount  + " | " + akItemReference  + " | " + akDestContainer)
    if akBaseItem == Gold001 && self.getOwningQuest().getStage() == 10
        self.getOwningQuest().setStage(100)
    endif
endevent


MiscObject Property Gold001  Auto  
