function loadAnimDict(dict, cb)
    Citizen.CreateThread(function()
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(1)
        end
        cb()
    end)
end

function anim(dict, anim, wait, entity)
    local ped = entity or PlayerPedId()
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
        loadAnimDict(dict, function()
            if wait ~= -1 then
                TaskPlayAnim(ped, dict, anim, 1.0, 1.0, wait * 1000, 1, 0, false, false, false)
            else
                TaskPlayAnim(ped, dict, anim, 1.0, 1.0, -1, 1, 0, false, false, false)
            end
        end)
    end
end

function stopAnim(dict, anim, entity)
    local ped = entity or PlayerPedId()
    loadAnimDict(dict, function()
        StopAnimTask(ped, dict, anim, 1.0)
        Wait(100)
    end)
end

exports('anim', anim)
exports('stopAnim', stopAnim)
