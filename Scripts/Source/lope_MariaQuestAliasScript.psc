Scriptname lope_MariaQuestAliasScript extends ReferenceAlias  

Faction Property CurrentHireling Auto
Message Property FollowerDismissMessage  Auto
Actor Property PlayerREF Auto

 
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
     If (akTarget == PlayerREF)
          debug.messagebox("akTarget==PlayerREF TRUE, da fuck?")
          (GetOwningQuest() as lope_MariaFollower).DismissFollower(0, 0)
     EndIf
EndEvent
 

Event OnDeath(Actor akKiller)
     Self.GetActorRef().RemoveFromFaction(CurrentHireling)
     Self.Clear()
EndEvent