global posFile := A_ScriptDir "\positions\temp.json"
global positions := []
global drawList := []

SavePositions()
{
    global posFile, positions

    File := FileOpen(posFile, "w")
    File.Write(JSON.Stringify(positions, 2))
    File.Close()
}

SaveMouse()
{
    global positions

    MouseGetPos(&x, &y)

    positions.Push({ x: x, y: y })

    DrawCircle(x, y)

    SavePositions()

    ToolTip("Saved: " x ", " y)
    SetTimer(() => ToolTip(), -800)
}

ResetPositions()
{
    global positions

    positions := []

    DrawDestroy()

    ToolTip("Reset positions")
    SetTimer(() => ToolTip(), -800)
}

DrawCircle(x, y, radius := 15, color := "Lime")
{
    global drawList

    size := radius * 2

    g := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
    g.BackColor := color

    g.Show("x" (x - radius) " y" (y - radius) " w" size " h" size " NoActivate")
    WinSetRegion("0-0 w" size " h" size " E", g.Hwnd)

    drawList.Push(g)   ; save list

    return g
}

DrawDestroy()
{
    global drawList

    for _, g in drawList {
        try g.Destroy()
    }

    drawList := []   ; reset list
}
