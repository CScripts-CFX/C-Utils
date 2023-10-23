function modelrequest(model)
    Citizen.CreateThread(function()
        RequestModel(model)
    end)
end

function SpawnProp(model, location, heading, pitch, roll, isnetwork, placeongroundproperly)
    while not HasModelLoaded(GetHashKey(model)) do
        Wait(1)
        modelrequest(GetHashKey(model))
    end

    if not isnetwork then
        isnetwork = false
    end
    local prop = CreateObject(GetHashKey(model), vector3(location), isnetwork, true, false)
    if isnetwork then
        local netid = ObjToNet(prop)
        while netid == 0 do
            Wait(1)
            netid = ObjToNet(prop)
        end
        SetNetworkIdExistsOnAllMachines(netid, true)
    end

    while not DoesEntityExist(prop) do
        Wait(1)
    end

    SetEntityLodDist(prop, 40)
    if placeongroundproperly then
        PlaceObjectOnGroundProperly(prop)
    end
    SetEntityAsMissionEntity(prop, true, true)
    FreezeEntityPosition(prop, true)
    if not pitch then
        pitch = 0.0
    end
    if not roll then
        roll = 0.0
    end
    if not heading then
        heading = 0.0
    end
    SetEntityRotation(prop, pitch, roll, heading, 0, false)
    SetModelAsNoLongerNeeded(GetHashKey(model))

    return prop
end

exports('SpawnProp', SpawnProp)
