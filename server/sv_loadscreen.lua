exports('LoadScreen', function(source, title, secondary, thirdendary, time)
    TriggerClientEvent("c-utils:LoadScreen", source, title, secondary, thirdendary, time)
end)

exports('StopLoadScreen', function(source)
    TriggerClientEvent("c-utils:StopLoadScreen", source)
end)