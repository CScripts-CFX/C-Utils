local donereading = nil
function openReadContent(title, closeButton, content)
    if closeButton == nil then
        closeButton = "Close"
    end
    SetNuiFocus(true, true)

    -- Extract the image URL from the content
    local isImage = false
    local imageUrl = ""

    local urlStart, urlEnd = string.find(content, "https?://i%.imgur%.com/[%w%-_]+%.(%a+)")
    if urlStart ~= nil and urlEnd ~= nil then
        isImage = true
        imageUrl = string.sub(content, urlStart, urlEnd)
    end

    -- Trim leading and trailing whitespace
    content = string.gsub(content, "^%s*(.-)%s*$", "%1")
    
    SendNUIMessage({
        action = "openLetter",
        title = title,
        closeButton = closeButton,
        content = content,
        isImage = isImage,
        imageUrl = imageUrl
    })
end

RegisterCommand('fuckcontent', function()
    exports.wrp_utils:CreateReadContent("fuck", "fuck", "fuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \nfuck \n")
end, false)

exports('CreateReadContent', function(title, closeButton, content)
    donereading = nil
    openReadContent(title, closeButton, content)
    PlaySoundFrontend("READ", "HUD_SHOP_SOUNDSET", true, 0)
    repeat Wait(1) until donereading ~= nil
    return donereading
end)

RegisterNUICallback('sendCloseLetter', function(data)
    SetNuiFocus(false, false)
    donereading = true
    PlaySoundFrontend("INFO_HIDE", "HUD_SHOP_SOUNDSET", true, 0)
end)