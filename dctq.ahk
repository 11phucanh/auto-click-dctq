#Requires AutoHotkey v2.0
#include JSON.ahk
#include menu.ahk
#include actions/all.ahk
#include MouseTracker.ahk

running := false
currentSet := 1

myMenu := CreateMenu()

^Enter::
^NumpadEnter::
{
    global running
    running := true

    if (running) {
        Main()
    }
}

^`::
^0:: Stop()

^1:: SaveMouse()
^2:: ResetPositions()

^Q:: ExitAutoDCTQ()

Main()
{
    global running, mapActions, currentSet

    myMenu.Show()

    if (currentSet = -1)
    {
        return
    }

    if (mapActions.Has(currentSet))
    {
        mapActions[currentSet].Call()
    }
    else
    {
        MsgBox("mapActions not found " currentSet)
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

ExitAutoDCTQ()
{
    DrawDestroy()

    ToolTip("Exiting app...")
    
    Sleep(1000)

    ToolTip()
    
    ExitApp()
}
