local promptAmount = 0
local AllPromptTable = {}

function PromptCreate(str, key, group, holdmode, enabled, onComplete)
    local prompt = PromptRegisterBegin()
    PromptSetControlAction(prompt, key)

    str = CreateVarString(10, 'LITERAL_STRING', str)

    PromptSetText(prompt, str)
    PromptSetEnabled(prompt, enabled)
    PromptSetVisible(prompt, true)

    if holdmode == "hold" then
        PromptSetHoldMode(prompt, true)
        PromptSetStandardizedHoldMode(prompt, 1)
    elseif holdmode == "standard" then
        PromptSetStandardMode(prompt, 1)
    else
        return nil
    end

    if group then
        PromptSetGroup(prompt, group)
    end

    PromptRegisterEnd(prompt)

    promptAmount = promptAmount + 1
    AllPromptTable[promptAmount] = {
        prompt = prompt,
        onComplete = onComplete
    }

    return { prompt = prompt, onComplete = onComplete }
end

exports('InteractPrompt', PromptCreate)
