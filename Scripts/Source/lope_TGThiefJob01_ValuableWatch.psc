Scriptname lope_TGThiefJob01_ValuableWatch extends ReferenceAlias  


Event OnActivate(ObjectReference akActionRef)
    self.getOwningQuest().setStage(100)
EndEvent


; Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
;     if akOldContainer && !akNewContainer
;         ; Debug.Trace("We have been dropped!")
;     elseif akNewContainer && !akOldContainer
;         ; Debug.Trace("We have been picked up!")
;     else
;         Debug.messagebox("OnContainerChanged: player's gold " + game.getplayer().GetGoldAmount())
;         self.GetOwningQuest().setStage(500)
;     endIf
; endEvent