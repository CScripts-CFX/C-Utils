local metercomplete = false

function progressBar(time, dict, texture)
    metercomplete = false
    local uiData = {
        imgColor =  `COLOR_GREEN`,
        isIconBackgroundVisible = 0,
        meterColor =  `COLOR_GREEN`,
        meterValue =  1.0,
        meterVisible = true,
        overlayColor =  `COLOR_GREEN`,
        overlayTxd = "scoretimer_textures",
        overlayTxn = "SCORETIMER_GENERIC_CROSS",
        overlayVisible =  false,
        secondaryImgColor = `COLOR_PURE_WHITE`,
        secondaryTxd =  0,
        secondaryTxn = 0,
        showAlternateIcons = 0,
        showBlinkIcon = 0,
        showPulse = 0,
        txd = dict,
        txn = texture,
        visible = true,
    }
    local meterData = exports["qadr_ui"]:createMeter(uiData)
    meterData:SetTimer(time)
    Wait(time * 1000)
    metercomplete = true
end

exports('progressBar', function(time, dict, texture) -- exports.wrp_utils:progressBar(time -- seconds, dict, texture)
    progressBar(time, dict, texture)

    return metercomplete
end)