local input
function openLargeInput(title, yesLabel, noLabel, placeholder, noWipe, autoFill)
    if yesLabel == nil then
        yesLabel = "Submit"
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openLarge",
        title = title,
        yes = yesLabel,
        no = noLabel,
        placeholder = placeholder,
        noWipe = noWipe or false,
        autoFill = autoFill or ''
    })
end

exports('CreateLargeInput', function(...)
    openLargeInput(...)
    PlaySoundFrontend("READ", "HUD_SHOP_SOUNDSET", true, 0)
    input = nil
    repeat Wait(100) until input ~= nil
    return input
end)

RegisterNUICallback('sendLargeInput', function(data)
    SetNuiFocus(false, false)
    input = data.input
    PlaySoundFrontend("INFO_HIDE", "HUD_SHOP_SOUNDSET", true, 0)
end)

--[[ RegisterCommand("testLargeInput", function()
    local inputValue = exports.c-utils:CreateLargeInput("Enter your text:", "Submit", "Cancel", false, true)
    print(inputValue)
end, false) ]]