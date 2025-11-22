Scriptname lope_PlayerMovementWatcher extends ReferenceAlias  

Function RunChecks(Bool isRunning = False)
    ; debug.MessageBox("lope_PlayerMovementWatcher is running? " + isRunning)
    If (isRunning)
        GoToState("running")
        RegisterForPositionWatch()
    Else
        GoToState("")
    EndIf
EndFunction

Function RegisterForPositionWatch()
    setPrevSpeeds()
    RegisterForSingleUpdate(0.5)
EndFunction

Float Function getSpeed()
    return Math.sqrt(math.pow(prevPosX - PlayerREF.GetPositionX(), 2) + math.pow(prevPosY - PlayerREF.GetPositionY(), 2))
EndFunction

Bool Function isPlayerStopped()
    ; If (prevPosX ==  PlayerREF.GetPositionX() && \
    ;     prevPosY == PlayerREF.GetPositionY() && \
    ;     prevPosZ == PlayerREF.GetPositionZ())
    ;     return True
    ; EndIf
    ; debug.MessageBox(Math.abs(prevPosZ - PlayerREF.GetPositionZ()))
    If (Math.abs(prevPosZ - PlayerREF.GetPositionZ()) < 5)        
        return True
    EndIf
    return false
EndFunction

Function setPrevSpeeds()
    prevPosX = PlayerREF.GetPositionX()
    prevPosY = PlayerREF.GetPositionY()
    prevPosZ = PlayerREF.GetPositionZ()
EndFunction

Event OnUpdate()
    PlayerREF.SetActorValue("SpeedMult", 100)
EndEvent

State running
        ; Note: Parameterless state events are only supported in Skyrim.
    Event OnBeginState()
        ; code
    EndEvent
    Event OnEndState()
        ; code
    EndEvent

    Event OnUpdate()
        ; Debug.MessageBox(prevPosX + " " + prevPosY + " " + prevPosZ)
        ; debug.MessageBox(getSpeed())
        ; RegisterForPositionWatch()
        ; return
        If (getSpeed() < 10)
            ; debug.MessageBox("Player stopped!")
            PlayerREF.SetActorValue("SpeedMult", 400)
        Else
            ; debug.MessageBox("Player moving!")
            PlayerREF.SetActorValue("SpeedMult", 100)
        EndIf
        RegisterForPositionWatch()
EndEvent
EndState

float prevPosX = 0.0
float prevPosY = 0.0
float prevPosZ = 0.0

Actor Property PlayerREF Auto