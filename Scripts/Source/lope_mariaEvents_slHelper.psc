Scriptname lope_mariaEvents_slHelper extends Quest  


Function beginScene(Actor human1=None, Actor human2=None, Actor human3=None, Actor human4=None,\
                    bool playerGoesFirst=False, string tags = "None", String tagsExcluded = "", string animName="None")
    sl.sceneOffset = func.getOffsetArray(Bed.GetRef(), "bed")
    sl.humanSexPlayer1NPC(\
        human=human1, human2=human2, human3=human3, human4=human4, \
        playerGoesFirst=playerGoesFirst, tags=tags, tagsExcluded=tagsExcluded,\
        actionOnEnd="playscene,lope_MariaEvents_afterKissingSit")
    (Bed.getOwningQuest() as lope_mariaEvents_states).hadSexWithMaria += 1
EndFunction


lope_sl Property sl  Auto  

lope_functions Property func  Auto  

ReferenceAlias Property Bed  Auto  
