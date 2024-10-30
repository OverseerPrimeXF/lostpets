Scriptname lope_SecludedAreaScript extends activemagiceffect  

Actor Target
Actor[] Property NewTarget Auto

;/

event OnEffectStart(Actor TargetRef, Actor CasterRef)
        ; Debug.Messagebox("Magic effect was started on " + TargetRef)
    ; Target = TargetRef
    ;If Target && Target.IsEnabled() && !Target .IsDead() && Storage.actorsWithPackages.Find(Target) < 
    If Storage.actorsWithPackages.Find(TargetRef) < 0
        NewTarget = PapyrusUtil.PushActor(NewTarget, TargetRef)
        ActorUtil.AddPackageOverride(TargetRef , keepDistancePCKG, 65, 1)
        TargetRef.EvaluatePackage()
        Storage.actorsWithPackages = PapyrusUtil.MergeActorArray(\
            Storage.actorsWithPackages, NewTarget, True)
        MiscUtil.PrintConsole(Storage.actorsWithPackages+" | "+Storage.actorsWithPackages.Length)
    endIf
endEvent


event OnEffectFinish(Actor TargetRef, Actor CasterRef)
    ; Debug.Messagebox("Magic effect was ended!")
    ; SET CHECK FOR SL ANIM ENDED
    If Storage.actorsWithPackages.Length > 0 && !caster.GetActorRef().IsWeaponDrawn()
        int index = 0
        While (index < Storage.actorsWithPackages.Length)
            ActorUtil.RemovePackageOverride(Storage.actorsWithPackages[index], keepDistancePCKG)
            Storage.actorsWithPackages[index].EvaluatePackage()
            index += 1
        EndWhile
        Actor[] emptyArray = new Actor[1]
        Storage.actorsWithPackages = emptyArray
        MiscUtil.PrintConsole(Storage.actorsWithPackages)
    elseIf caster.GetActorRef().IsWeaponDrawn()
        thisSpell.Cast(CasterRef, CasterRef)
    endIf
endEvent

/;

Package Property keepDistancePCKG  Auto  

ReferenceAlias Property caster  Auto  

SPELL Property thisSpell  Auto  

lope_storageContainer Property Storage  Auto  