Scriptname lope_functions extends Quest  
{Randon functions we could need.}

Import Utility
Import Math


; Returns randon X coordinate in range relatively actor
Float function getRandRelX(Actor RelativeTo, Float minDist, Float maxDist, Bool isBehind = True)
    If isBehind
        return -1 * RandomFloat(minDist, maxDist)*Sin(RelativeTo.GetAngleZ())
    Endif
    return RandomFloat(minDist, maxDist)*Sin(RelativeTo.GetAngleZ())
endfunction


; Returns randon Y coordinate in range relatively actor
Float function getRandRelY(Actor RelativeTo, Float minDist, Float maxDist, Bool isBehind = True)
    If isBehind
        return -1 * RandomFloat(minDist, maxDist)*Cos(RelativeTo.GetAngleZ())
    Endif
    return RandomFloat(minDist, maxDist)*Cos(RelativeTo.GetAngleZ())
endfunction


; Moves Target Actor relatively to RelativeTo Actor in random position behind it.
function MoveActorToRandomPosBehind(Actor Target, Actor RelativeTo, Float minDist=1.0, Float maxDist=1.0)
    Target.MoveTo(RelativeTo,\
                               getRandRelX(RelativeTo, minDist, maxDist),\
                               getRandRelY(RelativeTo, minDist, maxDist)\
    )
endfunction


Actor Property PlayerRef  Auto  
