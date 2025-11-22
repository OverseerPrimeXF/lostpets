Scriptname lope_RGK_dog1Watch extends ReferenceAlias


Event OnUpdateGameTime()
    if dogNumber == 1
        ctr.dog1NeedsMating = 1
    elseIf dogNumber == 2
        ctr.dog2NeedsMating = 1
    endIf
EndEvent


Function registerForMating(float time)
    registerForSingleUpdateGameTime(time)
endFunction


Event OnActivate(ObjectReference akActionRef)
    If (getOwningQuest().getStage() == 275)
        ObjectReference sack = self.getReference().placeAtMe(dogSack)
        self.tryToDisable()
        sack.SetActorOwner(Player)
        sack.SetFactionOwner(PlayerFaction)
        sack.SetMotionType(1)
        SackWithDog.forceRefTo(sack)
    ElseIf ((getOwningQuest().getStage() == 410) && self.GetActorRef().GetActorValue("Paralysis") == 1)
        If (Utility.RandomInt(1, 100) >= 66)
            self.GetActorRef().SetActorValue("Paralysis", 0)
        EndIf
    EndIf
EndEvent


MiscObject Property dogSack  Auto  

MiscObject Property BasketClosed01  Auto  

ReferenceAlias Property SackWithDog  Auto  

ActorBase Property Player  Auto  

Faction Property PlayerFaction  Auto  

Int  Property dogNumber Auto

lope_RGK_controller Property ctr Auto
