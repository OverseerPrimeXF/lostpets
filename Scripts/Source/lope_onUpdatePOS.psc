Scriptname lope_onUpdatePOS extends ReferenceAlias  

Import PO3_SKSEFunctions


event OnUpdateGameTime()
    if storage.isRegisteredForNextPOS
        (GetFormFromEditorID("lope_PetsOwnersScenes") as Quest).SetStage(0)
        Storage.isRegisteredForNextPOS = False
    endif
endevent


lope_storageContainer Property Storage Auto