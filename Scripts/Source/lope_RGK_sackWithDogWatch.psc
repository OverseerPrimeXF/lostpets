Scriptname lope_RGK_sackWithDogWatch extends ReferenceAlias  

Event OnEquipped(Actor akActor)
    if akActor == Game.GetPlayer() && self.GetOwningQuest().GetStage() == 400        
        self.getReference().BlockActivation(true)
        UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "InventoryMenu")
        UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "TweenMenu")
        PlayerREF.dropObject(self.getReference().GetBaseObject())
       
        ;/
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "BarterMenu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Book Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Console")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Console Native UI Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "ContainerMenu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Crafting Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Credits Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Cursor Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Debug Text Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Dialogue Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Fader Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "FavoritesMenu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "GiftMenu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "HUD Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Journal Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Kinect Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "LevelUp Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Loading Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Lockpicking Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "MagicMenu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Main Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "MapMenu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "MessageBoxMenu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Mist Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Overlay Interaction Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Overlay Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Quantity Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "RaceSex Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Sleep/Wait Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "StatsMenu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "TitleSequence Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Top Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Training Menu")
        ; UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "Tutorial Menu")
        ; debug.messageBox("dropped alias: " + self.getName())
        ; debug.MessageBox("BarterMenu: "+UI.IsMenuOpen("BarterMenu"))
        ; debug.MessageBox("Book Menu: "+UI.IsMenuOpen("Book Menu"))
        ; debug.MessageBox("Console: "+UI.IsMenuOpen("Console"))
        ; debug.MessageBox("Console Native UI Menu: "+UI.IsMenuOpen("Console Native UI Menu"))
        ; debug.MessageBox("ContainerMenu: "+UI.IsMenuOpen("ContainerMenu"))
        ; debug.MessageBox("Crafting Menu: "+UI.IsMenuOpen("Crafting Menu"))
        ; debug.MessageBox("Credits Menu: "+UI.IsMenuOpen("Credits Menu"))
        ; debug.MessageBox("Cursor Menu: "+UI.IsMenuOpen("Cursor Menu"))
        ; debug.MessageBox("Debug Text Menu: "+UI.IsMenuOpen("Debug Text Menu"))
        ; debug.MessageBox("Dialogue Menu: "+UI.IsMenuOpen("Dialogue Menu"))
        ; debug.MessageBox("Fader Menu: "+UI.IsMenuOpen("Fader Menu"))
        ; debug.MessageBox("FavoritesMenu: "+UI.IsMenuOpen("FavoritesMenu"))
        ; debug.MessageBox("GiftMenu: "+UI.IsMenuOpen("GiftMenu"))
        ; debug.MessageBox("HUD Menu: "+UI.IsMenuOpen("HUD Menu"))
        ; debug.MessageBox("InventoryMenu: "+UI.IsMenuOpen("InventoryMenu"))
        ; debug.MessageBox("Journal Menu: "+UI.IsMenuOpen("Journal Menu"))
        ; debug.MessageBox("Kinect Menu: "+UI.IsMenuOpen("Kinect Menu"))
        ; debug.MessageBox("LevelUp Menu: "+UI.IsMenuOpen("LevelUp Menu"))
        ; debug.MessageBox("Loading Menu: "+UI.IsMenuOpen("Loading Menu"))
        ; debug.MessageBox("Lockpicking Menu: "+UI.IsMenuOpen("Lockpicking Menu"))
        ; debug.MessageBox("MagicMenu: "+UI.IsMenuOpen("MagicMenu"))
        ; debug.MessageBox("Main Menu: "+UI.IsMenuOpen("Main Menu"))
        ; debug.MessageBox("MapMenu: "+UI.IsMenuOpen("MapMenu"))
        ; debug.MessageBox("MessageBoxMenu: "+UI.IsMenuOpen("MessageBoxMenu"))
        ; debug.MessageBox("Mist Menu: "+UI.IsMenuOpen("Mist Menu"))
        ; debug.MessageBox("Overlay Interaction Menu: "+UI.IsMenuOpen("Overlay Interaction Menu"))
        ; debug.MessageBox("Overlay Menu: "+UI.IsMenuOpen("Overlay Menu"))
        ; debug.MessageBox("Quantity Menu: "+UI.IsMenuOpen("Quantity Menu"))
        ; debug.MessageBox("RaceSex Menu: "+UI.IsMenuOpen("RaceSex Menu"))
        ; debug.MessageBox("Sleep/Wait Menu: "+UI.IsMenuOpen("Sleep/Wait Menu"))
        ; debug.MessageBox("StatsMenu: "+UI.IsMenuOpen("StatsMenu"))
        ; debug.MessageBox("TitleSequence Menu: "+UI.IsMenuOpen("TitleSequence Menu"))
        ; debug.MessageBox("Top Menu: "+UI.IsMenuOpen("Top Menu"))
        ; debug.MessageBox("Training Menu: "+UI.IsMenuOpen("Training Menu"))
        ; debug.MessageBox("Tutorial Menu: "+UI.IsMenuOpen("Tutorial Menu"))
        ; debug.MessageBox("TweenMenu: "+UI.IsMenuOpen("TweenMenu"))
        /;
    endIf
endEvent


Event OnActivate(ObjectReference akActionRef)
    If (getowningQuest().GetStage() == 400)        
        If (lope_RGK_releaseDog.Show() == 0)
            dog.TryToMoveTo(self.GetReference())
            self.TryToDisable()
            dog.TryToEnable()
        else
            PlayerREF.AddItem(self.GetReference())
            debug.Notification("Sack picked up")
        EndIf
    EndIf
EndEvent


Actor Property PlayerREF Auto

Message Property lope_RGK_releaseDog  Auto  

ReferenceAlias Property Dog  Auto  
