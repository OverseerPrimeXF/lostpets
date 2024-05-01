Scriptname lope_OnActivetePetWatch extends ReferenceAlias  


event OnActivate(ObjectReference akActionRef)
    if PetVisit.getStage() >= 10 && PetVisit.getStage() < 200
        ; PetVisit.setWalkedTime()
    endif
endevent


lope_PetVisitScript Property PetVisit  Auto  
