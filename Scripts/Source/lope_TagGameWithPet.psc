Scriptname lope_TagGameWithPet extends ObjectReference  

Import Debug

int Property gameTime Auto Hidden
ReferenceAlias Property PetCatcher  Auto  
ReferenceAlias Property PetRunaway  Auto  
ObjectReference Property PlayerRef  Auto 


event OnUpdate()
    if PetCatcher && PetCatcher.getRef().getDistance(PlayerREF) <= 50
        messagebox("Pet catched your ass")
        PetRunaway.forceRefTo(PetCatcher.getRef())
        PetCatcher.clear()
    elseif gameTime >= 120
        PetRunaway.forceRefTo(PetCatcher.getRef())
        PetCatcher.clear()
    else
        gameTime += 1
        register(1.0)
    endif
endevent


function register(float time)
    registerForSingleUpdate(time)
endfunction 
 
