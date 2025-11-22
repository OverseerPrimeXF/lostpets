Scriptname lope_randomScenes01Controller extends Quest  Conditional

event onInit()
    makeDogFriendly()
endEvent

event OnPlayerLoadGame()
    makeDogFriendly()
endEvent

function makeDogFriendly()
    BanditDog.getActorReference().SetActorValue("Aggression", 0)
endFunction

ReferenceAlias Property BanditDog  Auto  

Int Property dogRapedPlayer = 0  Auto  Conditional
Int Property dogWasRenamed = 0  Auto  Conditional
Int Property dogCurrentName = -1  Auto  Conditional
