Scriptname lope_TagsGameWithPet extends Quest  

Import Debug


;false - Pet catching Player, True - Player catching Pet
Bool playerCatchingPet = False
Bool playerActivatedPet = False
Int petScore = 0
Int playerScore = 0
int gameTime = 0
Int gameRounds = 0
ReferenceAlias Property PetCatcher  Auto  
ReferenceAlias Property PetRunaway  Auto  
ObjectReference Property PlayerRef  Auto  
Topic Property PetCatchedPlayerTopic  Auto  
ReferenceAlias Property Pet  Auto  
ReferenceAlias Property PetFollower  Auto  
GlobalVariable Property isPlayingTagsGame  Auto  


; Fuck the DRY!
event OnUpdate()
    if !playerCatchingPet
        playerActivatedPet = False
        if PlayerREF.getDistance(PetCatcher.getRef()) <= 100 && gameRounds <= 5
            playerCatchingPet = True
            ; messagebox("Pet catched your ass")
            objectives(100, 101)
            gamerounds += 1
            gameTime = 0
            petScore += 1
            PetCatcher.getActorRef().say(PetCatchedPlayerTopic)
            PetRunaway.forceRefTo(PetCatcher.getRef())
            PetCatcher.clear()
            register(1)
            ;messagebox(PetCatcher.getRef())
        elseif gameRounds > 5
            PetCatcher.clear()
            PetRunaway.clear()
            ; PetFollower.ForceRefTo(Pet.GetRef())
            objectives(100, 101, true)
            if petScore > playerScore
                isPlayingTagsGame.setValue(2)
            elseif petScore == playerScore
                isPlayingTagsGame.setValue(4)
            else
                isPlayingTagsGame.setValue(3)
            endif
            playerCatchingPet = False
        elseif gameTime >= 30
            playerCatchingPet = True
            objectives(100, 101)
            gamerounds += 1
            gameTime = 0
            PetRunaway.forceRefTo(PetCatcher.getRef())
            ; PetRunaway.getActorRef().EvaluatePackage()
            PetCatcher.clear()
            register(1)
        else
            gameTime += 1
            register(0.5)
        endif
    else
        if playerActivatedPet && gameTime <= 30 && gameRounds <= 5
            ; messagebox("playerActivatedPet && gameTime <= 30 && gameRounds < 5")
            playerCatchingPet = False
            swapRoles()
            gamerounds += 1
            gameTime = 0
            playerScore += 1
            register(1)
        elseif gameTime > 30
            playerCatchingPet = False
            swapRoles()
            objectives(101, 100)
            gamerounds += 1
            gameTime = 0
            register(1)
        elseif gameRounds > 5
            PetCatcher.clear()
            PetRunaway.clear()
            ; PetFollower.ForceRefTo(Pet.GetRef())
            objectives(100, 101, true)
            if petScore > playerScore
                isPlayingTagsGame.setValue(2)
            elseif petScore == playerScore
                isPlayingTagsGame.setValue(4)
            else
                isPlayingTagsGame.setValue(3)
            endif
            playerCatchingPet = False
        else
            gameTime += 1
            register(0.5)
        endif
    endif
endevent


;First arg what to complete, second what to display
function objectives(Int comp, Int disp, bool Stop = false)
    if !Stop
        self.setobjectivecompleted(comp)
        self.setobjectivedisplayed(disp)
        self.setobjectivecompleted(comp, False)
    else
        self.setobjectivecompleted(comp)
        self.setobjectivecompleted(disp)
        self.setobjectivecompleted(comp, False)
        self.setobjectivecompleted(disp, False)
    endif
endfunction 


function register(float time)
    ;messagebox("registered for "+time)
    registerForSingleUpdate(time)
endfunction 


function swapRoles()
    objectives(101, 100)
    PetCatcher.forceRefTo(PetRunaway.getRef())
    ; PetCatcher.getActorRef().EvaluatePackage()
    PetRunaway.clear()
    register(2)
endfunction 


function resetTags()
    petScore = 0
    playerScore = 0
    gameTime = 0
    gameRounds = 0
    self.setobjectivecompleted(100, False)
    self.setobjectivecompleted(101, False)
endfunction

function increasePlayerScore()
    playerScore += 1
endfunction 


function SetPlayerCatchingPet(bool isCatching)
    playerCatchingPet = isCatching
endfunction 


function SetPlayerActivatedPet (bool isActivated)
    playerActivatedPet = isActivated
endfunction 


function increaseGamerounds()
    gameRounds += 1
endfunction 
