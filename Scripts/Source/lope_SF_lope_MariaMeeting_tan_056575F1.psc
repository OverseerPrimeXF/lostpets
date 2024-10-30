;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_SF_lope_MariaMeeting_tan_056575F1 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if (getOwningQuest() as lope_mariaConditions).playerTookMariasTankard == 1
    (getOwningQuest() as lope_mariaConditions).playerKeepingTankard = 1
    mw.registerForTankardRetrieve()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_mariaWatch Property MW  Auto  
