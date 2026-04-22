CreateMenu() {
    global currentSet

    jsonText := FileRead("menu.json")
    data := JSON.Parse(jsonText)

    myMenu := Menu()

    for item in data["menu"]
    {
        name := item["name"]
        mode := item["mode"]
        myMenu.Add(name, MakeHandler(mode))
    }

    myMenu.Add() ; separator
    myMenu.Add("Cancel", (*) => Cancel())

    return myMenu
}

MakeHandler(mode) {
    return (*) => SetMode(mode)
}

SetMode(mode) {
    global currentSet
    currentSet := mode
}

Cancel() {
    global currentSet
    currentSet := -1
    MsgBox("Canceled")
}