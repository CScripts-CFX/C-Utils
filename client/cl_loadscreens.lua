RegisterNetEvent("c_utils:LoadScreen", function(title, secondary, thirdendary, time)
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, title or "", secondary or "", thirdendary or "")

    exports.c_menu:CloseMenu()
    if time then
        Wait(time * 1000)
        TriggerEvent("c_utils:StopLoadScreen")
    end
end)

RegisterNetEvent("c_utils:StopLoadScreen", function()
    ShutdownLoadingScreen()
    while Citizen.InvokeNative(0xB54ADBE65D528FCB) do
        Wait(100)
    end
end)

exports("LoadScreen", function(title, secondary, thirdendary, time)
    TriggerEvent("c_utils:LoadScreen", title, secondary, thirdendary, time)
end)

exports("StopLoadScreen", function()
    TriggerEvent("c_utils:StopLoadScreen")
end)