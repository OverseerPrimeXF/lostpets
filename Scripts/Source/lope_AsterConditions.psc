Scriptname lope_AsterConditions extends Quest  Conditional


; Arcanaeum conditions ======================================

Int Property iAsterTurnedPage = 0 Auto  Conditional
Int Property iAsterTurnedManyPages = 0 Auto  Conditional
Int Property iAsterSitting = 1 Auto  Conditional


; Midden conditions =========================================

; -1 - no cast / end of training
; 1 - Familiar         | ConjureFamiliar
; 2 - Flaming Familiar | dunHighGateSummonFlamingThrall
; 3 - Flame Atronach   | ConjureFlameAtronach
; 4 - Frost Atronach   | ConjureFrostAtronach
; 5 - Dremora          | ConjureDremoraLord
Int Property iAsterCastedSpell = -1 Auto  Conditional

Int Property iAsterDetectedPlayer = 0 Auto  Conditional
Int Property iAsterDetectedSaidNoticeLine = 0 Auto  Conditional
Int Property iAsterDetectedPlayerInScene = 0 Auto  Conditional
Int Property iAsterDetectedPlayerOnce = 0 Auto  Conditional
Int Property iAsterDoSandboxInMidden = 1 Auto  Conditional


; Non conditions ============================================

Actor Property Player Auto
Actor Property akAster Auto
Actor Property akFamiliar Auto
