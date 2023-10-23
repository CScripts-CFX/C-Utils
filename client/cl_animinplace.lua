function AniminPlace(anim, time)
    if time ~= -1 then
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey(anim), time * 1000, true, false, true)
    else
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey(anim), -1, true, false, true)
    end
end

exports("AniminPlace", AniminPlace)