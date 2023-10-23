RegisterServerEvent("wrp_utils:NotifyInArea")
AddEventHandler("wrp_utils:NotifyInArea", function(coords, range, text)
    local _source = source

    for _, playerId in ipairs(GetPlayers()) do
        playerId = tonumber(playerId)
        local playerCoords = GetEntityCoords(GetPlayerPed(playerId))
        if playerId ~= _source and #(coords - playerCoords) < range then
            TriggerClientEvent("redem_roleplay:Tip", playerId, text, 5000)
        end
    end
end)
