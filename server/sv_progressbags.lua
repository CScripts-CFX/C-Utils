exports('progressBags', function(netobj, time, funcend)
    Citizen.CreateThread(function()
        local state = Entity(NetworkGetEntityFromNetworkId(netobj)).state
        local startTime = os.time() -- current time in seconds
        local endTime = startTime + time -- future time in seconds
        local nextUpdate = startTime -- when to make the next update

        -- calculate time increment for 10%
        local increment = time / 10

        -- initialize percentage
        local percentage = 0
        state.percentage = percentage -- set initial percentage

        while os.time() <= endTime do
            if os.time() >= nextUpdate and percentage < 100 then
                percentage = percentage + 10
                state.percentage = percentage -- update the growth percentage
                nextUpdate = os.time() + increment -- set the time for the next update
            end
            Wait(500) -- wait for 0.5 seconds
        end

        -- once the loop ends, set the final percentage and stage
        if percentage > 100 then
            percentage = 100
        end
        state.percentage = nil

        return funcend()
    end)
end)