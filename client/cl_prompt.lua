local prompt = nil

function openPrompt(title, yesLabel, noLabel)
    if yesLabel == nil then
        yesLabel = "Yes"
    end
    if noLabel == nil then
        noLabel = "No"
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        title = title,
        yes = yesLabel,
        no = noLabel
    })
end

exports('CreatePrompt', function(title, yesLabel, noLabel)
    openPrompt(title, yesLabel, noLabel)
    PlaySoundFrontend("READ", "HUD_SHOP_SOUNDSET", true, 0)
    prompt = nil
    repeat Wait(100) until prompt ~= nil
    return prompt
end)

RegisterNUICallback('sendprompt', function(data)
    SetNuiFocus(false, false)
    prompt = data.prompt
    PlaySoundFrontend("INFO_HIDE", "HUD_SHOP_SOUNDSET", true, 0)
end)

--[[ RegisterCommand("testprompt", function()
    local inputValue = exports.c-utils:CreatePrompt("Enter your text:", "Submit", "Cancel")
    print(inputValue)
end, false) ]]