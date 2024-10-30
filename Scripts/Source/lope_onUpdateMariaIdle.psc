Scriptname lope_onUpdateMariaIdle extends ReferenceAlias  



event OnUpdateGameTime()
    conditions.iMariaCanIdleChat = 1
endevent


Function registerForMariaIdleChat(float cooldown)
    conditions.iMariaCanIdleChat = 0
    RegisterForSingleUpdateGameTime(cooldown)
EndFunction


lope_conditionsContainer Property conditions Auto