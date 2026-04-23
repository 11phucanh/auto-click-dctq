
mapActions := Map() ; map set → function

#include qc_2sao.ahk
#include qc_4sao.ahk
#include giao_tranh.ahk
#include tranh_ba.ahk


LoadPositions(file_path) {
    positions := Map()

    if !FileExist(file_path)
    {
        MsgBox("JSON not found: " file_path)
        return positions
    }

    try {
        txt := FileRead(file_path)
        data := JSON.Parse(txt)

        for k, v in data
            positions[k] := v
    }
    catch as e {
        MsgBox "JSON error: " e.Message
    }

    return positions
}