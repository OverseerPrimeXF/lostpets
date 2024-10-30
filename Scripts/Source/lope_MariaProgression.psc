Scriptname lope_MariaProgression extends Quest  

import Debug
import PO3_SKSEFunctions


event OnUpdateGameTime()
        ; hoursBetweenEvents+"\n"+\
        ; ((totalHoursWithMaria as int) / hoursBetweenEvents)+"\n"+\
        ; (totalEventsCount + 1)+"\n"+\
        ; ((totalHoursWithMaria as int) / hoursBetweenEvents)==(totalEventsCount + 1)\
        ; )
    if Maria.GetActorRef().IsInFaction(storage.CurrentFollowerFaction())
        HourPassedWithMaria()
        triggerEventWithMaria()
        registerForTimeWithMaria()
        ; MessageBox("Hours with Maria: "+totalHoursWithMaria)
    endif
    ; int divided = ((totalHoursWithMaria as Int)/hoursBetweenEvents)
    ; bool isTime = divided==totalEventsCount
    ; MessageBox(\
    ;     (totalHoursWithMaria as Int)+"\n"+totalEventsCount+"\n"+isTime as String)
endevent


Function registerForTimeWithMaria()
    ; MessageBox("Registered For Time With Maria")
    ; MessageBox(PO3_SKSEFunctions.GetFormEditorID(storage.CurrentFollowerFaction()))
    RegisterForSingleUpdateGameTime(0.1)
EndFunction


Function HourPassedWithMaria()
    ; MessageBox("total waited: "+gameTimeMariaTotalWaited * 24)
    If (Maria.GetActorRef().IsInFaction(storage.CurrentFollowerFaction()) && \
        Maria.GetActorRef().GetActorValue("WaitingForPlayer") == 0)
        ; totalHoursWithMaria += 1
        totalHoursWithMaria = (getTimeFromRecruitment() * 24)
        ; gameTimeMariaTotalWaited = 0
        ; MessageBox(totalHoursWithMaria)
    EndIf
EndFunction


Function triggerEventWithMaria()
    ; fixit triggering even if waiting %24 but at the same total time.
    if !eventTriggered && (((totalHoursWithMaria as Int)/hoursBetweenEvents) == (totalEventsCount+1))
        eventTriggered = True
        totalEventsCount += 1
        conditions.iMariaEventStageToWrite = totalEventsCount
        mariaEventsQuestStage = (totalEventsCount * 100) - 99
        MiscUtil.PrintConsole("[Lost Pets] Event with Maria triggered! Stage: " + mariaEventsQuestStage)
        (GetFormFromEditorID("lope_MariaEvents") as Quest).SetStage(mariaEventsQuestStage)
    endif
EndFunction


; Set time of recruitment.
Function setTimeRecruited()
    gameTimeMariaRecruited = (Utility.GetCurrentGameTime() - (totalHoursWithMaria / 24))
EndFunction


; Sets time then waiting began.
Function setTimeStartedToWait()
    gameTimeMariaStartedToWait = Utility.GetCurrentGameTime()
EndFunction


; Get total game time spent from recruit to dismiss.
float Function getTimeFromRecruitment()
    return Utility.GetCurrentGameTime() - (gameTimeMariaRecruited + gameTimeMariaTotalWaited)
EndFunction


; Add time to waited period to not count it as travelling together.
float Function getTimeStoppedWaiting()
    gameTimeMariaTotalWaited += (Utility.GetCurrentGameTime() - gameTimeMariaStartedToWait)
EndFunction


int mariaEventsQuestStage


bool Property eventTriggered = False Auto Hidden
int Property totalEventsCount = 0 Auto Hidden
float Property totalHoursWithMaria = 0.0 Auto Hidden
float Property gameTimeMariaRecruited Auto Hidden
float Property gameTimeMariaStartedToWait Auto Hidden
float Property gameTimeMariaTotalWaited Auto Hidden

ReferenceAlias Property Maria Auto

lope_functions Property func Auto
lope_storageContainer Property storage Auto
lope_conditionsContainer Property conditions Auto

int Property hoursBetweenEvents = 24 AutoReadOnly Hidden