local disabledControls = false
local timerfinished = false
local controls = ""

exports('disableBasicControls', function(bool, time) -- exports.c-utils:disableControls(bool, time)
    controls = "basic"
    if bool or time then
        if not time then
            disabledControls = bool
            DisableControls()
        else
            disabledControls = true
            DisableControls(time)
        end
    else
        disabledControls = bool
    end
end)

exports('disableMostControls', function(bool, time) -- exports.c-utils:disableMostControls(bool, time)
    controls = "most"
    if bool or time then
        if not time then
            disabledControls = bool
            DisableControls()
        else
            disabledControls = true
            DisableControls(time)
        end
    else
        disabledControls = bool
    end
end)

exports('disableAllControls', function(bool, time) -- exports.c-utils:disableAllControls(bool, time)
    controls = "all"
    if bool or time then
        if not time then
            disabledControls = bool
            DisableControls()
        else
            disabledControls = true
            DisableControls(time)
        end
    else
        disabledControls = bool
    end
end)

function DisableControls(time)
    --[[ Timer Implementation, in seconds ]]
    Citizen.CreateThread(function()
        if time then
            while true do
                Wait(1000)

                time = time - 1

                if time <= 0 then
                    timerfinished = true
                    break
                end
            end
        end
    end)

    --[[ Default disable controls ]]
    Citizen.CreateThread(function()
        while true do
            Wait(1)

            if timerfinished then
                controls = ""
                disabledControls = false
                timerfinished = false
                break
            end

            if disabledControls then
                if controls == "basic" then
                    DisableControlAction(0, 0xC1989F95) -- I
                    DisableControlAction(0, 0x07CE1E61) -- Left Click
                    DisableControlAction(0, 0xB2F377E8) -- F
                    DisableControlAction(0, 0xD9D0E1C0) -- Space
                    DisableControlAction(0, 0x8FFC75D6) -- Left Shift
                    DisableControlAction(0, 0xCEFD9220) -- E
                    DisableControlAction(0, 0xDB096B85) -- CTRL
                    DisableControlAction(0, 0x06052D11) -- Q
                    DisableControlAction(0, 0x27D1C284) -- R
                elseif controls == "most" then
                    DisableControlAction(0, 0xC1989F95) -- I
                    DisableControlAction(0, 0x07CE1E61) -- Left Click
                    DisableControlAction(0, 0xB2F377E8) -- F
                    DisableControlAction(0, 0xD9D0E1C0) -- Space
                    DisableControlAction(0, 0x8FFC75D6) -- Left Shift
                    DisableControlAction(0, 0xCEFD9220) -- E
                    DisableControlAction(0, 0xDB096B85) -- CTRL
                    DisableControlAction(0, 0x24978A28) -- H
                    DisableControlAction(0, 0xE31C6A41) -- M
                    DisableControlAction(0, 0x06052D11) -- Q
                    DisableControlAction(0, 0x27D1C284) -- R
                    DisableControlAction(0, 0x8AAA0AD4) -- LALT (Mouse Interaction)
                elseif controls == "all" then
                    DisableControlAction(0, 0xC1989F95) -- I
                    DisableControlAction(0, 0x07CE1E61) -- Left Click
                    DisableControlAction(0, 0xB2F377E8) -- F
                    DisableControlAction(0, 0xD9D0E1C0) -- Space
                    DisableControlAction(0, 0x8FFC75D6) -- Left Shift
                    DisableControlAction(0, 0xCEFD9220) -- E
                    DisableControlAction(0, 0xDB096B85) -- CTRL
                    DisableControlAction(0, 0x24978A28) -- H
                    DisableControlAction(0, 0xE31C6A41) -- M
                    DisableControlAction(0, 0x06052D11) -- Q
                    DisableControlAction(0, 0x27D1C284) -- R
                    DisableControlAction(0, 0x8AAA0AD4) -- LALT (Mouse Interaction)
                    DisableControlAction(0, 0x7065027D) -- A
                    DisableControlAction(0, 0xB4E465B4) -- D
                    DisableControlAction(0, 0xD27782E3) -- S
                    DisableControlAction(0, 0x8FD015D8) -- W
                end
            else
                controls = ""
                disabledControls = false
                break
            end
        end
    end)
end
