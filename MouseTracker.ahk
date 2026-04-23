global posFile := A_ScriptDir "\positions\temp.json"
global positions := Map()
global drawList := []

SavePositions() {
    global posFile, positions

    File := FileOpen(posFile, "w")
    File.Write(JSON.Stringify(positions, 2))
    File.Close()
}

SaveMouseToSlot(slot) {
    global positions

    MouseGetPos(&x, &y)

    positions[slot] := { x: x, y: y }

    SavePositions()

    ToolTip("Saved slot " slot ": " x ", " y)
    SetTimer(() => ToolTip(), -800)
}

DrawCircle(x, y, radius := 15) {
    global drawList

    size := radius * 2

    g := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
    g.BackColor := "Lime"

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
