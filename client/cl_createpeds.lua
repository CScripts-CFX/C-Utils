function SET_PED_RELATIONSHIP_GROUP_HASH(iVar0, iParam0)
    return Citizen.InvokeNative(0xC80A74AC829DDD92, iVar0, _GET_DEFAULT_RELATIONSHIP_GROUP_HASH(iParam0))
end

function _GET_DEFAULT_RELATIONSHIP_GROUP_HASH(iParam0)
    return Citizen.InvokeNative(0x3CC4A718C258BDD0, iParam0);
end

function modelrequest(model)
    Citizen.CreateThread(function()
        RequestModel(model)
    end)
end

exports('createNPC', function(model, coords, heading, animation)
    while not HasModelLoaded(GetHashKey(model)) do
        Wait(1)
        modelrequest(GetHashKey(model))
    end
    
    local npc = CreatePed(GetHashKey(model), coords, heading, false, false, false, false)
    while not DoesEntityExist(npc) do
        Wait(1)
    end

    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)

    if animation ~= nil then
        TaskStartScenarioInPlace(npc, GetHashKey(animation), -1, false, false, false)
    end

    SET_PED_RELATIONSHIP_GROUP_HASH(npc, GetHashKey(model))
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, "PLAYER")
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(model))
    SetBlockingOfNonTemporaryEvents(npc, true)
    return npc
end)
