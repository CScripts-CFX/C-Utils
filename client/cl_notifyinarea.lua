function NotifyInArea(coords, range, text)
    TriggerServerEvent("c-utils:NotifyInArea", coords, range, text)
end

exports("NotifyInArea", NotifyInArea)