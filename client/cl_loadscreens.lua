RegisterNetEvent("wrp_utils:LoadScreen")
AddEventHandler("wrp_utils:LoadScreen", function(title, secondary, thirdendary, time)
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, title or "", secondary or "", thirdendary or "")

    exports.wrp_menu:CloseMenu()
    exports.wrp_status:HideHUD()
    if time then
        Wait(time * 1000)
        TriggerEvent("wrp_utils:StopLoadScreen")
    end
end)

RegisterNetEvent("wrp_utils:StopLoadScreen")
AddEventHandler("wrp_utils:StopLoadScreen", function()
    ShutdownLoadingScreen()
    while Citizen.InvokeNative(0xB54ADBE65D528FCB) do
        Wait(100)
    end
    exports.wrp_status:ShowHUD()
end)

exports("LoadScreen", function(title, secondary, thirdendary, time)
    TriggerEvent("wrp_utils:LoadScreen", title, secondary, thirdendary, time)
end)

exports("StopLoadScreen", function()
    TriggerEvent("wrp_utils:StopLoadScreen")
end)