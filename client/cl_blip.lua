function CreateBlip(spawn, sprite, spritescale, name)
    local blip = N_0x554d9d53f696d002(1664425300, spawn)
    SetBlipSprite(blip, sprite, 1)
    SetBlipScale(blip, spritescale)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, name)
end

exports('CreateBlip', CreateBlip)
