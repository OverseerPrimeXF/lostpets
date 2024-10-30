Scriptname lope_DogArena_VisitorsConditions extends Quest  Conditional


Int Property isRadiantFightRunning = 0 Auto  Conditional

Int Property visitor01OnArena = 0 Auto  Conditional
Int Property visitor02OnArena = 0 Auto  Conditional
Int Property visitor03OnArena = 0 Auto  Conditional
Int Property visitor04OnArena = 0 Auto  Conditional
Int Property visitor05OnArena = 0 Auto  Conditional
Int Property visitor06OnArena = 0 Auto  Conditional
Int Property visitor07OnArena = 0 Auto  Conditional
Int Property visitor08OnArena = 0 Auto  Conditional


Function setIntValue(Int value)
    ; code
EndFunction

Int Function getIntValue()
    return -1
EndFunction

Function setInt(String propertyName, Int value)
    GoToState(propertyName)
    setIntValue(value)
EndFunction

Int Function getInt(String propertyName)
    GoToState(propertyName)
    return getIntValue()
EndFunction

State visitor01
    Function setIntValue(Int value)
        visitor01OnArena = value
    EndFunction
    
    Int Function getIntValue()
        return visitor01OnArena
    EndFunction
endState

State visitor02
    Function setIntValue(Int value)
        visitor02OnArena = value
    EndFunction
    
    Int Function getIntValue()
        return visitor02OnArena
    EndFunction
endState

State visitor03
    Function setIntValue(Int value)
        visitor03OnArena = value
    EndFunction
    
    Int Function getIntValue()
        return visitor03OnArena
    EndFunction
endState

State visitor04
    Function setIntValue(Int value)
        visitor04OnArena = value
    EndFunction
    
    Int Function getIntValue()
        return visitor04OnArena
    EndFunction
endState

State visitor05
    Function setIntValue(Int value)
        visitor05OnArena = value
    EndFunction
    
    Int Function getIntValue()
        return visitor05OnArena
    EndFunction
endState

State visitor06
    Function setIntValue(Int value)
        visitor06OnArena = value
    EndFunction
    
    Int Function getIntValue()
        return visitor06OnArena
    EndFunction
endState

State visitor07
    Function setIntValue(Int value)
        visitor07OnArena = value
    EndFunction
    
    Int Function getIntValue()
        return visitor07OnArena
    EndFunction
endState

State visitor08
    Function setIntValue(Int value)
        visitor08OnArena = value
    EndFunction
    
    Int Function getIntValue()
        return visitor08OnArena
    EndFunction
endState
