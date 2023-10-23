function NotifyInArea(coords, range, text)
    TriggerServerEvent("c_utils:NotifyInArea", coords, range, text)
end

exports("NotifyInArea", NotifyInArea)