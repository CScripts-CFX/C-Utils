function NotifyInArea(coords, range, text)
    TriggerServerEvent("wrp_utils:NotifyInArea", coords, range, text)
end

exports("NotifyInArea", NotifyInArea)