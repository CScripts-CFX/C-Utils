function PutOnPrisonerOutfit(source)
    TriggerClientEvent('wrp_utils:PutOnPrisonerOutfit', source)
end

RegisterServerEvent("wrp_utils:PutOnPrisonerOutfit")
AddEventHandler("wrp_utils:PutOnPrisonerOutfit", PutOnPrisonerOutfit)

exports('PutOnPrisonerOutfit', PutOnPrisonerOutfit)