Scriptname lope_advancedHavokActivate extends ObjectReference  
{Enables Havok on other object if current activated.}

bool property havokOnHit = TRUE auto
{Start Havok Sim when hit? DEFAULT: TRUE}
bool property havokOnActivate auto
{Start Havok Sim when activated? DEFAULT: FALSE}
bool property havokOnZKey auto
{Start Havok Sim when grabbed by player? DEFAULT: FALSE}
keyword property linkHavokPartner auto
{Link with this keyword and that ref will also sim with myself}
bool property beenSimmed auto hidden
{prevent an object that has been havok'd in-game from going static}

ObjectReference property linkedObject Auto
{Object what need to havok enabled.}

EVENT onActivate(ObjectReference triggerRef)
	if havokonActivate == TRUE && beenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

EVENT onHit(ObjectReference var1, Form var2, Projectile var3, bool var4, bool var5, bool var6, bool var7)
	if havokOnHit == TRUE && beenSimmed == FALSE 
		ReleaseToHavok()
	endif
endEVENT

EVENT onGrab()
	if havokOnZkey == TRUE && beenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

FUNCTION ReleaseToHavok()
    if linkedObject
        linkedObject.setMotionType(Motion_Dynamic, TRUE)
        linkedObject.ApplyHavokImpulse(0, 0, 1, 5)
    endIf
endFUNCTION

