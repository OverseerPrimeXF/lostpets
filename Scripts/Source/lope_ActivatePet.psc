Scriptname lope_ActivatePet extends ReferenceAlias  


event OnActivate(ObjectReference akActionRef)
    ; debug.messagebox("You catched Pet")
    self.getRef().say(PlayerCatchedPetTopic)
    ; Tags.increasePlayerScore()
    ; Tags.swapRoles()
    ; Tags.increaseGameRounds()
    Tags.SetPlayerActivatedPet(True)
    ; Tags.SetPlayerCatchingPet(False)
endevent


lope_TagsGameWithPet Property Tags  Auto  

Topic Property PlayerCatchedPetTopic  Auto  
