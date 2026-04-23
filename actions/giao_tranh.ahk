Register("giao_tranh", giao_tranh)

giao_tranh() {
    global running

    posFile := A_ScriptDir "\positions\giao_tranh.json"
    data := LoadPositions(posFile)

    heroes := data["heroes"]
    troops := data.Has("troops") ? data["troops"] : []
    waitBattleEnd := data.Has("wait_battle_end") ? data["wait_battle_end"] : 20000
    postActions := data.Has("post_actions") ? data["post_actions"] : []

    ; Preview hero's positions
    for _, p in heroes
    {
        MouseMove(p["x"], p["y"])
        DrawCircle(p["x"], p["y"])
    }

    ; Preview troop's positions
    for _, p in troops
    {
        MouseMove(p["x"], p["y"])
        DrawCircle(p["x"], p["y"], 15, 0xFFA500)
    }

    ; Preview postActions's positions
    for _, p in postActions
    {
        MouseMove(p["x"], p["y"])
        DrawCircle(p["x"], p["y"], 15, "Blue")
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

    ; 15 matches
    Loop 15
    {
        if (!running)
        {
            break
        }

        MsgBox(1)

        ; heroes enter
        for _, p in heroes {
            MouseMove(p["x"], p["y"])
            Sleep(200)
            Click()
            Sleep(200)
        }
        
        ; troops enter
        for _, p in troops {
            MouseMove(p["x"], p["y"])
            Sleep(200)
            Click()
            Sleep(200)
        }

        ; wait for battle
        start := A_TickCount
        while (A_TickCount - start < waitBattleEnd)
        {
            if (!running)
            {
                break
            }

            Sleep(200)
        }

        ; Post action
        for _, act in postActions
        {
            MouseMove(act["x"], act["y"])
            Sleep(200)
            Click()
            Sleep(200)
        }
    }

    MsgBox("Finished 15 battles")
}