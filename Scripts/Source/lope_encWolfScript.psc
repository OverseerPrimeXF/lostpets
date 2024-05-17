Scriptname lope_encWolfScript extends Actor
{Script for hostile wolf for radiant Lost Pets quest.}


; Start attacking Player.
event onInit()
    self.StartCombat(PlayerREF as Actor)
endevent


; If hit not by player, kill instantly.
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile,\
    bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    ; debug.messagebox("Wolf enconter killed!")
    if akAggressor != PlayerREF
        self.kill()
    endif
endevent


; Track encounters death to reduce hostiles amount.
event OnDeath(Actor akKiller)
    func.decreaseHostilesCount()
endevent


ObjectReference Property PlayerREF Auto
lope_functions Property func  Auto  
