Scriptname lope_DogArenaRadiantFightConditions extends Quest  Conditional


Int Property startVariant  Auto  Conditional

Int Property sexVariant  Auto  Conditional

; WMw - Winner Mated with

Int Property WMwLosersMaster  Auto  Conditional

Int Property WMwRandomFemVisitor  Auto  Conditional

Int Property SceneAfterMatingVariant  Auto  Conditional

Function resetAllConditions()
    startVariant = 0
    sexVariant = 0
    WMwLosersMaster = 0
    WMwRandomFemVisitor = 0
    SceneAfterMatingVariant = 0
endFunction 
 
