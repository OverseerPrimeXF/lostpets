Scriptname lope_dbg_playerWatcher extends ReferenceAlias  

import Game
import PO3_SKSEFunctions

;/
Event OnKeyDown(Int KeyCode)
     if KeyCode == 42
        ObjectReference crosshair = GetCurrentCrosshairRef()
        FormList benches = GetFormFromEditorID("lope_allBenchesF") as formList
        If (crosshair || benches.Find(crosshair) != -1)
            string text = (\
                "It's " + getFormEditorID(crosshair.GetBaseObject()) + " of type "+ crosshair.GetBaseObject().GetType() +" with coordinates\n" + \
                "X:"+ crosshair.X + " Y: " + crosshair.Y + " Z: "+ crosshair.Z + "\n" + \
                "Angles\nX: " + crosshair.GetAngleX() + " Y: "+ crosshair.GetAngleY() + " Z: "+ crosshair.GetAngleZ() + " "\
            )
            Utility.Wait(0.1)
            string[] buttons = new string[2]
            buttons[0] = "yes"
            buttons[1] = "no"
            String result = lope_SkyMessage.ShowArray(text+"\nmove player to front of this?", buttons)
            If (result == "yes")
                GetPlayer().SetPosition(\
                    crosshair.X + -41.0 * Math.Sin(crosshair.GetAngleZ()),\
                    crosshair.Y + -41.0 * Math.Cos(crosshair.GetAngleZ()),\
                    crosshair.Z)
                GetPlayer().SetAngle(0, 0, crosshair.GetAngleZ() + 180)
            EndIf
        EndIf
        
        ; Actor akActor = game.GetCurrentCrosshairRef() as Actor
        ; debug.messagebox(akActor)
        ; debug.sendanimationevent(akActor, "IdleBarCounterWipe")
    endif
EndEvent

function Initialize()
    ; RegisterForModEvent("AnimationStart", "OnSexLabAnimationStart")
    RegisterForKey(KeyCode=42)
endFunction


event onInit()
    Initialize()
endEvent


Event OnPlayerLoadGame()
    Initialize()
endEvent
/;

;Event OnSexLabAnimationStart(string EventName, string argString, Float argNum, form sender)
;    debug.messageBox(argString)
;endEvent


; Event OnLocationChange(Location akOldLoc, Location akNewLoc)
;    debug.MessageBox(PO3_SKSEFunctions.GetFormEditorID(self.GetOwningQuest()))
; endEvent


; Event OnKeyDown(Int KeyCode)
;     ; Debug.Trace("A registered key has been pressed")
;     If KeyCode == 42
;         Actor actorInCrosshair = Game.GetCurrentCrosshairRef() as Actor
;         Debug.Notification("This is " + actorInCrosshair.getActorBase().GetName())
;         lope_nativeFunctions.MakeActorShutup(actorInCrosshair)
;     EndIf
; EndEvent


lope_functions property func Auto
