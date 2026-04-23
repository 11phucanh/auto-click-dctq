Register("giao_tranh", giao_tranh)

giao_tranh() {
    posFile := A_ScriptDir "\positions\giao_tranh.json"
    positions := LoadPositions(posFile)

    pos_1 := positions["1"]
    pos_2 := positions["2"]
    pos_3 := positions["3"]
    pos_4 := positions["4"]
    pos_5 := positions["5"]

    ; Hien thi vi tri
    Loop 5 {
        key := String(A_Index)
        if positions.Has(key) {
            p := positions[key]
            MouseMove(p["x"], p["y"])
            DrawCircle(p["x"], p["y"], 15)
        }
    }
    
    result := MsgBox(
        "Confirm the marked positions.`n`nPress <OK> to continue.`nPress <Cancel> to adjust.",
        "Confirmation",
        "OKCancel Icon?"
    )

    DrawDestroy()

    if (result != "OK")
    {
        return
    }

    Loop 15 {
        ; Tha Tuong
        Loop 5 {
            key := String(A_Index)

            if positions.Has(key) {
                p := positions[key]
                MouseMove(p["x"], p["y"])
                Sleep(300)
                Click()
                Sleep(300)
            }
        }
        
        ; Doi danh xong
        Sleep(25000)

        ; Ket thuc

        ; Xac nhan

        ; Tim Tran Tiep theo
    }
}