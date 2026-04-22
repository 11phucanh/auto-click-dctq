#Requires AutoHotkey v2.0
#include JSON.ahk
#include menu.ahk
#include actions/all.ahk


running := false
currentSet := 1

myMenu := CreateMenu()

^Enter:: {
    global running
    running := true

    if (running) {
        Main()
    }
}

^`:: Stop()
^0:: Stop()

Main()
{
    global running, mapActions, currentSet


    myMenu.Show()

    while (running)
    {
        if (currentSet = -1)
        return

        if (mapActions.Has(currentSet)) {
            mapActions[currentSet].Call()
        } else {
            MsgBox("mapActions not found " currentSet)
        }
    }
}

Stop()
{
    global running
    running := false

    MsgBox("Auto-Click stopped!")
}

Register(name, func)
{
    global mapActions
    mapActions[name] := func
}