exports('LoadScreen', function(source, title, secondary, thirdendary, time)
    TriggerClientEvent("wrp_utils:LoadScreen", source, title, secondary, thirdendary, time)
end)

exports('StopLoadScreen', function(source)
    TriggerClientEvent("wrp_utils:StopLoadScreen", source)
end)