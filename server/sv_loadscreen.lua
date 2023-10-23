exports('LoadScreen', function(source, title, secondary, thirdendary, time)
    TriggerClientEvent("c_utils:LoadScreen", source, title, secondary, thirdendary, time)
end)

exports('StopLoadScreen', function(source)
    TriggerClientEvent("c_utils:StopLoadScreen", source)
end)