local infirstperson = false
function StartFirstPerson()
    Citizen.CreateThread(function()
        infirstperson = true
        while true do
            Wait(5)
            local forced = false
            if infirstperson then
                local firstperson = Citizen.InvokeNative(0x90DA5BA5C2635416) -- Is already aiming first person?
                if firstperson == true and forced == false then          -- already first and not forced
                    forced = false
                else
                    Citizen.InvokeNative(0x90DA5BA5C2635416) -- force first
                    forced = true
                end
            else
                if forced == true then                   -- Is being forced?
                    Citizen.InvokeNative(0x1CFB749AD4317BDE) -- force 3rd
                    forced = false
                    break
                end
            end
        end
    end)
end

function StopFirstPerson()
    infirstperson = false
end

exports('StartFirstPerson', StartFirstPerson)
exports('StopFirstPerson', StopFirstPerson)
