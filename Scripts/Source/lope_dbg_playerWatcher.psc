Scriptname lope_dbg_playerWatcher extends ReferenceAlias  

;/
function Initialize()
    RegisterForModEvent("AnimationStart", "OnSexLabAnimationStart")
endFunction


event onInit()
    Initialize()
endEvent


Event OnPlayerLoadGame()
    Initialize()
endEvent


Event OnSexLabAnimationStart(string EventName, string argString, Float argNum, form sender)
    debug.messageBox(argString)
endEvent
/;

; Event OnLocationChange(Location akOldLoc, Location akNewLoc)
;    debug.MessageBox(PO3_SKSEFunctions.GetFormEditorID(self.GetOwningQuest()))
; endEvent
