;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lope_SF_lope_LostPetsRadiant__050B4571 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getowningquest().setstage(999)
;getowningquest().stop()
getowningquest().CompleteQuest()
lope_start.setstage(1000)
lope_start.stop()
; lope_start.setstage(0)
updateWatch.registerForRadiant()
overseer.registerForVisit()  ; it's me!
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lope_onUpdateVisit Property overseer  Auto  

Quest Property lope_start  Auto  

lope_onUpdateRadiant Property updateWatch  Auto  
