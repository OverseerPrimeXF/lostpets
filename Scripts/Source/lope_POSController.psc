Scriptname lope_POSController extends Quest  


Function registerForNextPOS()
    RegisterForSingleUpdateGameTime(Storage.nextPOS)
    Storage.isRegisteredForNextPOS = True
    stop()
EndFunction


lope_storageContainer Property Storage Auto
