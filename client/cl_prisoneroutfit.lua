function PutOnPrisonerOutfit()
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x9925C067, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x485EE834, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x18729F39, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3107499B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3C1A74CD, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3F1F01E5, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3F7F3587, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x49C89D9B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x4A73515C, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x514ADCEA, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x5FC29285, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x79D7DF96, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x7A96FACA, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x877A2CF7, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x9B2C8B89, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xA6D134C6, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xE06D30CE, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xAF14310B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x72E6EF74, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xEABE0032, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xECC8B25A, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xF8016BCA, true, true, true)
    if IsPedMale(ped) then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x5BA76CCF, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x216612F0, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x1CCEE58D, true, true, true)
    else
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x6AB27695, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x75BC0CF5, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x14683CDF, true, true, true)
    end
end

RegisterNetEvent('wrp_utils:PutOnPrisonerOutfit')
AddEventHandler('wrp_utils:PutOnPrisonerOutfit', PutOnPrisonerOutfit)


exports('PutOnPrisonerOutfit', PutOnPrisonerOutfit)