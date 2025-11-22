Scriptname lope_RGK_controller extends Quest  Conditional


function playScene(Scene sceneToPlay)
    sceneToPlay.start()
endFunction

function placeItem(objectReference where, form what, int count)
    where.addItem(what, count)
endFunction

Int Property RubyWasInitially = 0 Auto  Conditional

Int Property potionBought = 0 Auto  Conditional

Int Property meatBought = 0 Auto  Conditional

Int Property daysToWait Auto

Int Property dog1NeedsMating = 1 Auto  Conditional

Int Property dog2NeedsMating = 1 Auto  Conditional
