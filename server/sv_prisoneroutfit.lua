function PutOnPrisonerOutfit(source)
    TriggerClientEvent('c_utils:PutOnPrisonerOutfit', source)
end

RegisterServerEvent("c_utils:PutOnPrisonerOutfit")
AddEventHandler("c_utils:PutOnPrisonerOutfit", PutOnPrisonerOutfit)

exports('PutOnPrisonerOutfit', PutOnPrisonerOutfit)