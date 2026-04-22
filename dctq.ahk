#Requires AutoHotkey v2.0
#include JSON.ahk
#include menu.ahk
#include qc_2sao.ahk
#include qc_4sao.ahk

running := false
currentSet := 1
mapFunction := Map() ; map set → function
mapFunction[1] := qc_2sao
mapFunction[2] := qc_4sao
myMenu := CreateMenu()

^Enter:: {
    global running
    running := true

    MsgBox("Auto-Click started!")

    if (running) {
        Main()
    }
}

^`:: Stop()
^0:: Stop()

Main()
{
    global running, mapFunction, currentSet


    myMenu.Show()

    while (running)
    {
        if (currentSet = -1)
        return

        if (mapFunction.Has(currentSet)) {
            mapFunction[currentSet].Call()
        } else {
            MsgBox("mapFunction not found " currentSet)
        }
    }

    MsgBox("Main stopped!")
}

Stop()
{
    global running
    running := false

    MsgBox("Auto-Click stopped!")
}