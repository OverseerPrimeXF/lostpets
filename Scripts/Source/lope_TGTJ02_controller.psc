Scriptname lope_TGTJ02_controller extends Quest  


Int Function getLeveledGold(Int amount)
    return amount * (1.0 + (PlayerREF.GetLevel() as Float) / 100.0) as int
EndFunction


Function PlaceGold(ObjectReference where, int min = 250, int max = 750)
    goldAmount = Utility.RandomInt(getLeveledGold(min), getLeveledGold(max))
    where.AddItem(Gold001, goldAmount)
EndFunction


MiscObject Property Gold001  Auto  

Actor Property PlayerREF Auto

Int Property goldAmount Auto
