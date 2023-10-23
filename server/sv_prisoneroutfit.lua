function PutOnPrisonerOutfit(source)
    TriggerClientEvent('c-utils:PutOnPrisonerOutfit', source)
end

RegisterServerEvent("c-utils:PutOnPrisonerOutfit")
AddEventHandler("c-utils:PutOnPrisonerOutfit", PutOnPrisonerOutfit)

exports('PutOnPrisonerOutfit', PutOnPrisonerOutfit)