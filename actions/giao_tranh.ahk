Register("giao_tranh", giao_tranh)

giao_tranh() {
    MsgBox("giao_tranh")

    posFile := A_ScriptDir "\positions\giao_tranh.json"
    positions := LoadPositions(posFile)

    pos_1 := positions["1"]
    pos_2 := positions["2"]
    pos_3 := positions["3"]
    pos_4 := positions["4"]
    pos_5 := positions["5"]

    ; Tha Tuong
    Loop 5 {
        key := String(A_Index)

        if positions.Has(key) {
            p := positions[key]
            MouseMove(p["x"], p["y"])
            DrawCircle(p["x"], p["y"], 15)
        }
    }
    
    Sleep(5000)

    DrawDestroy()
}