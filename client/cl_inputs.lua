function openInput(title, submitLabel, cancelLabel, isNumber)
    if submitLabel == nil then
        submitLabel = "Submit"
    end
    if isNumber == nil then
        isNumber = false
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "input",
        title = title,
        submit = submitLabel,
        cancel = cancelLabel,
        isNumber = isNumber
    })
end

local input

exports('CreateInput', function(title, submitLabel, cancelLabel, isNumber)
    openInput(title, submitLabel, cancelLabel, isNumber)
    PlaySoundFrontend("READ", "HUD_SHOP_SOUNDSET", true, 0)
    input = nil
    repeat Wait(20) until input ~= nil
    if isNumber then
        input = tonumber(input)
    end
    return input
end)

RegisterNUICallback('sendinput', function(data)
    SetNuiFocus(false, false)
    input = data.input
    PlaySoundFrontend("INFO_HIDE", "HUD_SHOP_SOUNDSET", true, 0)
end)