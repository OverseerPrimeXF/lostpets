Scriptname lope_RGK_urnWatch extends ReferenceAlias  


event OnLoad()
    if self.getOwningQuest().getStage() == 710
        self.getReference().addItem(gold001, goldCount)
        self.getOwningQuest().setStage(711)
    endif
endEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if akBaseItem == gold001 && self.getOwningQuest().getStage() == 711
        self.getOwningQuest().setStage(712)
    endif
endEvent


MiscObject Property Gold001  Auto  
Int Property goldCount  Auto  
