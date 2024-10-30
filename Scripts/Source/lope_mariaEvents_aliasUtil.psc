Scriptname lope_mariaEvents_aliasUtil extends Quest  


function fillAliases()
    utilityQuest.setStage(0)
    Utility.Wait(0.5)
    if aliasFurniture1Ext.getRef()
        aliasFurniture.forceRefTo(aliasFurniture1Ext.getRef())
    elseif aliasFurniture2Ext.getRef()
        aliasFurniture.forceRefTo(aliasFurniture2Ext.getRef())
    endif
    aliasCenterMarker.forceRefTo(aliasCenterMarkerExt.getRef())
    aliasInnkeeper.forceRefTo(aliasInnkeeperExt.getRef())
    utilityQuest.stop()
endfunction


function fillDoubleBedFurnitureAlias()
    utilityQuest.setStage(0)
    Utility.Wait(0.5)
    aliasFurniture.forceRefTo(aliasFurniture1Ext.getRef())
    utilityQuest.stop()
endfunction

Quest Property utilityQuest  Auto  

ReferenceAlias Property aliasFurniture  Auto  
ReferenceAlias Property aliasCenterMarker  Auto  
ReferenceAlias Property aliasInnkeeper  Auto 

ReferenceAlias Property aliasFurniture1Ext  Auto  
ReferenceAlias Property aliasFurniture2Ext  Auto  
ReferenceAlias Property aliasCenterMarkerExt  Auto  
ReferenceAlias Property aliasInnkeeperExt  Auto  