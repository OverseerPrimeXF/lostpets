;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname lope_QF_lope_MariaEvents_alia_054C8D43 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SingleBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SingleBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChairAny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChairAny Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bedroll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bedroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChairFL
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChairFL Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DoubleBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DoubleBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Armchair
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Armchair Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;/
int i = 0
while i < 7
    if (GetAlias(i) as ReferenceAlias).getRef()
        SetObjectiveDisplayed(i+10)
    endif
i+=1
endwhile
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
