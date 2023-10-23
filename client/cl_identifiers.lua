exports('getPlayerIdentifiers',
    function()                                                    -- local identifier, charid = exports.wrp_utils:getPlayerIdentifiers()
        return LocalPlayer.state.identifier, LocalPlayer.state.charid -- returns local values
    end)

CreateThread(function()
    if LocalPlayer.state.pobox then
        TriggerServerEvent("wrp_utils:getPlayerIdentifiers")
    end
end)
